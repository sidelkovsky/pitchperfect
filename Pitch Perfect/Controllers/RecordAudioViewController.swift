//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Kirill Sidelkovsky on 09.08.2020.
//  Copyright © 2020 sidelkovsky.com. All rights reserved.
//

import UIKit

class RecordAudioViewController: UIViewController {
    
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var lblHint: UILabel!
    
    var isRecording : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func recordAudio(_ sender: Any) {
        isRecording = true
        updateUI()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        isRecording = false
        updateUI()
    }
    
    // update label, enable/disable buttons accordingly
    func updateUI(){
        if isRecording {
            btnRecord.isEnabled = false
            btnStop.isEnabled = true
            lblHint.text = "Recording"
        } else {
            btnRecord.isEnabled = true
            btnStop.isEnabled = false
            lblHint.text = "Tap to Record"
        }
    }
    
}
