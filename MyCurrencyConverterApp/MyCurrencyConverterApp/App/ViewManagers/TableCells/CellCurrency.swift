//
//  CellCurrency.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import UIKit

class CellCurrency: UITableViewCell {
    
    @IBOutlet weak var landscape: UIImageView!
    @IBOutlet weak var mask: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    @IBOutlet weak var flag: UIImageView!
}