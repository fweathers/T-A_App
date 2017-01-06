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
    
    var player = AVAudioPlayer()
    
    
    var soundArray = ["bulldozer", "car", "helicopter", "motorcycle", "plane", "truck", "train"]
    
    
    //    var soundArray = ["ambulance", "bicycle", "bulldozer", "car", "racecar", "firetruck", "helicopter", "motorcycle", "plane", "policecar", "truck", "train"] // full array of sounds
    
    //    var soundArray = ["ambulance", "bicycle", "racecar", "firetruck", "plane", "policecar", "trainsSound"] // there's a issue with these sounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        setUpAudioPlayer(file: soundArray[number] as NSString, type: "mp3")
        self.nameLabel.text = soundArray[number]
        
        player.play()
        
    }
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        
        player.play()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
