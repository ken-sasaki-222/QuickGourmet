//
//  QuickSearchView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/02.
//

import SwiftUI

struct QuickSearchView: View {
    @State private var isTapActive = false
    @State private var isShowsAlert = false
    @State private var isShowsPopUp = false
    @State private var isShowsLocationSettingView = false
    @State private var currentOffset = CGFloat()
    @State private var closeOffset = CGFloat()
    @State private var openOffset = CGFloat()
    @State private var index = 0
    private let quickSearchVM = QuickSearchViewModel()
    private let locatePermissionVM = LocatePermissionViewModel()

    private let quickSearchImages = ["food_izakaya", "food_baru", "food_sousaku", "food_wasyoku", "food_yosyoku", "food_italia", "food_tyuka", "food_yakiniku", "food_asia", "food_kakukoku", "food_karaoke", "food_bar", "food_ramen", "food_cafe", "food_other", "food_okonomiyaki", "food_korea"]

    private let quickSearchTextes = ["居酒屋", "ダイニングバー・バル", "創作料理", "和食", "洋食", "イタリアン・フレンチ", "中華", "焼肉・ホルモン", "アジア・エスニック料理", "各国料理", "カラオケ・パーティ", "バー・カクテル", "ラーメン", "カフェ・スイーツ", "その他グルメ", "お好み焼き・もんじゃ", "韓国料理"]

    init() {
        NavigationManager().setNavigation()
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                NavigationView {
                    ScrollView {
                        ZStack {
                            ZStack {
                                VStack(spacing: 10) {
                                    ForEach(0 ..< quickSearchImages.count) { index in
                                        NavigationLink(destination: QuickSearchListView(quickSearchVM: quickSearchVM), isActive: $isTapActive) {}
                                        Button(action: {
                                            onTapQuickSearchRow()
                                        }) {
                                            QuickSearchRowView(imageString: quickSearchImages[index], genreName: quickSearchTextes[index], width: geometry.size.width * 0.9)
                                        }
                                        .alert(isPresented: $isShowsAlert) {
                                            Alert(title: Text("確認"), message: Text("あなたの現在地から徒歩圏内のお店を検索するためには、位置情報がONである必要があります。"), dismissButton: .default(Text("OK")) {
                                                quickSearchVM.goToLocationSetting()
                                            })
                                        }
                                    }
                                    .edgesIgnoringSafeArea(.bottom)
                                }
                                .navigationTitle("食いっく検索")
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarItems(leading: Button(action: {
                                    toggleHamburgerMenu()
                                }) {
                                    Image("hamburger_menu_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                })
                            }
                            ColorManager.black.opacity(Double((closeOffset - currentOffset) / closeOffset) - 0.1
                            )
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                toggleHamburgerMenu()
                            }
                        }
                    }
                    .background(ColorManager.baseColor)
                }
                .onAppear {
                    quickSearchVM.requestIDFA()
                    quickSearchVM.askForReview()
                }
                PopupWindowView(show: $isShowsPopUp, searchAction: { selection in
                    communicateQuickSearchVM(index: index, selection: selection)
                    isTapActive = true
                })
                HamburgerMenuView()
                    .frame(width: geometry.size.width * 0.5)
                    .onAppear(perform: {
                        setHumburgerMenuPosition(viewWidth: geometry.size.width)
                    })
                    .offset(x: self.currentOffset)
                    .animation(.default)
            }
            .fullScreenCover(isPresented: $isShowsLocationSettingView) {
                LocatePermissionView()
            }
        }
        .accentColor(ColorManager.font_white)
    }

    private func setHumburgerMenuPosition(viewWidth: CGFloat) {
        currentOffset = (viewWidth / 2) * -1 + ((viewWidth * 0.5) / 2) * -1
        closeOffset = currentOffset
        openOffset = ((viewWidth / 2) * -1) + ((viewWidth * 0.5) / 2)
    }

    private func toggleHamburgerMenu() {
        if currentOffset == closeOffset {
            currentOffset = openOffset
        } else {
            currentOffset = closeOffset
        }
    }

    private func communicateQuickSearchVM(index: Int, selection: Int) {
        quickSearchVM.genreIndex = index
        quickSearchVM.pickerSelection = selection
        Task {
            await quickSearchVM.getShopData()
        }
    }

    private func onTapQuickSearchRow() {
        let status = locatePermissionVM.getStatus()
        switch status {
        case .notDetermined:
            isShowsAlert = true
        case .restricted:
            isShowsAlert = true
        case .denied:
            isShowsAlert = true
        case .authorizedAlways:
            isShowsAlert = false
            openPopUp()
        case .authorizedWhenInUse:
            isShowsAlert = false
            openPopUp()
        case .authorized:
            isShowsAlert = false
            openPopUp()
        case .unknown:
            break
        }
    }

    private func openPopUp() {
        withAnimation {
            isShowsPopUp = true
            self.index = index
        }
    }
}

struct QuickSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchView()
    }
}
