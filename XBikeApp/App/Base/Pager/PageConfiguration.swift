//
//  PageConfiguration.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

class PageConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = PageViewController()
        let router = PageRouter(view: controller)
        
        controller.router = router
        return controller
    }
}
