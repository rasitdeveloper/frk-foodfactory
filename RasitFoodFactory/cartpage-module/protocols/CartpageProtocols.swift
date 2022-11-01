//
//  CartpageProtocols.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

protocol ViewToPresenterCartpageProtocol {
    var cartpageInteractor:PresenterToInteractorCartpageProtocol? {get set}
    var cartpageView:PresenterToViewCartpageProtocol? {get set}
    
    func addPastOrder(name:String, context:String, totalPrice:String, date:String)
    func showCart(kullanici_adi:String)
    func deleteCart(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol PresenterToInteractorCartpageProtocol {
    var cartpagePresenter:InteractorToPresenterCartpageProtocol? {get set}
    
    func addThePastOrder(name:String, context:String, totalPrice:String, date:String)
    func showTheCart(kullanici_adi:String)
    func deleteTheCart(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol InteractorToPresenterCartpageProtocol {
    func sendDataToPresenter(sepetYemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToViewCartpageProtocol {
    func sendDataToView(sepetYemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToRouterCartpageProtocol {
    static func createModule(ref:CartVC)
}
