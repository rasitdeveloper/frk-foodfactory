//
//  DetailViewController.swift
//  RasitFoodFactory
//
//  Created by Rasit on 17.10.2022.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var foodDetailImageView: UIImageView!
    @IBOutlet weak var foodDetailName: UILabel!
    @IBOutlet weak var foodDetailPrice: UILabel!
    @IBOutlet weak var foodDetailQuantity: UILabel!
    @IBOutlet weak var foodDetailPriceInCart: UILabel!
    @IBOutlet weak var foodDetailStepper: UIStepper!
    @IBOutlet weak var foodDetailAddToCartButtonOutlet: UIBarButtonItem!
    
    var price = 0
    var quantity = 0
    var priceincart = 0
    var firstQuantity = 0
    var cartid = 0
    
    var yemek:Yemekler?
    var yemek_sepet_listesi = [SepetYemekler]()
    
    var name = ""
    
    var detailPagePresenterObject:ViewToPresenterDetailpageProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodDetailAddToCartButtonOutlet.isEnabled = false
        if let y = yemek {
            foodDetailName.text = y.yemek_adi
            // price = Int(y.yemek_fiyat!)!
            foodDetailPrice.text = "\(y.yemek_fiyat!) TL"
            // foodDetailQuantity.text = "Quantity: \(Int(self.foodDetailStepper.minimumValue))"
            // foodDetailPriceInCart.text = "0 TL"
            /*
            foodDetailPriceInCart.text = String(Int(Int(y.yemek_fiyat!)*Int(self.foodDetailStepper.minimumValue)))
            */
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.foodDetailImageView.kf.setImage(with: url)
                }
            }
        }
        /*
        if let y = yemek, let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi ?? "baklava")") {
            DispatchQueue.main.async {
                self.foodDetailImageView.kf.setImage(with: url)
            }
        }
        */
        DetailpageRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailPagePresenterObject?.getCart(kullanici_adi: name)
    }
    
    
    
    @IBAction func foodDetailStepperAction(_ sender: Any) {
        quantity = Int(foodDetailStepper.value)
        priceincart = quantity * price
        foodDetailQuantity.text = "Quantity: \(quantity)"
        foodDetailPriceInCart.text = "Price in cart : \(priceincart)"
        
        if firstQuantity == 0 && quantity == 0 {
            foodDetailAddToCartButtonOutlet.isEnabled = false
        } else if firstQuantity == 0 && quantity != 0 {
            foodDetailAddToCartButtonOutlet.isEnabled = true
        } else if firstQuantity != 0 && quantity == 0 {
            foodDetailAddToCartButtonOutlet.isEnabled = true
        } else if firstQuantity != 0 && quantity != 0 {
            if firstQuantity == quantity {
                foodDetailAddToCartButtonOutlet.isEnabled = false
            } else {
                foodDetailAddToCartButtonOutlet.isEnabled = true
            }
        }
        
        // firstQuantity == quantity
        
    }
    
    
    @IBAction func foodDetailAddToCartButton(_ sender: Any) {
        
        let kullanici_adi = name
        
        if firstQuantity == 0 {
            if let yemek_adi = foodDetailName.text, let yemek_resim_adi = yemek, let yemek_fiyat = yemek?.yemek_fiyat, let yemek_siparis_adet = foodDetailStepper {
                detailPagePresenterObject?.addCart(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi.yemek_resim_adi!, yemek_fiyat: Int(yemek_fiyat)!, yemek_siparis_adet: Int(yemek_siparis_adet.value), kullanici_adi: kullanici_adi)
            }
        } else {
            if quantity == 0 {
                self.detailPagePresenterObject?.detailDeleteCart(sepet_yemek_id: cartid, kullanici_adi: name)
            } else {
                self.detailPagePresenterObject?.detailDeleteCart(sepet_yemek_id: cartid, kullanici_adi: name)
                if let yemek_adi = foodDetailName.text, let yemek_resim_adi = yemek, let yemek_fiyat = yemek?.yemek_fiyat, let yemek_siparis_adet = foodDetailStepper {
                    detailPagePresenterObject?.addCart(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi.yemek_resim_adi!, yemek_fiyat: Int(yemek_fiyat)!, yemek_siparis_adet: Int(yemek_siparis_adet.value), kullanici_adi: kullanici_adi)
                }
            }
            
        }
        
        
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
    

}

extension DetailVC : PresenterToViewDetailpageProtocol {
    func detailVieweVeriGonder(sepetYemeklerListesi: Array<SepetYemekler>) {
        price = Int(yemek!.yemek_fiyat!)!
        quantity = 0
        priceincart = quantity * price
        foodDetailStepper.value = Double(quantity)
        foodDetailQuantity.text = "Quantity: \(quantity)"
        foodDetailPriceInCart.text = "Price in cart : \(priceincart)"
        for x in sepetYemeklerListesi {
            if self.yemek?.yemek_adi == x.yemek_adi {
                foodDetailAddToCartButtonOutlet.title = "Update Cart"
                firstQuantity = Int(x.yemek_siparis_adet!)!
                price = Int(x.yemek_fiyat!)!
                quantity = Int(x.yemek_siparis_adet!)!
                priceincart = quantity * price
                foodDetailStepper.value = Double(quantity)
                foodDetailQuantity.text = "Quantity: \(quantity)"
                foodDetailPriceInCart.text = "Price in cart : \(priceincart)"
                cartid = Int(x.sepet_yemek_id!)!
            }
        }
        self.yemek_sepet_listesi = sepetYemeklerListesi
    }
}
