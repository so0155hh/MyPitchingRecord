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
    
    @IBOutlet weak var sumLabel: UILabel!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        //   全データを取得して累計投球数を求めたい
        notificationToken = realm.observe { Notification, realm in
            
            let sum: Int = pitches.sum(ofProperty: "pitchesText")
            
            self.sumLabel.text = String(sum)
            
            self.sumLabel.reloadInputViews()
        }
    }
}
