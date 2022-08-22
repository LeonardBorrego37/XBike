//
//  GeneralRoute.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case home
    case page
}

extension GeneralRoute {
    var module: UIViewController? {
        switch self {
        case .home:
            return HomeConfiguration.setup()
        case .page:
            return PageConfiguration.setup()
        }
    }
}
