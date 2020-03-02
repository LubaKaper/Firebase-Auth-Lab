//
//  ViewController.swift
//  Firebase-Auth-Lab
//
//  Created by Liubov Kaper  on 3/1/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

enum AccountState {
    case existingUser
    case newUser
}

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var accountStateLabel: UILabel!
    
    @IBOutlet weak var accountStateButton: UIButton!
    
    private var accountState: AccountState = .existingUser
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearErrorLabel()
    }
    
    private func clearErrorLabel() {
      errorLabel.text = ""
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    

    @IBAction func toggleAccountButton(_ sender: UIButton) {
        // change the account login state
        accountState = accountState == .existingUser ? .newUser : .existingUser
        // duration of animation
        let duration: TimeInterval = 1
        
        if accountState == .existingUser {
            UIView.transition(with: view, duration: duration, options: [.transitionFlipFromLeft], animations: {
                self.loginButton.setTitle("Login", for: .normal)
                self.accountStateLabel.text = "Don't have an account? Click"
                self.accountStateButton.setTitle("SIGNUP", for: .normal)
            }, completion: nil)
            
        } else {
            UIView.transition(with: view, duration: duration, options: [.transitionFlipFromRight], animations: {
              self.loginButton.setTitle("Sign Up", for: .normal)
              self.accountStateLabel.text = "Already have an account?"
              self.accountStateButton.setTitle("LOGIN", for: .normal)
            }, completion: nil)
        }
    }
    
}
