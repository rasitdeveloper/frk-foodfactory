//
//  ViewController.swift
//  RasitFoodFactory
//
//  Created by Rasit on 17.10.2022.
//

import UIKit
import Kingfisher

class MainpageVC: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainPageVCFoodCV: UICollectionView!
    
    var yemeklerListe = [Yemekler]()
    var sepetYemeklerListe = [SepetYemekler]()
    var dizi1 = [String]()
    var dizi2 = [Int]()
    
    var name = ""
    
    var mainpagePresenterObject:ViewToPresenterMainpageProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        
        searchBar.delegate = self
        
        mainPageVCFoodCV.delegate = self
        mainPageVCFoodCV.dataSource = self
        
        MainpageRouter.createModule(ref: self)
        
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        mainpagePresenterObject?.getFoods()
        mainpagePresenterObject?.mainpageGetCart(kullanici_adi: name)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! DetailVC
            gidilecekVC.yemek = yemek
            gidilecekVC.name = name
        }
        if segue.identifier == "toPerson" {
            let gidilecekVC = segue.destination as! PersonVC
            gidilecekVC.name = name
        }
        if segue.identifier == "toCart" {
            let gidilecekVC = segue.destination as! CartVC
            gidilecekVC.kullanici_adi = name
        }
    }


}

extension MainpageVC : PresenterToViewMainpageProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.mainPageVCFoodCV.reloadData()
        }
    }
    func vieweVeriGonder(sepetYemeklerListesi: Array<SepetYemekler>) {
        self.sepetYemeklerListe = sepetYemeklerListesi
        DispatchQueue.main.async {
            // self.mainPageVCFoodCV.reloadData()
        }
    }
    
}


extension MainpageVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            searchBar.endEditing(true)
        }
        mainpagePresenterObject?.searchFood(aramaKelimesi: searchText)
    }
}

extension MainpageVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let yemek = yemeklerListe[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainPageFoodCVCIdent", for: indexPath) as! MainpageVCFoodCVC
        
        /*
        DispatchQueue.main.async {
            for x in self.sepetYemeklerListe {
                if x.yemek_adi == yemek.yemek_adi {
                    print("\(x.yemek_adi) - \(yemek.yemek_adi)")
                    cell.mainPageQuantityLabel.text = x.yemek_siparis_adet
                    break
                }
            }
        }
        */
        
        // cell.mainPageCVImageView.backgroundColor = UIColor.green
        cell.mainPageFoodName.text = yemek.yemek_adi
        cell.mainPageFoodPrice.text = "\(yemek.yemek_fiyat!) TL"
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.mainPageCVImageView.kf.setImage(with: url)
            }
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: yemek)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

