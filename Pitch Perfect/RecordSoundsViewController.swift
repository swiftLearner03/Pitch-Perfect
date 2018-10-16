//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Dale Kilgore, Jr on 10/15/18.
//  Copyright © 2018 Dale Kilgore, Jr. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
    
    var  labelIsBlinking = false
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.isEnabled = false
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear called")
    }
    
    
    
    
    
    
    @IBAction func recordAudio(_ sender: AnyObject) {
        recordingLabel.text = "Recording in Progress"
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        labelIsBlinking = true
        recordingOnBlinkingText()
        
        
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
//        try! session.setCategory(AVAudioSession.Category.playAndRecord, with:AVAudioSession.CategoryOptions.defaultToSpeaker)
//        try! session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
     try! session.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
        
        
        
        
        
        
        
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        print(filePath!)
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
        
        
        
    }
    
    
    
    @IBAction func stopRecording(_ sender: AnyObject) {
        recordingLabel.text = "Tap to record"
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
        labelIsBlinking = false
        recordingOnBlinkingText()
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

