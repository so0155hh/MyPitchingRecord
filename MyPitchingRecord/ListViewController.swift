//
//  ListViewController.swift
//  MyPitchingRecord
//
//  Created by 桑原望 on 2020/02/25.
//  Copyright © 2020 MySwift. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    //データが追加された時にcollectionViewを更新する処理
    var notificationToken: NotificationToken? = nil
    let formatter = DateFormatter()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //デフォルトのRealmを検索
        let realm = try! Realm()
        //Pitchesオブジェクトを検索
        let pitches = realm.objects(Pitches.self)
        
        return pitches.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PitchesCell", for: indexPath) as! RecordCollectionViewCell
        //Cell内のLabelに投球数を反映させる
        let realm = try! Realm()
        let pitches = realm.objects(Pitches.self)
        let pitchesData = pitches[indexPath.row]
        formatter.dateFormat = "yyyy/MM/dd"
        cell.dateLabel.text = formatter.string(from: pitchesData.registeredDay)
        cell.pitchesLabel.text = String(pitchesData.pitchesText) + "球"
       // cell.situationLabel.text = pitchesData.situationText
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 100)
        collectionView.collectionViewLayout = layout
        
        let realm = try! Realm()
        //データが追加された時にcollectionViewを更新する処理
        notificationToken = realm.observe { Notification, realm in
            self.collectionView.reloadData()
        }
    }
}
class Pitches: Object {
    @objc dynamic var pitchesText = 0
    @objc dynamic var situationText = ""
  //  @objc dynamic var sumOfPitches = 0
    @objc dynamic var registeredDay = Date()
}
class SumOfPitches: Object {
    @objc dynamic var sumData = 0
}
