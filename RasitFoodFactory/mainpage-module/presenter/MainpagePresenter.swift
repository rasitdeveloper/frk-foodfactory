//
//  MainpagePresenter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

class MainpagePresenter : ViewToPresenterMainpageProtocol {
    var mainpageInteractor: PresenterToInteractorMainpageProtocol?
    var mainpageView: PresenterToViewMainpageProtocol?
    
    func getFoods() {
        mainpageInteractor?.getAllFood()
    }
    
    func searchFood(aramaKelimesi: String) {
        mainpageInteractor?.searchTheFood(aramaKelimesi: aramaKelimesi)
    }
    
    func mainpageGetCart(kullanici_adi: String) {
        mainpageInteractor?.mainpageGetTheCart(kullanici_adi: kullanici_adi)
    }
    
}

extension MainpagePresenter : InteractorToPresenterMainpageProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        mainpageView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
    func presenteraVeriGonder(sepetYemeklerListesi:Array<SepetYemekler>) {
        mainpageView?.vieweVeriGonder(sepetYemeklerListesi: sepetYemeklerListesi)
    }
}
