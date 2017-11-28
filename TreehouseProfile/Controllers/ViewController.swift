//
//  ViewController.swift
//  TreehouseProfile
//
//  Created by Addison Francisco on 10/18/17.
//  Copyright © 2017 Addison Francisco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var didGetData: Bool = false
    let dataFetcher = ProfileDataFetcher()
    
    @IBOutlet weak var buttonSubTextLabel: UILabel!
    
    @IBAction func doItButton(_ sender: UIButton) {
        if !didGetData {
            sender.isEnabled = false
            
            dataFetcher.fetchData() { () in
                self.didGetData = true
                
                DispatchQueue.main.async {
                    self.buttonSubTextLabel.isHidden = false
                    print("Did the thing: \(self.didGetData)")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSubTextLabel.isHidden = true
    }
}

