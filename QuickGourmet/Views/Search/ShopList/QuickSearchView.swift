//
//  QuickSearchView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/02.
//

import CoreLocation
import SwiftUI

struct QuickSearchView: View {
    @State private var isTapActive = false
    @State private var isShowsAlert = false
    @State private var isShowsPopUp = false
    @State private var currentOffset = CGFloat()
    @State private var closeOffset = CGFloat()
    @State private var openOffset = CGFloat()
    @State private var index = 0
    private let quickSearchVM = QuickSearchViewModel()
    private let userDefaultsDataStore = UserDefaultsDataStore()
    private let locationManager = CLLocationManager()

    private let quickSearchImages = ["food_izakaya", "food_baru", "food_sousaku", "food_wasyoku", "food_yosyoku", "food_italia", "food_tyuka", "food_yakiniku", "food_asia", "food_kakukoku", "food_karaoke", "food_bar", "food_ramen", "food_cafe", "food_other", "food_okonomiyaki", "food_korea"]

    private let quickSearchTextes = ["居酒屋", "ダイニングバー・バル", "創作料理", "和食", "洋食", "イタリアン・フレンチ", "中華", "焼肉・ホルモン", "アジア・エスニック料理", "各国料理", "カラオケ・パーティ", "バー・カクテル", "ラーメン", "カフェ・スイーツ", "その他グルメ", "お好み焼き・もんじゃ", "韓国料理"]

    // searchTODO: 距離指定ではなく徒歩００分で指定させる
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                NavigationView {
                    ScrollView {
                        ZStack {
                            ZStack {
                                VStack(spacing: 10) {
                                    ForEach(0 ..< quickSearchImages.count) { index in
                                        NavigationLink(destination: SearchListView(quickSearchVM: quickSearchVM), isActive: $isTapActive) {}
                                        Button(action: {
                                            switch locationManager.authorizationStatus {
                                            case .notDetermined: // 許諾とっていない
                                                isShowsAlert = true
                                            case .denied: // 許可されていない
                                                isShowsAlert = true
                                            default:
                                                isShowsAlert = false
                                                withAnimation(.linear(duration: 0.3)) {
                                                    isShowsPopUp = true
                                                    self.index = index
                                                }
                                            }
                                        }) {
                                            QuickSearchRowView(imageString: quickSearchImages[index], genreName: quickSearchTextes[index])
                                        }
                                        .alert(isPresented: $isShowsAlert) {
                                            Alert(title: Text("確認"), message: Text("位置情報を許可してください"), dismissButton: .default(Text("OK")) {
                                                quickSearchVM.goToLocationSetting()
                                            })
                                        }
                                    }
                                    .edgesIgnoringSafeArea(.bottom)
                                }
                                .navigationTitle("食いっくグルメ")
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarItems(leading: Button(action: {
                                    toggleHamburgerMenu()
                                }) {
                                    Image("hamburger_menu_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                })
                            }
                            Color.black.opacity(Double((closeOffset - currentOffset) / closeOffset) - 0.1
                            )
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                toggleHamburgerMenu()
                            }
                        }
                    }
                }
                .onAppear {
                    quickSearchVM.requestIDFA()
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
                // 申請許可後コメントイン
                // NendBannerView()
            }
        }
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
        quickSearchVM.latitude = userDefaultsDataStore.latitudeInformation
        quickSearchVM.longitude = userDefaultsDataStore.longitudeInformation
        quickSearchVM.genreIndex = index
        quickSearchVM.pickerSelection = selection
        quickSearchVM.callShopSearchFetcher()
    }
}

struct QuickSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchView()
    }
}
