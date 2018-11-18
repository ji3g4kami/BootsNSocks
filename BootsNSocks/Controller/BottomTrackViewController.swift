//
//  TrackViewController.swift
//  BootsNSocks
//
//  Created by 吳登秝 on 2018/11/17.
//  Copyright © 2018 DavidWu. All rights reserved.
//

import UIKit

let pronounceCell = "PronounceCell"

class BottomTrackViewController: UIViewController {
    
    var timer = Timer()
    var distance: CGFloat = 0.0
    
    let tempArray: [Beat] = [
        Beat(location: 0, text: "0"),
        Beat(location: 1, text: "1"),
        Beat(location: 2, text: "2"),
        Beat(location: 3, text: "3"),
        Beat(location: 4, text: "4"),
        Beat(location: 5, text: "5"),
        Beat(location: 6, text: "6"),
        Beat(location: 7, text: "7"),
        Beat(location: 8, text: "8"),
        Beat(location: 9, text: "9"),
        Beat(location: 10, text: "10"),
        Beat(location: 11, text: "11"),
        Beat(location: 12, text: "12"),
        Beat(location: 13, text: "13"),
        Beat(location: 14, text: "14"),
        Beat(location: 15, text: "15"),
        Beat(location: 16, text: "16"),
        Beat(location: 17, text: "17"),
        Beat(location: 18, text: "18"),
        Beat(location: 19, text: "19"),
        Beat(location: 20, text: "20"),
        
        
        
        
        
        Beat(location: 28, text: "b"),
        Beat(location: 32, text: "s"),
        Beat(location: 36, text: "t"),
        Beat(location: 40, text: "t"),
        Beat(location: 44, text: "p"),
        
        Beat(location: 56, text: "p"),
        Beat(location: 58, text: "p"),
        
        Beat(location: 64, text: "t"),
        Beat(location: 66, text: "t"),
        
        Beat(location: 68, text: "s"),
        Beat(location: 72, text: "s"),
        Beat(location: 76, text: "s"),
        Beat(location: 80, text: "s"),
        Beat(location: 84, text: "b")

    ]
    
    var beatsArray: [String] = {
        var array = [String]()
        for _ in 0...240 {
            array.append("")
        }
        return array
    }()
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.7)
        setupCollectionView()
        tempArray.forEach { beat in
            beatsArray[beat.location] = beat.text
        }
        
        
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        distance += 3.23
        collectionView.contentOffset = CGPoint(x: distance, y: 0)
    }

    
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let xib = UINib(nibName: pronounceCell, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: pronounceCell)
    }


}

extension BottomTrackViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beatsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pronounceCell, for: indexPath) as? PronounceCell else { return UICollectionViewCell() }
        cell.textLabel.text = beatsArray[indexPath.row]
        if cell.textLabel.text == "" {
            cell.textLabel.isHidden = true
        } else {
            cell.textLabel.isHidden = false
        }
        return cell
    }
}

extension BottomTrackViewController: UICollectionViewDelegate {
    
}

extension BottomTrackViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 90)
    }
}
