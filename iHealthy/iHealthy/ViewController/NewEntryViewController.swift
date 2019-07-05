//
//  NewEntryViewController.swift
//  iHealthy
//
//  Created by Gerardo Ramos on 7/4/19.
//  Copyright © 2019 Gerardo Ramos. All rights reserved.
//

import UIKit

class NewEntryViewController: UIViewController {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    var defaults = UserDefaults.standard
    //var weights: [Health] = []
    var weights: [Any] = []
    
    struct Health: Codable {
        var weight: String
        var comment: String
        var date: Date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightTextField.delegate = self
        commentTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        //var weights = NSKeyedUnarchiver.unarchiveObject(with: defaults.object(forKey: "weights") as! Data) as! [Health]
        
        loadHealths()
        
        let weight = weightTextField.text
        let comment = commentTextField.text
        let date = Date()
        
        /*let health = Health(
            weight: weight!,
            comment: comment!,
            date: date)*/
        let health = [
            weight ?? "",
            comment ?? "",
            date
            ] as [Any]
        
        self.weights.append(health)
        defaults.set(self.weights, forKey: "weights")
        
        /*let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(health) {
            defaults.set(encoded, forKey: "weights")
        }*/
        
        /*if let savedHealth = defaults.object(forKey: "weights") as? Data {
            let decoder = JSONDecoder()
            if let loadedHealth = try? decoder.decode(Health.self, from: savedHealth) {
                print(loadedHealth.date)
            }
        }*/
        
        //performSegue(withIdentifier: "NewEntry", sender: self)
        //let newWeight = Health(json: [
        //    "weight" : weight!,
        //    "comment": comment!,
        //    "date"   : date])
        //weights.append(newWeight)
        
        //let encodedData  = NSKeyedArchiver.archivedData(withRootObject: weights)
        //defaults.set(encodedData, forKey: "weights")
    }
    
    func loadHealths(){
        self.weights = defaults.object(forKey: "weights") as? [Any] ?? [Any]()
    }

}

extension NewEntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
