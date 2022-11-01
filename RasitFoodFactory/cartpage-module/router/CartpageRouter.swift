//
//  MainpageRouter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

class CartpageRouter {
    static func createModule(ref: CartVC) {
        let presenter = CartpagePresenter()
        ref.cartPagePresenterObject = presenter
        ref.cartPagePresenterObject?.cartpageInteractor = CartpageInteractor()
        ref.cartPagePresenterObject?.cartpageView = ref
        ref.cartPagePresenterObject?.cartpageInteractor?.cartpagePresenter = presenter
    }
}
