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
    
    var beatsArray: [String] = [
        "To", "Be", "or", "not", "to", "be"
    ]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.7)
        setupCollectionView()
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
        guard let font = UIFont(name: "Helvetica", size: 23) else { return CGSize(width: 50, height: 30) }
        
        let attributes = [NSAttributedString.Key.font: font]
        let text = beatsArray[indexPath.row]
        let width = text.size(withAttributes: attributes).width + 10
//        let height = text.size(withAttributes: attributes).height + 5
        let height: CGFloat = 90
        return CGSize(width: width, height: height)
    }
}
