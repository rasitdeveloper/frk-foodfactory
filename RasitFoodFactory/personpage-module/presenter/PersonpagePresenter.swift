//
//  PersonpagePresenter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 29.10.2022.
//

import Foundation

class PersonpagePresenter:ViewToPresenterPersonpageProtocol {
    var personpageInteractor: PresenterToInteractorPersonpageProtocol?
    var personpageView: PresenterToViewPersonpageProtocol?
    
    func getOrders(name:String) {
        personpageInteractor?.getAllOrders(name: name)
    }
}

extension PersonpagePresenter : InteractorToPresenterPersonpageProtocol {
    func presenteraVeriGonder(gecmisSiparislerListesi: Array<GecmisSiparisler>) {
        personpageView?.vieweVeriGonder(gecmisSiparislerListesi: gecmisSiparislerListesi)
    }
}
