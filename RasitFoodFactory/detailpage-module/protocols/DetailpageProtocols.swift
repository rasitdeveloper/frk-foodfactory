//
//  DetailpageProtocols.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

protocol ViewToPresenterDetailpageProtocol {
    var detailpageInteractor:PresenterToInteractorDetailpageProtocol? {get set}
    var detailpageView:PresenterToViewDetailpageProtocol? {get set}
    
    func addCart(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)
    
    func getCart(kullanici_adi:String)
    func detailDeleteCart(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol PresenterToInteractorDetailpageProtocol {
    var detailpagePresenter:InteractorToPresenterDetailpageProtocol? {get set}
    
    func addTheCart(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)
    
    func getTheCart(kullanici_adi:String)
    func detailDeleteTheCart(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol InteractorToPresenterDetailpageProtocol {
    func detailPresenteraVeriGonder(sepetYemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToViewDetailpageProtocol {
    func detailVieweVeriGonder(sepetYemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToRouterDetailpageProtocol {
    static func createModule(ref:DetailVC)
}
