//
//  PersonVC.swift
//  RasitFoodFactory
//
//  Created by Rasit on 25.10.2022.
//

import UIKit

class PersonVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var personTV: UITableView!
    
    
    var personpagePresenterObject:ViewToPresenterPersonpageProtocol?
    var gecmisSiparislerListe = [GecmisSiparisler]()
    
    
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        personTV.delegate = self
        personTV.dataSource = self
        
        PersonpageRouter.createModule(ref: self)
        
        titleLabel.text = name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        personpagePresenterObject?.getOrders(name: name)
    }
    

}

extension PersonVC : PresenterToViewPersonpageProtocol {
    func vieweVeriGonder(gecmisSiparislerListesi: Array<GecmisSiparisler>) {
        self.gecmisSiparislerListe = gecmisSiparislerListesi
        DispatchQueue.main.async {
            self.personTV.reloadData()
        }
        
    }
}

extension PersonVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gecmisSiparislerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let siparis = gecmisSiparislerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTVCC", for: indexPath) as! PersonTVC
        
        cell.contentLabel.text = siparis.context
        cell.priceLabel.text = "\(siparis.totalPrice) TL"
        cell.dateLabel.text = siparis.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
