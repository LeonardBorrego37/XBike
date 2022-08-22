//
//  HomeViewModel.swift
//  XBikeApp
//
//  Created by leonard Borrego on 19/08/22.

protocol IHomeViewModel: AnyObject {
	var parameters: [String: Any]? { get set }
}

class HomeViewModel: IHomeViewModel {
    var manager: IHomeManager?
    var parameters: [String: Any]?

    init(manager: IHomeManager) {
    	self.manager = manager
    }
}
