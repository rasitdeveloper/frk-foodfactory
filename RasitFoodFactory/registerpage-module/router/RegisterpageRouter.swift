//
//  RegisterpageRouter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation

class RegisterpageRouter : PresenterToRouterRegisterpageProtocol {
    static func createModule(ref: RegisterVC) {
        let presenter = RegisterpagePresenter()
        
        ref.registerpagePresenterObject = presenter
        
        ref.registerpagePresenterObject?.registerpageInteractor = RegisterpageInteractor()
        ref.registerpagePresenterObject?.registerpageView = ref
        
        ref.registerpagePresenterObject?.registerpageInteractor?.registerpagePresenter = presenter
    }
}
