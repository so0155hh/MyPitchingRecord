//
//  PitchesCounterViewController.swift
//  MyPitchingRecord
//
//  Created by 桑原望 on 2020/02/25.
//  Copyright © 2020 MySwift. All rights reserved.
//

import UIKit
import RealmSwift

let realm = try! Realm()
let pitches = realm.objects(Pitches.self)


class PitchesCounterViewController: UIViewController {
    
    @IBOutlet weak var numberOfPitchesText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveBtn(_ sender: Any) {
     
        let pitchesCount = Pitches()
       
        pitchesCount.pitchesText = Int(self.numberOfPitchesText.text!)!
       
         //データを永続化
         try! realm.write {
             realm.add(pitchesCount)
         }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
 //  let sum : Int = realm.objects(Pitches.self).sum(ofProperty: "pitchesText")
 //  let mySum = SumOfPitches()
//    mySum.sumData = sum
