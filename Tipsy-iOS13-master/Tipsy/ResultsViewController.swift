//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 김희진 on 2022/05/15.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var totalLable: UILabel!
    @IBOutlet var settinLabel: UILabel!
    var result = "0.0"

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLable.text = result
    }
    
    @IBAction func recaculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
