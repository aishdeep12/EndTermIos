//
//  ViewController.swift
//  EndTerm
//
//  Created by macbook on 2019-12-04.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var EmailLabel: UITextField!
    @IBOutlet weak var PasswordLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        
        
        Auth.auth().createUser(withEmail: EmailLabel.text!, password: PasswordLabel.text!){ (user, error) in
            if error == nil {self.performSegue(withIdentifier: "SignUp", sender: self)
            
        }
              else{let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                 let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

                  alertController.addAction(defaultAction)
                  self.present(alertController, animated: true, completion: nil)
                     }
                          }
                    }
    
    
    @IBAction func Login(_ sender: Any) {
        Auth.auth().signIn(withEmail: EmailLabel.text!, password: PasswordLabel.text!) { (user, error) in
                      if error == nil{
                        self.performSegue(withIdentifier: "Login", sender: self)
                                     }
                       else{
                         let alertController = UIAlertController(title: "Error", message:error?.localizedDescription, preferredStyle: .alert)
                         let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                    
                          alertController.addAction(defaultAction)
                                                self.present(alertController, animated: true, completion: nil)}
                             

    }
    
        
     
}
   

}

