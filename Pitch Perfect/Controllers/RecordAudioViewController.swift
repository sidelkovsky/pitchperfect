//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Kirill Sidelkovsky on 09.08.2020.
//  Copyright © 2020 sidelkovsky.com. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var lblHint: UILabel!
    
    var audioRecorder: AVAudioRecorder!
    
    var isRecording : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func recordAudio(_ sender: Any) {
        
        isRecording = true
        updateUI()
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        
        isRecording = false
        updateUI()
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
                
        if flag {
            performSegue(withIdentifier: "proceedToPlayback", sender: audioRecorder.url)
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Something went wrong!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proceedToPlayback" {
            let playSoundsVC = segue.destination as! PlayAudioViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
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
