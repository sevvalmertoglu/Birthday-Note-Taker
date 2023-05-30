//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Şevval Mertoğlu on 5.04.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting - as? vs. as!
        // as? : do it if you can
        // as! : you can for sure (force casting)
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name") //for small data logging (UserDefaults)
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameTextField.text!)" // Using variables in strings
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // "" vs. nil
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }

    }
    
    
}

