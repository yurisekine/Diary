//
//  CheckViewController.swift
//  Diary
//
//  Created by SEKINE YURI on 2016/04/08.
//  Copyright © 2016年 SEKINE YURI. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {
    
    @IBOutlet var SadLabel: UILabel!
    @IBOutlet var HappyLabel: UILabel!
    @IBOutlet var TomorrowLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var sad: String!
    var happy: String!
    var tomorrow: String!
    var date: String!
    
    var diaryArray: [String] = []
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        SadLabel.text = sad
        HappyLabel.text = happy
        TomorrowLabel.text = tomorrow
        dateLabel.text = date
        
        if saveData.objectForKey("check") != nil {
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkDoneButton() {
        saveData.setObject(diaryArray, forKey: "check")
        
        
        //完了のアラート
        let alert = UIAlertController(title: "記入完了", message: "日記をつけました", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
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
