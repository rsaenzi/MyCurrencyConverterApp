//
//  ScreenConverter.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/5/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class ScreenConverter: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    
    @IBOutlet weak var textfieldDollars: UITextField!
    @IBOutlet weak var tableCurrencies: UITableView!
    
    private var validDollarsValue: Float = 1.0
    
    
    // --------------------------------------------------
    // ViewController
    // --------------------------------------------------
    
    override func viewWillAppear(animated: Bool) {
        getRates()
    }
    
    
    // --------------------------------------------------
    // Events
    // --------------------------------------------------
    
    @IBAction func onTapConvert(sender: UIButton, forEvent event: UIEvent) {
        getRates()
    }
    
    @IBAction func onEndEditDollars(sender: UITextField, forEvent event: UIEvent) {
        getRates()
    }
    
    private func getRates(){
        
        // Hides the keyboard
        textfieldDollars.resignFirstResponder()
        
        // If textbox is empty, we place a default value
        if textfieldDollars.text?.characters.count == 0{
            textfieldDollars.text = "1"
        }
        
        // Check if textfield input is a valid number
        if CurrencyConverter.app.control.valid.isStringOnlyNumeric(textfieldDollars.text!) == true {
            
            // Saves the new amount of dollars
            self.validDollarsValue = Float(textfieldDollars.text!)!
            
            // Update the currency values, using current rates
            self.updateVisibleRates()
            
            // Make a request to get the exchange rates
            CurrencyConverter.app.brules.rates.executeRule(self) { (response) in
                
                // Update the currency values, using new rates
                self.updateVisibleRates()
            }
        }
    }
    
    
    private func updateVisibleRates(){
        
        // Get all visible rows
        if let visibleRowIds = self.tableCurrencies.indexPathsForVisibleRows {
            for cellIndex in visibleRowIds {
                
                // Get the current cell
                let cell = self.tableCurrencies.cellForRowAtIndexPath(cellIndex) as! CellCurrency
                
                // Get the current Currency
                let currency = CurrencyConverter.app.model.currencies[cellIndex.row]
                
                // Calculates the currency using the exchange rate
                let value: Float = self.validDollarsValue * currency.rate
                
                // Updates the values
                cell.value.text = "\(currency.code.rawValue) \(value)"
                cell.rate.text  = "Rate: \(String(currency.rate))"
            }
        }
    }
    
    
    
    // --------------------------------------------------
    // Table View
    // --------------------------------------------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrencyConverter.app.model.currencies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Dequeue the cell prototype
        let cell = tableView.dequeueReusableCellWithIdentifier("CellCurrency", forIndexPath: indexPath) as! CellCurrency
        
        // Get the current Currency
        let currency = CurrencyConverter.app.model.currencies[indexPath.row]
        
        // Calculates the currency using the exchange rate
        let value: Float = self.validDollarsValue * currency.rate
        
        // Load images
        cell.landscape.image = currency.landscape
        cell.flag.image      = currency.flag
        
        // Set values
        cell.name.text  = currency.name
        cell.value.text = "\(currency.code.rawValue) \(value)"
        cell.rate.text  = "Rate: \(String(currency.rate))"
        
        // Hides masked info
        setMaskState(cell, newState: true)
        
        // Adds an id for ui testing
        cell.accessibilityIdentifier = currency.code.rawValue
        
        // Return the filled cell
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Hides the keyboard
        textfieldDollars.resignFirstResponder()
        
        // Gets a reference to the selected row
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? CellCurrency {
            
            // Srolls the table to show the cell at center
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            
            // Shows masked info
            setMaskState(cell, newState: false)
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Gets a reference to the selected row
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? CellCurrency {
            
            // Hides masked info
            setMaskState(cell, newState: true)
        }
    }
    
    private func setMaskState(cell: CellCurrency, newState: Bool){
        cell.mask.hidden = newState
        cell.name.hidden = newState
        cell.rate.hidden = newState
    }
    
    
    // --------------------------------------------------
    // Textfields
    // --------------------------------------------------
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        
        // Max chars allowed for credit card number
        if textField === textfieldDollars {
            
            // User deleting text
            if string.characters.count == 0 {
                return true
            }
            
            // Adding new text
            if string.characters.count >= 1 {
                
                // We do not allow enter a zero as first digit
                if textField.text?.characters.count == 0 && string == "0" {
                    return false
                    
                }else{
                    
                    // We only allow the user to enter numbers...
                    return CurrencyConverter.app.control.valid.isStringOnlyNumeric(string)
                }
            }
        }
        
        return false
    }
    
}
