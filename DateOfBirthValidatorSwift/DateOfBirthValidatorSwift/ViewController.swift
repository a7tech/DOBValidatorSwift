
//  ViewController.swift
//  DateOfBirthValidatorSwift

//  Created by mac on 29/03/16.
//  Copyright © 2016 Inwizards. All rights reserved.


import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var DOBTextField:UITextField!
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var PickerBackgroundView:UIView!
    @IBOutlet weak var Status: UILabel!
    
    var formatter = NSDateFormatter()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
     formatter.dateFormat = "MMM dd,yyyy"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.initializeTextFieldInputView()
    }

    func initializeTextFieldInputView(){
        self.datePicker.backgroundColor = UIColor.whiteColor()
        self.datePicker.datePickerMode = UIDatePickerMode.Date
        self.DOBTextField.inputView = self.PickerBackgroundView
        self.PickerBackgroundView.removeFromSuperview()
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if (textField == self.DOBTextField){
            self.datePicker.hidden = false
        }else{
            self.datePicker.hidden = true
        }
        return true
    }
    @IBAction func buttonDone(sender:AnyObject){
        self.view.endEditing(true)
        let Currentdate:NSDate = NSDate()
        let ageComponents:NSDateComponents = NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: self.datePicker.date, toDate: Currentdate, options: NSCalendarOptions.init(rawValue: 0))
        if (ageComponents.year < 18){
            self.Status.text = "Date of birth is invalid"
            let alert = UIAlertView(title: "Alert", message: "You must be 18 years of age or older. Sorry, this is required by law.", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }else{
            self.Status.text = "Date of birth is valid"
            self.DOBTextField.text = formatter.stringFromDate(self.datePicker.date)
        }
    }
}

