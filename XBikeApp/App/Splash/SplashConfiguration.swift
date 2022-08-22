//
//  SplashConfiguration.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

class SplashConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SplashViewController()
        let router = SplashRouter(view: controller)
        let viewModel = SplashViewModel()
        
        controller.viewModel = viewModel
        controller.router = router
        return controller
    }
}
