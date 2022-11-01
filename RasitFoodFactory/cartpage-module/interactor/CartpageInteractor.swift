//
//  MainpageRouter.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation
import Alamofire

class CartpageInteractor:PresenterToInteractorCartpageProtocol {
    var cartpagePresenter: InteractorToPresenterCartpageProtocol?
    /*
    func showTheCart(kullanici_adi: String) {
        var liste = [SepetYemekler]()
        let sy1 = SepetYemekler(sepet_yemek_id: "1", yemek_adi: "ad1", yemek_resim_adi: "1", yemek_fiyat: "11", yemek_siparis_adet: "1", kullanici_adi: "rasit")
        let sy2 = SepetYemekler(sepet_yemek_id: "2", yemek_adi: "ad2", yemek_resim_adi: "2", yemek_fiyat: "22", yemek_siparis_adet: "2", kullanici_adi: "rasit")
        let sy3 = SepetYemekler(sepet_yemek_id: "3", yemek_adi: "ad3", yemek_resim_adi: "3", yemek_fiyat: "33", yemek_siparis_adet: "3", kullanici_adi: "rasit")
        liste.append(sy1)
        liste.append(sy2)
        liste.append(sy3)
        cartpagePresenter?.sendDataToPresenter(sepetYemeklerListesi: liste)
    }
    */
    
    func addThePastOrder(name:String, context: String, totalPrice: String, date: String) {
        let params:Parameters = ["name":name,"context":context,"totalPrice":totalPrice,"date":date]
        AF.request("https://frk-ios-foodfactory.herokuapp.com/order-history/gonder", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func showTheCart(kullanici_adi: String) {
        // print("Kullanici adi : \(kullanici_adi)")
        // let kullanici_adi = "rasit"
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    if let liste = cevap.sepet_yemekler {
                        self.cartpagePresenter?.sendDataToPresenter(sepetYemeklerListesi: liste)
                    }
                }catch{
                    let yemek_sepet_listesi = [SepetYemekler]()
                    self.cartpagePresenter?.sendDataToPresenter(sepetYemeklerListesi: yemek_sepet_listesi)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteTheCart(sepet_yemek_id: Int, kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    self.showTheCart(kullanici_adi: "rasit")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
