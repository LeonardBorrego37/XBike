//
//  MapView.swift
//  XBikeApp
//
//  Created by leonard Borrego on 21/08/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    @Binding var isDrawing: Bool
    @Binding var isRemoveOverlays: Bool
    @Binding var userLocation: CLLocationCoordinate2D
    @Binding var isInitialPoint: Bool
    @Binding var points: [CLLocationCoordinate2D]
    @State var initialAnnotation: MKAnnotation?
    @State var map: UIViewType = UIViewType()
    @State var initialPosition: CLLocationCoordinate2D? = nil
    
    
    func makeUIView(context: Context) -> UIViewType {
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.setUserTrackingMode(.follow, animated: true)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude), span: MKCoordinateSpan(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
        map.setRegion(region, animated: true)
        return map
    }
    
    func drawingRoute() {
        let currentPosition = CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude)
        if initialPosition != nil {
            if currentPosition.latitude == initialPosition?.latitude && currentPosition.longitude == initialPosition?.longitude {
                return
            }
            let coords: [CLLocationCoordinate2D] = [initialPosition ?? CLLocationCoordinate2D(), currentPosition]
            let line = MKPolyline.init(coordinates: coords, count: coords.count)
            map.addOverlay(line)
        }
        
        initialPosition = currentPosition
    }
    
    func removeOverlays() {
        map.removeOverlays(map.overlays)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if isRemoveOverlays {
            removeOverlays()
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var map: MapView
        var isFirstTime = false
        
        init(_ map: MapView) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            print("E usuario se ha movido")
            if map.isDrawing {
                map.isRemoveOverlays = false
                map.drawingRoute()
            }
        }
    }
}
