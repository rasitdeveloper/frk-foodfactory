//
//  PersonpageRouter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 29.10.2022.
//

import Foundation

class PersonpageRouter : PresenterToRouterPersonpageProtocol {
    static func createModule(ref: PersonVC) {
        let presenter = PersonpagePresenter()
        
        ref.personpagePresenterObject = presenter
        
        ref.personpagePresenterObject?.personpageInteractor = PersonpageInteractor()
        ref.personpagePresenterObject?.personpageView = ref
        
        ref.personpagePresenterObject?.personpageInteractor?.personpagePresenter = presenter
    }
}
