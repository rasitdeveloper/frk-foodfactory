//
//  AuthPageViewController.swift
//  RasitFoodFactory
//
//  Created by Rasit on 25.10.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift

class AuthVC: UIViewController {
    
    var authpagePresenterObject:ViewToPresenterAuthpageProtocol?
    
    var user = ""
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var googleAuthButtonOutlet: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthpageRouter.createModule(ref: self)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMeals" {
            let toMPVC = segue.destination as! MainpageVC
            toMPVC.name = sender as! String
        }
    }
    
    
    
    @IBAction func googleAuthButtonAction(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in

        if let error = error {
            print("authentication error \(error.localizedDescription)")
            return
        }

        guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
        else {
            return
        }

        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)
            
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("authentication error \(error.localizedDescription)")
            } else {
                print(authResult!.user.displayName!)
                self.performSegue(withIdentifier: "toMeals", sender: authResult!.user.displayName!)
            }
        }
            
        
        }
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
            self.authpagePresenterObject?.auth(email: email, password: password)
        }
        
        
    }
    
    

}


extension AuthVC : PresenterToViewAuthpageProtocol {
    func vieweVeriGonder(user: String) {
        self.user = user
        print(user)
        if user.count != 1 {
            self.performSegue(withIdentifier: "toMeals", sender: user)
        }
    }
}
