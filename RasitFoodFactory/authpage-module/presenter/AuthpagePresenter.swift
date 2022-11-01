//
//  AuthpagePresenter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation

class AuthpagePresenter : ViewToPresenterAuthpageProtocol {
    var authpageInteractor: PresenterToInteractorAuthpageProtocol?
    var authpageView: PresenterToViewAuthpageProtocol?
    
    func auth(email: String, password: String) {
        authpageInteractor?.authUser(email: email, password: password)
    }
    
}

extension AuthpagePresenter : InteractorToPresenterAuthpageProtocol {
    func presenteraVeriGonder(user:String) {
        authpageView?.vieweVeriGonder(user: user)
    }
}
