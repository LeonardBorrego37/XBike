//
//  OnboardingViewController.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol IOnboardingViewController: AnyObject {
	var router: IOnboardingRouter? { get set }
}

final class OnboardingViewController: UIViewController {
	var router: IOnboardingRouter?
    
    static let identifier = "OnboardingViewController"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLAbel: UILabel!
    private var titleImage: String?
    private var descriptionTitle: String?
    
    init(titleImage: String, descriptionTitle: String) {
        super.init(nibName: OnboardingViewController.identifier, bundle: nil)
        self.titleImage = titleImage
        self.descriptionTitle = descriptionTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
		setup()
    }
    
    func setup(){
        self.descriptionLAbel.text = self.descriptionTitle
        self.image.image = UIImage(named: self.titleImage ?? "")
    }
}

