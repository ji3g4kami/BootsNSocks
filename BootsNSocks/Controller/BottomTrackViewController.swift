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
        
        Beat(location: 4, text: "4"),
        Beat(location: 8, text: "3"),
        Beat(location: 12, text: "2"),
        Beat(location: 16, text: "1"),
        
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
            if cell.textLabel.text == "1" || cell.textLabel.text == "2" || cell.textLabel.text == "3" || cell.textLabel.text == "4"{
                cell.textLabel.layer.backgroundColor = UIColor.red.cgColor
            } else {
                cell.textLabel.layer.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.9).cgColor
            }
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
