//
//  PersonpageInteractor.swift
//  RasitFoodFactory
//
//  Created by Rasit on 29.10.2022.
//

import Foundation
import Alamofire

class PersonpageInteractor:PresenterToInteractorPersonpageProtocol {
    var personpagePresenter: InteractorToPresenterPersonpageProtocol?
    
    var gecmisSiparislerListe = [GecmisSiparisler]()
    
    func getAllOrders(name:String) {
        gecmisSiparislerListe = []
        let params:Parameters = ["name":name]
        AF.request("https://frk-ios-foodfactory.herokuapp.com/order-history/al", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        for dic in json {
                            self.gecmisSiparislerListe.append(GecmisSiparisler(dic))
                        }
                        
                        self.personpagePresenter?.presenteraVeriGonder(gecmisSiparislerListesi: self.gecmisSiparislerListe)
                        
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
