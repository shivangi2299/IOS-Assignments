//
//  ViewController.swift
//  HW5
//
//  Created by Rohan Panchal on 2/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    var descriptiontex = ""
    var qualitytext = ""
    var itemArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listdata.text = "No items"
        descriptionText.accessibilityIdentifier = "Description_Input"
        QuantityText.accessibilityIdentifier = "Quantity_Input"
        listdata.accessibilityIdentifier = "List_Output"
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var descriptionText: UITextField!
    
    @IBOutlet weak var QuantityText: UITextField!
    
    
    @IBOutlet weak var listdata: UITextView!
    
    
    @IBAction func AddNewList(_ sender: UIButton) {
        
        listdata.text = ""
        itemArray.removeAll()
        
    }
    
    
    @IBAction func newItem(_ sender: UIButton) {
        descriptionText.text! = ""
        QuantityText.text! = ""
        
    }
    
    
    
    
    @IBAction func AddItem(_ sender: UIButton)  {
        let desc = descriptionText.text!
        let quanti = QuantityText.text!
        
        if validInput(description: desc, quantity: quanti ){
            itemArray.append(quanti + "x " + desc)
        displayList()
        descriptionText.text = ""
        QuantityText.text = ""
        }
        else {
            return
        }
    }
    
    func displayList(){
        var data = ""
        
        for i in itemArray{
            data += "\(i)\n"
        }
        listdata.text = data
    }
    
    func validInput(description: String , quantity: String) -> Bool {
        
       
        if descriptionText.text!.isEmpty && QuantityText.text!.isEmpty {
            let message = "Invalid Quantity"
            generateAlert(message: message)
            return false
        } else if descriptionText.text!.isEmpty {
            let message = "Invalid Description"
            generateAlert(message: message)
            return false
        } else if QuantityText.text!.isEmpty {
            let message = "Invalid Quantity"
            generateAlert(message: message)
            return false
        } else if Int(QuantityText.text!) == nil {
            let message = "Alphabets in numeric field"
            generateAlert(message: message)
            return false
        } else {
            return true
        }
        
    }
    
    func generateAlert(message: String){
    
        
        let title = "Error"
        let alertController =
            UIAlertController(title: title,
                              message: message,
                              preferredStyle: .alert)
        
        // Create the action.
        let cancelAction =
            UIAlertAction(title: "OK",
                          style: .cancel,
                          handler: nil)
        alertController.addAction(cancelAction)
        present(alertController,
                animated: true,
                completion: nil)
        
    }
    
}

