//
//  MapView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/23.
//

import SwiftUI
import MapKit

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var region = MKCoordinateRegion() // 座標領域
    @State private var userTrackingMode: MapUserTrackingMode = .none
    var coordinate: CLLocationCoordinate2D? // 表示領域の中心位置
    var latitude: Double // 緯度
    var longitude: Double // 経度
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .all,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode,
            annotationItems: [
                PinItem(coordinate: .init(latitude: latitude, longitude: longitude))
            ],
            annotationContent: { item in
                MapMarker(coordinate: item.coordinate)
            })
            .onAppear {
                setRegion(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            }
            .frame(height: 300)
    }
    
    // 引数で取得した緯度経度を使って動的に表示領域の中心位置と、縮尺を決める
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.0009, longitudeDelta: 0.0009)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: mockShopesData[0].results.shop[0].lat, longitude: mockShopesData[0].results.shop[0].lng)
    }
}
