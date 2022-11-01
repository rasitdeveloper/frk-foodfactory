//
//  RegisterpageInteractor.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import Foundation
import Alamofire

class RegisterpageInteractor : PresenterToInteractorRegisterpageProtocol {
    var registerpagePresenter: InteractorToPresenterRegisterpageProtocol?
    
    
    func registerUser(email: String, password: String) {
        
        let params:Parameters = ["email":email,"password":password]
        AF.request("https://frk-ios-foodfactory.herokuapp.com/auth-user/register", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    // self.userList.append(User(data))
                    
                    /*
                    var jsonString = String(data: data, encoding: .utf8)
                    jsonString?.append("dasdsa")
                    print(jsonString)
                    */
                    if let convertedData = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                        self.registerpagePresenter?.presenteraVeriGonder(user: convertedData["user"] as! String)
                    }
                        
                    
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
