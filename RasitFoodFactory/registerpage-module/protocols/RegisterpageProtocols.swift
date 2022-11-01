//
//  RegisterpageProtocols.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation

protocol ViewToPresenterRegisterpageProtocol {
    var registerpageInteractor:PresenterToInteractorRegisterpageProtocol? {get set}
    var registerpageView:PresenterToViewRegisterpageProtocol? {get set}
    
    func register(email:String,password:String)
}

protocol PresenterToInteractorRegisterpageProtocol {
    var registerpagePresenter:InteractorToPresenterRegisterpageProtocol? {get set}
    
    func registerUser(email:String,password:String)
}

protocol InteractorToPresenterRegisterpageProtocol {
    func presenteraVeriGonder(user:String)
}

protocol PresenterToViewRegisterpageProtocol {
    func vieweVeriGonder(user:String)
}

protocol PresenterToRouterRegisterpageProtocol {
    static func createModule(ref:RegisterVC)
}


/*
protocol ViewToPresenterRegisterpageProtocol {
    var registerpageInteractor:PresenterToInteractorRegisterpageProtocol? {get set}
    
    func register(email:String,password:String)
}

protocol PresenterToInteractorRegisterpageProtocol {
    
    func registerUser(email:String,password:String)
}


protocol PresenterToRouterRegisterpageProtocol {
    static func createModule(ref:RegisterVC)
}
*/
