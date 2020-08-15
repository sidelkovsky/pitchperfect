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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButtons()

    }
    
    func refreshButtons() {
        
        let btns = [btnSlow, btnFast, btnLowPitch, btnHighPitch, btnEcho, btnReverb]
        
        for b in btns {
            b?.imageView?.contentMode = .scaleAspectFit
        }
        
    }
    
}
