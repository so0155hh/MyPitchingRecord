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
         pitchesCount.pitchesText = numberOfPitchesText.text!
        
         //データを永続化
         try! realm.write {
             realm.add(pitchesCount)
         }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
//    @IBAction func selectSegment(_ sender: UISegmentedControl) {
//      //  let pitchesSituation = Pitches()
//       // pitchesSituation.situationText =
//        switch sender.selectedSegmentIndex {
//        case 0:
//            print("ブルペン")
//        case 1:
//            print("実戦")
//        default:
//            print("エラー")
//        }
//    }
}
