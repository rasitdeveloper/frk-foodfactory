//
//  RegisterVC.swift
//  RasitFoodFactory
//
//  Created by Rasit on 31.10.2022.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registerpagePresenterObject:ViewToPresenterRegisterpageProtocol?
    
    var user = ""
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordFirstTF: UITextField!
    @IBOutlet weak var passwordSecondTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterpageRouter.createModule(ref: self)
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func registerButtonAction(_ sender: Any) {
        if let email = emailTF.text, let password = passwordFirstTF.text {
            self.registerpagePresenterObject?.register(email: email, password: password)
        }
        
    }

    
}


extension RegisterVC : PresenterToViewRegisterpageProtocol {
    func vieweVeriGonder(user: String) {
        self.user = user
        if user.count != 1 {
            print(user)
            navigationController?.popViewController(animated: true)
        }
    }
}
