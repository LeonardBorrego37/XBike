//
//  CurrentRideModel.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import MapKit

struct RoutePoints: Codable {
    var latitude: String
    var longitude: String
}

struct Span {
    static let delta = 0.1
}

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}

struct BikeRide {
    var initialLocation: Location
    var finishLocation: Location
}


