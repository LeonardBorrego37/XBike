//
//  SplashViewController.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import SwiftUI
import SwiftfulLoadingIndicators

protocol ISplashViewController: AnyObject {
	var router: ISplashRouter? { get set }
}

class SplashViewController: UIViewController {
	var viewModel: ISplashViewModel?
	var router: ISplashRouter?
    
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: "bike")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        
        let loading = UIHostingController(rootView: LoadingView())
        loadingView.addSubview(loading.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if let viewModel = self.viewModel {
                viewModel.isFirstTime() ? self.router?.navigateToPager() : self.router?.navigateToHome()
            }
        }
    }
}

extension SplashViewController: ISplashViewController {
	// do someting...
}

// MARK: - Business logic
extension SplashViewController {
	// do someting...
}
