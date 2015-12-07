//
//  SettingsViewController.swift
//  Tips
//
//  Created by Harpreet on 12/6/15.
//  Copyright © 2015 Harpreet. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{
    @IBOutlet weak var tapControlSettings: UISegmentedControl!
    //the segmented bar control for default tip
    @IBOutlet weak var themeControl: UISegmentedControl!
    //the theme bar control for changing themes
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    let originalTintColor: UIColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
    /*
    originalTintColor creates a color that mimics that of the original segmented
    control since it is required to be accessed once the theme changes are made
    */
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*
    Before this view diappears, setting like default tip and the theme are stored
    so that the values in the tip view controller can be accordingly changed
    */
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        defaults.setInteger(tapControlSettings.selectedSegmentIndex, forKey: "indexDefaultTip")
        defaults.setInteger(themeControl.selectedSegmentIndex, forKey: "indexThemeColor")
        defaults.synchronize()
    }
    
    /*
    Reads the default tip amount once chosen by user while using the app
    and highlights the portion of the segmented bars accordingly
    */
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        let defaultTipIndex = defaults.integerForKey("indexDefaultTip")
        switch defaultTipIndex
        {
        case 0...2:
            tapControlSettings.selectedSegmentIndex = defaultTipIndex
        default:
            break
        }
        let defaultThemeIndex = defaults.integerForKey("indexThemeColor")
        switch defaultThemeIndex
        {
        case 0...1:
            themeControl.selectedSegmentIndex = defaultThemeIndex
            themeChanged("")
        default:
            break
        }
    }
    
    /*
    Checks whether the theme is changed and performs the same operations
    as descrived in calculateTip method of tipViewController class
    */
    @IBAction func themeChanged(sender: AnyObject)
    {
        if themeControl.selectedSegmentIndex == 0
        {
            self.view.backgroundColor = UIColor.whiteColor()
            defaultTipLabel.textColor = UIColor.blackColor()
            themeLabel.textColor = UIColor.blackColor()
            tapControlSettings.tintColor = originalTintColor
            themeControl.tintColor = originalTintColor
        }
        else if themeControl.selectedSegmentIndex == 1
        {
            self.view.backgroundColor = UIColor.blackColor()
            defaultTipLabel.textColor = UIColor.whiteColor()
            themeLabel.textColor = UIColor.whiteColor()
            tapControlSettings.tintColor = UIColor.whiteColor()
            themeControl.tintColor = UIColor.whiteColor()
        }

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    

}
