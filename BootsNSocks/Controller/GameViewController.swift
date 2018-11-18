//
//  ViewController.swift
//  BootsNSocks
//
//  Created by 吳登秝 on 2018/11/17.
//  Copyright © 2018 DavidWu. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    var player: AVAudioPlayer?
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
        playSound()
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "sound", ofType : "mp3") else { return }
        let url = URL(fileURLWithPath : path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch {
            
            print ("There is an issue with this code!")
            
        }
    }
}

