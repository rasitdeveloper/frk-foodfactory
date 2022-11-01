//
//  CartpagePresenter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

class CartpagePresenter : ViewToPresenterCartpageProtocol {
    var cartpageInteractor: PresenterToInteractorCartpageProtocol?
    var cartpageView: PresenterToViewCartpageProtocol?
    
    func addPastOrder(name:String, context: String, totalPrice: String, date: String) {
        cartpageInteractor?.addThePastOrder(name:name, context: context, totalPrice: totalPrice, date: date)
    }
    
    func showCart(kullanici_adi: String) {
        cartpageInteractor?.showTheCart(kullanici_adi: kullanici_adi)
    }
    
    func deleteCart(sepet_yemek_id: Int, kullanici_adi: String) {
        cartpageInteractor?.deleteTheCart(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}

extension CartpagePresenter : InteractorToPresenterCartpageProtocol {
    func sendDataToPresenter(sepetYemeklerListesi: Array<SepetYemekler>) {
        cartpageView?.sendDataToView(sepetYemeklerListesi: sepetYemeklerListesi)
    }
}
