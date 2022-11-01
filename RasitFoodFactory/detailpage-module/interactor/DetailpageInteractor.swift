//
//  DetailpageInteractor.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation
import Alamofire


class DetailpageInteractor : PresenterToInteractorDetailpageProtocol {
    var detailpagePresenter: InteractorToPresenterDetailpageProtocol?
    
    func addTheCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        /* print("Add to cart : \(yemek_adi) - \(yemek_resim_adi) - \(yemek_fiyat) - \(yemek_siparis_adet) - \(kullanici_adi)")
        */
        let params:Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
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
    
    func getTheCart(kullanici_adi: String) {
        // print("Kullanici adi : \(kullanici_adi)")
        // let kullanici_adi = "rasit"
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    if let liste = cevap.sepet_yemekler {
                        self.detailpagePresenter?.detailPresenteraVeriGonder(sepetYemeklerListesi: liste)
                    }
                }catch{
                    let yemek_sepet_listesi = [SepetYemekler]()
                    self.detailpagePresenter?.detailPresenteraVeriGonder(sepetYemeklerListesi: yemek_sepet_listesi)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func detailDeleteTheCart(sepet_yemek_id: Int, kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    // self.showTheCart(kullanici_adi: "rasit")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
