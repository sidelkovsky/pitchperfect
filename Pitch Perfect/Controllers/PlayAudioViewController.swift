//
//  PlayAudioViewController.swift
//  Pitch Perfect
//
//  Created by Kirill Sidelkovsky on 09.08.2020.
//  Copyright © 2020 sidelkovsky.com. All rights reserved.
//

import UIKit

class PlayAudioViewController: UIViewController {

    @IBOutlet weak var btnFast: UIButton!
    @IBOutlet weak var btnSlow: UIButton!
    @IBOutlet weak var btnHighPitch: UIButton!
    @IBOutlet weak var btnLowPitch: UIButton!
    @IBOutlet weak var btnEcho: UIButton!
    @IBOutlet weak var btnReverb: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    
    var isPlaying : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButtons()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopAudio(btnStop)
    }
    
    // fix to adjust button sizes for smaller screens
    func refreshButtons() {
        
        let btns = [btnSlow, btnFast, btnLowPitch, btnHighPitch, btnEcho, btnReverb]
        
        for b in btns {
            b?.imageView?.contentMode = .scaleAspectFit
        }
        
    }
    
    func updateUI() {
        
        let btns = [btnSlow, btnFast, btnLowPitch, btnHighPitch, btnEcho, btnReverb]
        
        if isPlaying {
            btnStop.isEnabled = true
            for b in btns {
                b?.isEnabled = false
            }
        } else {
            btnStop.isEnabled = false
            for b in btns {
                b?.isEnabled = true
            }
        }
        
    }
    
    @IBAction func playAudio(_ sender: Any) {
        isPlaying = true
        updateUI()
    }
    
    @IBAction func stopAudio(_ sender: Any) {
        isPlaying = false
        updateUI()
    }
    
}
