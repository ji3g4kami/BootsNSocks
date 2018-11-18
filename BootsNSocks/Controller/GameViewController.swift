//
//  ViewController.swift
//  BootsNSocks
//
//  Created by 吳登秝 on 2018/11/17.
//  Copyright © 2018 DavidWu. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var topTrackViewController: TopTrackViewController?
    var bottomTrackViewController: BottomTrackViewController?


    @IBOutlet weak var startButton: DesignableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBottomTrack" {
            self.bottomTrackViewController = segue.destination as? BottomTrackViewController
        } else if segue.identifier == "toTopTrack" {
            self.topTrackViewController = segue.destination as? TopTrackViewController
        }
    }
    
    
    @IBAction func startButtonPressed(_ sender: DesignableButton) {
        topTrackViewController?.runTimer()
        bottomTrackViewController?.runTimer()
    }
    

}

