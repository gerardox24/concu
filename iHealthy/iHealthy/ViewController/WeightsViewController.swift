//
//  WeightsViewController.swift
//  iHealthy
//
//  Created by Gerardo Ramos on 7/5/19.
//  Copyright © 2019 Gerardo Ramos. All rights reserved.
//

import UIKit

class WeightsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var weightsTableView: UITableView!
    
    //var weights: [String : Any] = [:]
    var weights: [Any] = []
    var defaults = UserDefaults.standard
    
    var weight : String = ""
    var comment : String = ""
    var date: Date = Date()
    
    struct Health: Codable {
        var weight: String
        var comment: String
        var date: Date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadWeights()
    }
    
    func loadWeights() {
        self.weights = defaults.object(forKey: "weights") as? [Any] ?? [Any]()
        print(weights)
        print(self.weights)
        /*if let savedHealth = defaults.object(forKey: "weights") as? Data {
            let decoder = JSONDecoder()
            if let loadedHealth = try? decoder.decode(Health.self, from: savedHealth) {
                print(loadedHealth.date)
            }
        }*/
        self.weightsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weightCell") as! WeightsTableViewCell
        cell.weightLabel = weights[0] as? UIView
        cell.commentLabel = weights[1] as? UIView
        cell.dateLabel = weights[2] as? UIView
        return cell
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
