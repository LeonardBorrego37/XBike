//
//  SplashRouter.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ISplashRouter: AnyObject {
	func navigateToPager()
    func navigateToHome()
}

class SplashRouter: ISplashRouter {	
	weak var view: SplashViewController?
	
	init(view: SplashViewController?) {
		self.view = view
	}
    
    func navigateToPager() {
        self.view?.navigate(type: .root, module: GeneralRoute.page)
    }
    
    func navigateToHome() {
        self.view?.navigate(type: .root, module: GeneralRoute.home)
    }
}
