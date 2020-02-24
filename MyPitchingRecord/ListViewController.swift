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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //デフォルトのRealmを検索
         let realm = try! Realm()
        //Pitchesオブジェクトを検索
         let pitches = realm.objects(Pitches.self)
         return pitches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PitchesCell", for: indexPath) as! RecordCollectionViewCell
           //Cell内のLabelにで投球数を反映させる
                     let realm = try! Realm()
                     let pitches = realm.objects(Pitches.self)
                     let pitchesData = pitches[indexPath.row]
                     cell.pitchesLabel.text = pitchesData.pitchesText

               return cell
    }

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.collectionViewLayout = layout
        
        collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
              updateView()
         }
    func updateView() {
        collectionView.reloadData()
    }
}
class Pitches: Object {
    @objc dynamic var pitchesText = ""
}
