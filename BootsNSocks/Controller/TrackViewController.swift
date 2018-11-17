//
//  TrackViewController.swift
//  BootsNSocks
//
//  Created by 吳登秝 on 2018/11/17.
//  Copyright © 2018 DavidWu. All rights reserved.
//

import UIKit

let pronounceCell = "PronounceCell"

class TrackViewController: UIViewController {
    
    let tempArray: [Beat] = [
        Beat(location: 0, text: "a"),
        Beat(location: 2, text: "ch"),
        Beat(location: 4, text: "a"),
        Beat(location: 6, text: "ch"),
        Beat(location: 14, text: "To"),
        Beat(location: 19, text: "To")
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
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let xib = UINib(nibName: pronounceCell, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: pronounceCell)
    }


}

extension TrackViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beatsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pronounceCell, for: indexPath) as? PronounceCell else { return UICollectionViewCell() }
        cell.textLabel.text = beatsArray[indexPath.row]
        return cell
    }
    
    
}

extension TrackViewController: UICollectionViewDelegate {
    
}

extension TrackViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 90)
    }
}
