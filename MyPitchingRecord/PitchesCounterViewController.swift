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

class PitchesCounterViewController: UIViewController {

    @IBOutlet weak var numberOfPitchesText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveBtn(_ sender: Any) {
        let pitchesCount = Pitches()
         pitchesCount.pitchesText = numberOfPitchesText.text!
         //データを永続化
         try! realm.write {
             realm.add(pitchesCount)
         }
        let listVC = self.presentingViewController as! ListViewController
       listVC.updateView()
        // navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
         
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
