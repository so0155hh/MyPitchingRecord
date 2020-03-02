//
//  SumViewController.swift
//  MyPitchingRecord
//
//  Created by 桑原望 on 2020/02/26.
//  Copyright © 2020 MySwift. All rights reserved.
//

import UIKit
import RealmSwift

class SumViewController: UIViewController {
    
    var notificationToken: NotificationToken? = nil
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //   全データを取得して累計投球数を求めたい
        let realm = try! Realm()
        
        notificationToken = realm.observe { Notification, realm in
            let sumOfPitches = realm.objects(Pitches.self)
            let sum: Int = pitches.sum(ofProperty: "pitchesText")
            let pitches = realm.objects(Pitches.self)
            //Listに登録したデータが1個の時も、累計投球数を表示させたい
            if pitches.count == 1 {
                self.sumLabel.text = String(sumOfPitches.last!.pitchesText)
            } else {
                       self.sumLabel.text = String(sum) + "球"
            }
            self.userDefaults.set(self.sumLabel.text, forKey: "result")
            self.userDefaults.synchronize()
        }
        let resultSum = userDefaults.string(forKey: "result")
        sumLabel.text = resultSum
        
    }
}
// let realm = try! Realm()
         //  let sumOfPitches = realm.objects(SumOfPitches.self)
           // let sum: Int = pitches.sum(ofProperty: "pitchesText")
           //    self.sumLabel.text =
           
         //  self.sumLabel.text = String(sumOfPitches.last!.sumData)
