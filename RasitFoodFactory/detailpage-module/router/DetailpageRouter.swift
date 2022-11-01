//
//  DetailpageRouter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation

class DetailpageRouter {
    static func createModule(ref: DetailVC) {
        let presenter = DetailpagePresenter()
        ref.detailPagePresenterObject = presenter
        ref.detailPagePresenterObject?.detailpageInteractor = DetailpageInteractor()
        ref.detailPagePresenterObject?.detailpageView = ref
        ref.detailPagePresenterObject?.detailpageInteractor?.detailpagePresenter = presenter
        /*
        ref.detailPagePresenterObject = DetailpagePresenter()
        ref.detailPagePresenterObject?.detailpageInteractor = DetailpageInteractor()
        */
    }
}
