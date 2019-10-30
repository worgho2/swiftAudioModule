//
//  ViewController.swift
//  sounorizacao
//
//  Created by Otávio Baziewicz Filho on 29/10/19.
//  Copyright © 2019 Otávio Baziewicz Filho. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doublePressed(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .double)
    }
    
    @IBAction func synthPressed(_ sender: Any) {
        AudioManager.shared.play(soundEffect: .synth)
    }
    
    @IBAction func dancePressed(_ sender: Any) {
        AudioManager.shared.play(song: .dance)
    }
    
    
    @IBAction func nightPressed(_ sender: Any) {
        AudioManager.shared.play(song: .night)
    }
    
    @IBAction func introPressed(_ sender: Any) {
        AudioManager.shared.play(introWithLoop: .first)
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        AudioManager.shared.stopCurrentSong()
    }
    
}

