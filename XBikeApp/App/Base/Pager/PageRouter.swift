//
//  PageRouter.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IPageRouter: AnyObject {
	func navigateToHome()
}

class PageRouter: IPageRouter {	
	weak var view: PageViewController?
	
	init(view: PageViewController?) {
		self.view = view
	}
    
    func navigateToHome() {
        self.view?.navigate(type: .root, module: GeneralRoute.home)
    }
}
