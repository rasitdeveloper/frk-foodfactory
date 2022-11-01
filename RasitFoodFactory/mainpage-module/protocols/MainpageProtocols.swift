//
//  MainpageProtocols.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

protocol ViewToPresenterMainpageProtocol {
    var mainpageInteractor:PresenterToInteractorMainpageProtocol? {get set}
    var mainpageView:PresenterToViewMainpageProtocol? {get set}
    
    func mainpageGetCart(kullanici_adi:String)
    func getFoods()
    func searchFood(aramaKelimesi:String)
}

protocol PresenterToInteractorMainpageProtocol {
    var mainpagePresenter:InteractorToPresenterMainpageProtocol? {get set}
    
    func mainpageGetTheCart(kullanici_adi:String)
    func getAllFood()
    func searchTheFood(aramaKelimesi:String)
}

protocol InteractorToPresenterMainpageProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
    func presenteraVeriGonder(sepetYemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToViewMainpageProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
    func vieweVeriGonder(sepetYemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToRouterMainpageProtocol {
    static func createModule(ref:MainpageVC)
}
