//
//  AuthpageProtocols.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation

protocol ViewToPresenterAuthpageProtocol {
    var authpageInteractor:PresenterToInteractorAuthpageProtocol? {get set}
    var authpageView:PresenterToViewAuthpageProtocol? {get set}
    
    func auth(email:String,password:String)
}

protocol PresenterToInteractorAuthpageProtocol {
    var authpagePresenter:InteractorToPresenterAuthpageProtocol? {get set}
    
    func authUser(email:String,password:String)
}

protocol InteractorToPresenterAuthpageProtocol {
    func presenteraVeriGonder(user:String)
}

protocol PresenterToViewAuthpageProtocol {
    func vieweVeriGonder(user:String)
}

protocol PresenterToRouterAuthpageProtocol {
    static func createModule(ref:AuthVC)
}
