//
//  LoginViewController.swift
//  WeatherForecast
//
//  Created by Mauricio Fernandez Mora on 24/6/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loginBtn.layer.cornerRadius = 7
        self.loginBtn.clipsToBounds = true
    }
    
    @IBAction func firebaseLogin(_ sender: Any) {
        
        guard let email = emailText.text, let password = passwordText.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
            print("There was an error:")
                print(error.localizedDescription)
            let alert = UIAlertController(title: "Error", message: "Login failed", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when){
              alert.dismiss(animated: true, completion: nil)
            }
          } else {
            print("User signs in successfully")
            self.dismiss(animated: true, completion: nil)
          }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
