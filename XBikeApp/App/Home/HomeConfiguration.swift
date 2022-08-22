//
//  HomeConfiguration.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

class HomeConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = HomeViewController()
        let manager = HomeManager()
        let viewModel = HomeViewModel(manager: manager)
        
        controller.viewModel = viewModel
        return controller
    }
}
