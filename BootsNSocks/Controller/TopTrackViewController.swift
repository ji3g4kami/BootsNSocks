//
//  TrackViewController.swift
//  BootsNSocks
//
//  Created by 吳登秝 on 2018/11/17.
//  Copyright © 2018 DavidWu. All rights reserved.
//

import UIKit

class TopTrackViewController: UIViewController {
    
    var timer = Timer()
    var distance: CGFloat = 0.0
    
    let tempArray: [Beat] = [
        Beat(location: 0, text: "b"),
        Beat(location: 8, text: "s"),
        
        Beat(location: 32, text: "t"),
        Beat(location: 40, text: "t"),
        Beat(location: 48, text: "p"),
        
        Beat(location: 64, text: "p"),
        Beat(location: 68, text: "p"),
        
        Beat(location: 80, text: "t"),
        Beat(location: 84, text: "t"),
        
        Beat(location: 96, text: "s"),
        Beat(location: 104, text: "s"),
        Beat(location: 112, text: "s"),
        Beat(location: 120, text: "s"),
        Beat(location: 128, text: "b")

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
        
        print(beatsArray)
        
        
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        distance += 3
        collectionView.contentOffset = CGPoint(x: distance, y: 0)
    }
    
    
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let xib = UINib(nibName: pronounceCell, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: pronounceCell)
    }
}

extension TopTrackViewController: UICollectionViewDataSource {
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

extension TopTrackViewController: UICollectionViewDelegate {
    
}

extension TopTrackViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 90)
    }
}
