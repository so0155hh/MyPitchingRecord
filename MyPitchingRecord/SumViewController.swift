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

    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    //全データを取得して累計投球数を求めたい
//    override func viewDidAppear(_ animated: Bool) {
//        let realm = try! Realm()
//        let mySum = realm.objects(Pitches.self)
//        let sum:Int = mySum.sum(ofProperty: "pitchesText")
//        sumLabel.text = String(sum)
//    }
}
