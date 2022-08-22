//
//  HomeViewController.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class HomeViewController: UITabBarController {
	var viewModel: IHomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
		setupTabBar()
    }
    
    func setupTabBar() {
        self.tabBar.tintColor = .white
        
        let page1 = CurrentRideConfiguration.setup()
        page1.title = "Current Ride"
        page1.tabBarItem.image = UIImage(named: "icons8-bicycle-24")
        
        let page2 = MyProgressConfiguration.setup()
        page2.title = "My Progress"
        page2.tabBarItem.image = UIImage(systemName: "pencil")
        
        let viewControllers = [
            page1,
            page2
        ]
        self.tabBar.backgroundColor = .init(red: 48/255, green: 176/255, blue: 199/255, alpha: 1)
    
        self.setViewControllers(viewControllers, animated: true)
    }
}
