//
//  SplashViewModel.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

protocol ISplashViewModel: AnyObject {
	var parameters: [String: Any]? { get set }
    func isFirstTime() -> Bool
}

class SplashViewModel: ISplashViewModel {
    var parameters: [String: Any]?

    func isFirstTime() -> Bool {
        if UserDefaultManager.getObject(key: Constants.isFirstTimeKey) == nil {
            UserDefaultManager.save(key: Constants.isFirstTimeKey, data: false)
            return true
        } else {
            return false
        }
    }
}
