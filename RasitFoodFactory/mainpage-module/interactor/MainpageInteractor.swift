//
//  MainpageInteractor.swift
//  RasitFoodFactory
//
//  Created by Rasit on 18.10.2022.
//

import Foundation
import Alamofire

class MainpageInteractor : PresenterToInteractorMainpageProtocol {
    var mainpagePresenter: InteractorToPresenterMainpageProtocol?
    
    var newList = [Yemekler]()
    
    func getAllFood() {
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler {
                        self.mainpagePresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func searchTheFood(aramaKelimesi: String) {
        print(aramaKelimesi)
        newList = []
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler {
                        if aramaKelimesi != "" {
                            for x in liste {
                                if (x.yemek_adi!.lowercased().contains(aramaKelimesi.lowercased())) {
                                    self.newList.append(x)
                                }
                            }
                            self.mainpagePresenter?.presenteraVeriGonder(yemeklerListesi: self.newList)
                        } else  {
                            self.mainpagePresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                        }
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func mainpageGetTheCart(kullanici_adi: String) {
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    if let liste = cevap.sepet_yemekler {
                        self.mainpagePresenter?.presenteraVeriGonder(sepetYemeklerListesi: liste)
                    }
                }catch{
                    let yemek_sepet_listesi = [SepetYemekler]()
                    self.mainpagePresenter?.presenteraVeriGonder(sepetYemeklerListesi: yemek_sepet_listesi)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
