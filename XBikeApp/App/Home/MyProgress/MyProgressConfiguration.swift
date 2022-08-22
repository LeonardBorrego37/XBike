//
//  MyProgressConfiguration.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import SwiftUI

class MyProgressConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = UIHostingController(rootView: MyProgressView())
        let manager = MyProgressManager()
        let viewModel = MyProgressViewModel(manager: manager)
        
        return controller
    }
}
