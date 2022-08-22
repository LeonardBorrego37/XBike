//
//  TimerSheetView.swift
//  XBikeApp
//
//  Created by leonard Borrego on 21/08/22.
//

import SwiftUI
import MapKit

struct TimerSheetView: View {
    @StateObject var timerCronometer: TimerCronometer
    @State var isStart: Bool = false
    @Binding var presentAlert: Bool
    @Binding var duration: String
    
    var body: some View {
        ZStack{
            VStack {
                HStack {
                    timerCronometer.hours < 10 ? Text("0\(timerCronometer.hours)") : Text("\(timerCronometer.hours)")
                    Text(":")
                    timerCronometer.minutes < 10 ? Text("0\(timerCronometer.minutes)") : Text("\(timerCronometer.minutes)")
                    Text(":")
                    timerCronometer.seconds < 10 ? Text("0\(timerCronometer.seconds)") : Text("\(timerCronometer.seconds)")
                }.font(.title)
                if !isStart {
                    Button(action: {
                        timerCronometer.startTimer()
                        isStart = true
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                            Text("Iniciar")
                                .foregroundColor(.white)
                        }
                        .padding()
                    })
                } else {
                    Button(action: {
                        duration = getDuration()
                        timerCronometer.stopTimer()
                        timerCronometer.reset()
                        presentAlert = true
                        isStart = false
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.red)
                            Text("Detener")
                                .foregroundColor(.white)
                        }
                        .padding()
                    })
                }
            }
        }
    }
    
    func getDuration() -> String {
        let hours = timerCronometer.hours < 10 ? "0\(timerCronometer.hours)" : "\(timerCronometer.hours)"
        let minutes = timerCronometer.minutes < 10 ? "0\(timerCronometer.minutes)" : "\(timerCronometer.minutes)"
        let seconds = timerCronometer.seconds < 10 ? "0\(timerCronometer.seconds)" : "\(timerCronometer.seconds)"
        return "\(hours):\(minutes):\(seconds)"
    }
}

struct AlertView: View {
    
    @Binding var removeOverlays: Bool
    @Binding var presentAlert: Bool
    @Binding var startRide: Bool
    @Binding var isDrawing: Bool
    var saveData: () -> Void
    
    var body: some View {
        
        VStack{
            Text("Desea Guardar la información de la ruta: ")
            HStack {
                Button(action: {
                    removeOverlays = true
                    presentAlert = false
                    startRide = false
                    isDrawing = false
                    saveData()
                }, label: {
                    Text("SI")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11,
                                            leading: 18,
                                            bottom: 11,
                                            trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.blue, lineWidth: 1.0)
                            .shadow(color: .white, radius: 6))
                })
                Spacer()
                
                Button(action: {
                    removeOverlays = true
                    presentAlert = false
                    startRide = false
                    isDrawing = false
                    saveData()
                }, label: {
                    Text("NO")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11,
                                            leading: 18,
                                            bottom: 11,
                                            trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.blue, lineWidth: 1.0)
                            .shadow(color: .white, radius: 6))
                })
            }.padding()
            
        }
        
    }
    
}
