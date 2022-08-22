//
//  OnboardingRouter.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IOnboardingRouter: AnyObject {
	// do someting...
}

class OnboardingRouter: IOnboardingRouter {	
	weak var view: OnboardingViewController?
	
	init(view: OnboardingViewController?) {
		self.view = view
	}
}
