//
//  TransportationViewController.swift
//  T&A_App
//
//  Created by Felicia Weathers on 1/4/17.
//  Copyright © 2017 Felicia Weathers. All rights reserved.
//

import UIKit
import AVFoundation

class TransportationViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var transportationImage: UIImageView!
    
    var player = AVAudioPlayer()
    
    var soundArray = ["ambulance", "bicycle", "bulldozer", "car", "racecar", "firetruck", "helicopter", "motorcycle", "plane", "policecar", "truck", "train"] // full array of sounds
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = "train"
        
        setUpAudioPlayer(file: "train", type: "wav")
        player.play()
        
    }
    
    func setUpAudioPlayer(file: NSString, type: NSString) {
        
        let path = Bundle.main.path(forResource: file as String, ofType: type as String)
        let url = NSURL.fileURL(withPath: path!)
        
        do {
            
            try  player =  AVAudioPlayer(contentsOf: url)
            
        } catch {
            
            print("Player not available")
            
        }
    }
    
    @IBAction func backgroundTapped(_ sender: UIButton) {
        
        let range: UInt32 = UInt32(soundArray.count)
        let number = Int(arc4random_uniform(range))
        
        setUpAudioPlayer(file: soundArray[number] as NSString, type: "wav")
        self.nameLabel.text = soundArray[number]
        self.transportationImage.image = UIImage(named: soundArray[number])
        
        player.play()
        
    }
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        
        player.play()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
