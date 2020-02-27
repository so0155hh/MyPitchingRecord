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
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        let mySum = realm.objects(Pitches.self)
        let sum:Int = mySum.sum(ofProperty: "sumOfPitches")
        sumLabel.text = String(sum)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
