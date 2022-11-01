//
//  Personpage.swift
//  RasitFoodFactory
//
//  Created by Rasit on 29.10.2022.
//

import Foundation

protocol ViewToPresenterPersonpageProtocol {
    var personpageInteractor:PresenterToInteractorPersonpageProtocol? {get set}
    var personpageView:PresenterToViewPersonpageProtocol? {get set}
    
    func getOrders(name:String)
}

protocol PresenterToInteractorPersonpageProtocol {
    var personpagePresenter:InteractorToPresenterPersonpageProtocol? {get set}
    
    func getAllOrders(name:String)
}

protocol InteractorToPresenterPersonpageProtocol {
    func presenteraVeriGonder(gecmisSiparislerListesi:Array<GecmisSiparisler>)
}

protocol PresenterToViewPersonpageProtocol {
    func vieweVeriGonder(gecmisSiparislerListesi:Array<GecmisSiparisler>)
}

protocol PresenterToRouterPersonpageProtocol {
    static func createModule(ref:PersonVC)
}
