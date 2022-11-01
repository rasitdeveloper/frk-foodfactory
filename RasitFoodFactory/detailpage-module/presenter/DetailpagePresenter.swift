//
//  DetailpagePresenter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

class DetailpagePresenter : ViewToPresenterDetailpageProtocol {
    var detailpageInteractor: PresenterToInteractorDetailpageProtocol?
    var detailpageView: PresenterToViewDetailpageProtocol?
    
    func addCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        detailpageInteractor?.addTheCart(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    func getCart(kullanici_adi: String) {
        detailpageInteractor?.getTheCart(kullanici_adi: kullanici_adi)
    }
    
    func detailDeleteCart(sepet_yemek_id: Int, kullanici_adi: String) {
        detailpageInteractor?.detailDeleteTheCart(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}

extension DetailpagePresenter : InteractorToPresenterDetailpageProtocol {
    func detailPresenteraVeriGonder(sepetYemeklerListesi: Array<SepetYemekler>) {
        detailpageView?.detailVieweVeriGonder(sepetYemeklerListesi: sepetYemeklerListesi)
    }
}
