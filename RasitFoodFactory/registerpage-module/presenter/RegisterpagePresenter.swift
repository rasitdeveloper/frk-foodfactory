//
//  RegisterpagePresenter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation

class RegisterpagePresenter : ViewToPresenterRegisterpageProtocol {
    var registerpageInteractor: PresenterToInteractorRegisterpageProtocol?
    var registerpageView: PresenterToViewRegisterpageProtocol?
    
    func register(email: String, password: String) {
        registerpageInteractor?.registerUser(email: email, password: password)
    }
    
}

extension RegisterpagePresenter : InteractorToPresenterRegisterpageProtocol {
    func presenteraVeriGonder(user:String) {
        registerpageView?.vieweVeriGonder(user: user)
    }
}
