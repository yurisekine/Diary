//
//  EnterViewController.swift
//  Diary
//
//  Created by SEKINE YURI on 2016/04/08.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController {
    
    @IBOutlet var SadTextField: UITextField!
    @IBOutlet var HappyTextField: UITextField!
    @IBOutlet var TomorrowTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

//        SadTextField.borderStyle = UITextBorderStyleLine
//        SadTextField.clearButtonMode = UITextFieldViewModeWhiteEditing
        SadTextField.placeholder = "嫌だった、失敗したこと"
        HappyTextField.placeholder = "嬉しかった、成功したこと"
        TomorrowTextField.placeholder = "明日への決意、目標"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OKButton() {
    
        
        if SadTextField.text == "" || HappyTextField.text == "" || TomorrowTextField.text == "" {
            
            //完了のアラート
            let alert = UIAlertController(title: "未入力", message: "未入力の部分があります", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        
        }
        
        performSegueWithIdentifier("toCheckViewController", sender: nil)
    }
    
    //datepickerをStringに
    func format(date : NSDate, style : String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.dateFormat = style
        return  dateFormatter.stringFromDate(date)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toCheckViewController" {
            
            let checkViewController = segue.destinationViewController as! CheckViewController
            checkViewController.sad = SadTextField.text
            checkViewController.happy = HappyTextField.text
            checkViewController.tomorrow = TomorrowTextField.text
            
            
            let date = format(datePicker.date, style: "yyyy/MM/dd  HH:mm")//yyyy
            checkViewController.date = date
        }
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
