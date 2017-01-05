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
    
    var player = AVAudioPlayer()
//    let audioPath = Bundle.main.path(forResource: "trainSound", ofType: "mp3")

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func imageButtonTapped(_ sender: UIButton) {
        
        var soundArray = ["ambulance", "bicycle", "bulldozer", "car", "racecar", "firetruck", "helicopter", "motorcycle", "plane", "policecar", "truck", "trainsSound"]
        let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
        let fileLocation = Bundle.main.path(forResource: soundArray[randomNumber], ofType: "mp3")
        
        do {
            
            print(soundArray[randomNumber])
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
            
            player.play()

            
        } catch {
            
            //process error
            
        }        
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
