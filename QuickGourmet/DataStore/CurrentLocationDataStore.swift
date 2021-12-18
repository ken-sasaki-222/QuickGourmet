//
//  CurrentLocationDataStore.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import CoreLocation

protocol CurrentLocationDataStoreDelegate: AnyObject {
    func updatedLocation(lat: Double, lng: Double)
    func didFailUpdateLocation()
}

class CurrentLocationDataStore: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    private var requestCallback: ((LocationStatusType) -> Void)?
    weak var delegate: CurrentLocationDataStoreDelegate?
    var statusType: LocationStatusType

    override init() {
        locationManager = CLLocationManager()
        statusType = .unknown
        super.init()
        locationManager.delegate = self
    }

    func requestWhenInUse(complication: @escaping (LocationStatusType) -> Void) {
        locationManager.requestWhenInUseAuthorization()
        requestCallback = complication
    }

    func startUpdateLocation() {
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus

        switch status {
        case .notDetermined:
            statusType = .notDetermined
        case .restricted:
            statusType = .restricted
        case .denied:
            statusType = .denied
        case .authorizedAlways:
            statusType = .authorizedAlways
        case .authorizedWhenInUse:
            statusType = .authorizedWhenInUse
        case .authorized:
            statusType = .authorized
        default:
            statusType = .unknown
        }

        requestCallback?(statusType) // ここで返却
        requestCallback = nil
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else {
            return
        }

        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(
            newLocation.coordinate.latitude,
            newLocation.coordinate.longitude
        )

        print("緯度: ", location.latitude, "経度: ", location.longitude)

        locationManager.stopUpdatingLocation()
        delegate?.updatedLocation(lat: location.latitude, lng: location.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager did fail with error:", error)
        print("LocationManager localize error:", error.localizedDescription)
        locationManager.stopUpdatingLocation()
        delegate?.didFailUpdateLocation()
    }
}
