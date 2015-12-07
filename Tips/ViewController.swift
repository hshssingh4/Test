//
//  ViewController.swift
//  Tips
//
//  Created by Harpreet on 12/6/15.
//  Copyright © 2015 Harpreet. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var equalsLabel: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let originalTintColor: UIColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
    var numberFormatter = NSNumberFormatter()
    var tipAmount = 0.0;
    var totalAmount = 0.0;
    var billAmount = 0.0;
    let percentages = [0.18, 0.20, 0.25];
    var percentage = 0.0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        tipControl.selectedSegmentIndex = defaults.integerForKey("indexDefaultTip")
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.numberStyle = .CurrencyStyle
        billField.placeholder = numberFormatter.currencySymbol
        billField.attributedPlaceholder = NSAttributedString(string: billField.placeholder!, attributes:[NSForegroundColorAttributeName : UIColor.lightGrayColor()])
        setDefaultTheme()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        billField.becomeFirstResponder()
        setDefaultTheme()
        tipControl.selectedSegmentIndex = defaults.integerForKey("indexDefaultTip")
        calculateTip("")
    }
    
    
    @IBAction func calculateTip(sender: AnyObject)
    {
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.numberStyle = .CurrencyStyle
        billField.placeholder = numberFormatter.currencySymbol
        if billField.text?.isEmpty == true
        {
            moveDownAnimation()
        }
        else
        {
            moveUpAnimation()
        }
        billAmount = NSString(string: billField.text!).doubleValue
        percentage = percentages[tipControl.selectedSegmentIndex]
        tipAmount = billAmount * percentage
        totalAmount = billAmount + tipAmount
        tipLabel.text = numberFormatter.stringFromNumber(tipAmount)
        totalLabel.text = numberFormatter.stringFromNumber(totalAmount)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveDownAnimation()
    {
        UIView.animateWithDuration(0.5, animations:
        {
            self.billField.center.y = 400
            self.tipControl.alpha = 0
            self.tipLabel.alpha = 0
            self.totalLabel.alpha = 0
            self.plusLabel.alpha = 0
            self.equalsLabel.alpha = 0
        })
    }
    
    func moveUpAnimation()
    {
        UIView.animateWithDuration(0.5, animations:
            {
                self.billField.center.y = 187.0
                self.tipControl.alpha = 1
                self.tipLabel.alpha = 1
                self.totalLabel.alpha = 1
                self.plusLabel.alpha = 1
                self.equalsLabel.alpha = 1
        })
    }
    
    func setDefaultTheme()
    {
        if defaults.integerForKey("indexThemeColor") == 0
        {
            self.view.backgroundColor = UIColor.whiteColor()
            billField.textColor = UIColor.blackColor()
            tipControl.tintColor = originalTintColor
            plusLabel.textColor = UIColor.blackColor()
            equalsLabel.textColor = UIColor.blackColor()
            tipLabel.textColor = UIColor.blackColor()
            totalLabel.textColor = UIColor.blackColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.blackColor()
            billField.textColor = UIColor.whiteColor()
            tipControl.tintColor = UIColor.whiteColor()
            plusLabel.textColor = UIColor.whiteColor()
            equalsLabel.textColor = UIColor.whiteColor()
            tipLabel.textColor = UIColor.whiteColor()
            totalLabel.textColor = UIColor.whiteColor()
        }
    }
}

