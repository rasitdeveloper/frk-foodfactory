//
//  CartVC.swift
//  RasitFoodFactory
//
//  Created by Rasit on 17.10.2022.
//

import UIKit
import Kingfisher

class CartVC: UIViewController {
    
    @IBOutlet weak var cartVCTotalPriceLabel: UILabel!
    @IBOutlet weak var cartVCTableView: UITableView!
    @IBOutlet weak var cartVCConfirmCartButtonOutlet: UIButton!
    
    var cartPagePresenterObject:ViewToPresenterCartpageProtocol?
    
    var total_price = 0
    var kullanici_adi = ""
    
    var sepet_yemek_listesi = [SepetYemekler]()
    
    var context = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartVCTableView.delegate = self
        cartVCTableView.dataSource = self
        
        CartpageRouter.createModule(ref: self)
        
        // cartPagePresenterObject?.showCart(kullanici_adi: kullanici_adi)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartPagePresenterObject?.showCart(kullanici_adi: kullanici_adi)
    }
    
    
    
    @IBAction func cartVCConfirmCartButtonAction(_ sender: Any) {
        for x in sepet_yemek_listesi {
            context.append("\(x.yemek_siparis_adet!)|\(x.yemek_adi!)  ")
        }
        print(context)
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let now = dateFormatter.string(from: date)
        cartPagePresenterObject?.addPastOrder(name:kullanici_adi, context: context, totalPrice: String(total_price), date: now)
        
        for x in sepet_yemek_listesi {
            DispatchQueue.main.async {
                self.cartPagePresenterObject?.deleteCart(sepet_yemek_id: Int(x.sepet_yemek_id!)!, kullanici_adi: self.kullanici_adi)
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    

}

extension CartVC : PresenterToViewCartpageProtocol {
    func sendDataToView(sepetYemeklerListesi: Array<SepetYemekler>) {
        /*
        for x in sepetYemeklerListesi {
            print("\(x.sepet_yemek_id!) - \(x.yemek_adi!)")
        }
        */
        total_price = 0
        for y in sepetYemeklerListesi {
            total_price = total_price + Int(y.yemek_siparis_adet!)! * Int(y.yemek_fiyat!)!
        }
        cartVCTotalPriceLabel.text = "\(total_price) TL"
        
        self.sepet_yemek_listesi = sepetYemeklerListesi
        DispatchQueue.main.async {
            self.cartVCTableView.reloadData()
        }
        
    }
}

extension CartVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepet_yemek_listesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = sepet_yemek_listesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartVCcartTVCIdent", for: indexPath) as! CartVCCartTVC
        // total_price = total_price + Int(sepet.yemek_siparis_adet!)! * Int(sepet.yemek_fiyat!)!
        
        cell.cartVCNameTable.text = sepet.yemek_adi
        cell.cartVCquantityTextField.text = sepet.yemek_siparis_adet
        cell.cartVCTVPrice.text = "\(sepet.yemek_fiyat!) TL "
        
        cell.cartVCTVTotalLabel.text = "Total: \(Int(sepet.yemek_siparis_adet!)! * Int(sepet.yemek_fiyat!)!)"
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.cartVCImageViewTable.kf.setImage(with: url)
            }
        }
        cartVCTotalPriceLabel.text = "\(total_price) TL"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let sepet = sepet_yemek_listesi[indexPath.row]
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(sepet.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "Iptal", style: .cancel){action in
                
            }
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.cartPagePresenterObject?.deleteCart(sepet_yemek_id: Int(sepet.sepet_yemek_id!)!, kullanici_adi: self.kullanici_adi)
            }
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
