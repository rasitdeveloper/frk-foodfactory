//
//  AuthpageRouter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation

class AuthpageRouter : PresenterToRouterAuthpageProtocol {
    static func createModule(ref: AuthVC) {
        let presenter = AuthpagePresenter()
        
        ref.authpagePresenterObject = presenter
        
        ref.authpagePresenterObject?.authpageInteractor = AuthpageInteractor()
        ref.authpagePresenterObject?.authpageView = ref
        
        ref.authpagePresenterObject?.authpageInteractor?.authpagePresenter = presenter
    }
}
