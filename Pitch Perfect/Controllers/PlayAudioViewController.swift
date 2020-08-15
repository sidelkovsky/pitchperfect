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
        // Do any additional setup after loading the view.
        refreshButtons()

    }
    
    func refreshButtons() {
        
        print("Refreshing Buttons")
        
        btnSlow.imageView?.contentMode = .scaleAspectFit
        btnFast.imageView?.contentMode = .scaleAspectFit
        btnLowPitch.imageView?.contentMode = .scaleAspectFit
        btnHighPitch.imageView?.contentMode = .scaleAspectFit
        btnEcho.imageView?.contentMode = .scaleAspectFit
        btnReverb.imageView?.contentMode = .scaleAspectFit
        btnStop.imageView?.contentMode = .scaleAspectFit
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        // refreshButtons()
        
    }
    
}
