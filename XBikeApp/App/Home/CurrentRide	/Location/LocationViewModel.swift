//
//  LocationViewModel.swift
//  XBikeApp
//
//  Created by leonard Borrego on 20/08/22.
//

import CoreLocation
import MapKit

final class LocationViewModel: NSObject, ObservableObject {
    private let locationManager: CLLocationManager = .init()
    @Published var userLocation: MKCoordinateRegion = .init()
    @Published var userHasLocation: Bool = false
    @Published var timerCronometer: TimerCronometer?
    @Published var action: Bool = false
    @Published var region: MKCoordinateRegion!
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        userLocation = .init(center: CLLocationCoordinate2D(latitude: userLocation.center.latitude,
                                                            longitude: userLocation.center.longitude),
                             span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
        timerCronometer = TimerCronometer(delegate: self)
        
        region =  MKCoordinateRegion(center: userLocation.center, span: MKCoordinateSpan(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
    
    func checkUserAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
        case .authorized, .authorizedAlways, .authorizedWhenInUse:
            userHasLocation = true
            break
        case .denied, .notDetermined, .restricted:
            print("User no ha autorizado mostrar su localización")
            userHasLocation = false
        @unknown default:
            print("Unhandled state")
        }
    }
    
    func createAnnotation(isInitial: Bool) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = userLocation.center
        annotation.title = "Punto de partida"
        return annotation
    }
}

extension LocationViewModel: MakeRideDelegate {
    func drawingPoint() {
        self.objectWillChange.send()
        action = true
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("Location \(location)")
        userLocation = .init(center: location.coordinate,
                             span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserAuthorization()
    }
}
