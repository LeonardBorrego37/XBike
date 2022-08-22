//
//  CurrentRideConfiguration.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import SwiftUI
import PartialSheet

class CurrentRideConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = UIHostingController(rootView: CurrentRideView().attachPartialSheetToRoot())
        let manager = CurrentRideManager()
        
        return controller
    }
}
