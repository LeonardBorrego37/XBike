//
//  MyProgressView.swift
//  XBikeApp
//
//  Created by leonard Borrego on 20/08/22.
//

import SwiftUI
import MapKit

struct MyProgressView: View {
    
    @State var data: [Route]?
    @State var points: [String: Any]?
    
    init() {
        getActivities()
    }
    
    var body: some View {
        ScrollView{
            VStack {
                Text("Registro de rutas: ")
                if let data = data {
                    ForEach(data, id: \.self) { element in
                        DetailRoute(date: "\(String(describing: element.date))", duration: element.duration ?? "", points: getPoints(json: element.points ?? "") ?? [])
                    }
                } else {
                    Text("No posee ninguna actividad registrada.")
                }
            }
        }
        .onAppear {
            getActivities()
        }
    }
    
    func getActivities() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            self.data = try context.fetch(Route.fetchRequest())
        } catch {
            print("ERROR")
        }
    }
    
    func getPoints(json: String) -> [RoutePoints]? {
        guard let data = json.replacingOccurrences(of: "\\", with: "", options: NSString.CompareOptions.literal, range: nil).data(using: .utf8) else { return nil }
        do {
            return try JSONDecoder().decode([RoutePoints].self, from: data)
        } catch {}
        return nil
    }
}

struct MyProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MyProgressView()
    }
}

struct DetailRoute: View {
    
    var points: [RoutePoints]
    var date: String
    var duration: String
    @StateObject var locationViewModel = LocationViewModel()
    
    init(date: String, duration: String, points: [RoutePoints]) {
        self.date = date
        self.duration = duration
        self.points = points
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $locationViewModel.region)
            Text("Date: \(date)")
            Text("Duration: \(duration)")
        }
        .padding()
        .border(.blue)
    }
}
