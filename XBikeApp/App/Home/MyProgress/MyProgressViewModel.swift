//
//  MyProgressViewModel.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.

protocol IMyProgressViewModel: AnyObject {
	var parameters: [String: Any]? { get set }
}

class MyProgressViewModel: IMyProgressViewModel {
    var manager: IMyProgressManager?
    var parameters: [String: Any]?

    init(manager: IMyProgressManager) {
    	self.manager = manager
    }
}
