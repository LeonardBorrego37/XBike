//
//  CurrentRideView.swift
//  XBikeApp
//
//  Created by leonard Borrego on 20/08/22.
//

import SwiftUI
import MapKit
import PartialSheet

protocol MakeRideDelegate {
    func drawingPoint()
}

struct CurrentRideView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    @State var locations = [CLLocationCoordinate2D]()
    @State var isStartRide = false
    @State var start = false
    @State var isInitialPoint = false
    @State var presentAlert = false
    @State var removeOverlay = false
    @State var isDrawing = false
    @State var data: [Route]?
    @State var duration: String = ""
    
    var body: some View {
        ZStack{
            VStack {
                MapView(isDrawing: $isDrawing,
                        isRemoveOverlays: $removeOverlay,
                        userLocation: $locationViewModel.userLocation.center,
                        isInitialPoint: $isInitialPoint,
                        points: $locations)
                    .ignoresSafeArea()
                    .task {
                        locationViewModel.checkUserAuthorization()
                    }
                
                if !locationViewModel.userHasLocation {
                    Text("Localización NO Aceptada ❌")
                        .bold()
                        .padding(.top, 12)
                    Link("Pulsa para aceptar la autorización de Localización", destination: URL(string: UIApplication.openSettingsURLString)!)
                        .padding(32)
                }
                
                if isStartRide {
                    TimerSheetView(timerCronometer: locationViewModel.timerCronometer!, presentAlert: $presentAlert, duration: $duration)
                }
            }
            .onReceive(locationViewModel.$action) { action in
                if action {
                    createOtherPoint()
                }
            }
            
            HStack {
                Spacer()
                VStack{
                    Button(action: {
                        isStartRide.toggle()
                        isDrawing = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                    
                    Spacer()
                }
            }.partialSheet(isPresented: $presentAlert) {
                AlertView(removeOverlays: $removeOverlay, presentAlert: $presentAlert, startRide: $isStartRide, isDrawing: $isDrawing, saveData: self.saveData)
            }
        }

    }
    
    func createOtherPoint() {
        if locations.last?.longitude != locationViewModel.userLocation.center.longitude && locations.last?.latitude != locationViewModel.userLocation.center.latitude {
            let initialAnnotation = CLLocationCoordinate2D(latitude: locationViewModel.userLocation
                .center.latitude, longitude: locationViewModel.userLocation.center.longitude)
            isInitialPoint = false
            self.locations.append(initialAnnotation)
        }
    }
    
    func saveData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newRoute = Route(context: context)
        newRoute.id = UUID()
        newRoute.date = Date(timeIntervalSinceReferenceDate: -123456789.0)
        newRoute.duration = self.duration
        newRoute.points = wrapperLocation()        
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    func wrapperLocation() -> String {
        var string = ""
        for element in locations {
            if !string.isEmpty {
                string += ", "
            }
            let string2 = "\"fdfggdf\""
            print(string2.replacingOccurrences(of: "\\", with: "", options: NSString.CompareOptions.literal, range: nil))
            string += "{\"latitude\": \(element.latitude), \"longitude\": \(element.longitude) }"
        }
        string = "[\(string.replacingOccurrences(of: "\\", with: "", options: NSString.CompareOptions.literal, range: nil))]"
        print(string)
        return string
    }
}

class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
