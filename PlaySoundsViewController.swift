//
//  PlaySoundsViewController.swift
//  PitchPerfect
//  Created by Meya Gorbea on 8/27/17.
//  Udacity: Intro to iOS App Development with Swift
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var Snail: UIButton!
    @IBOutlet weak var Rabbit: UIButton!
    @IBOutlet weak var HighPitch: UIButton!
    @IBOutlet weak var LowPitch: UIButton!
    @IBOutlet weak var Echo: UIButton!
    @IBOutlet weak var Reverb: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    // these map to the sound button tags from 0-5
    enum ButtonType: Int {
        case slow = 0, fast , chipmunk , vader , echo , reverb
    }
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }

    // This method is called after the view controller has loaded its view hierarchy into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        // send the state of the audio
        
    }


}
