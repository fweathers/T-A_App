//
//  AnimalViewController.swift
//  T&A_App
//
//  Created by Felicia Weathers on 1/14/17.
//  Copyright © 2017 Felicia Weathers. All rights reserved.
//

import UIKit
import AVFoundation

class AnimalViewController: UIViewController {
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    
    var player = AVAudioPlayer()
    
    var soundArray = ["cat", "dog", "sheep", "goat", "rooster", "cow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animalName.text = "cat"
        
        setUpAudioPlayer(file: "cat", type: "wav")
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
    
    @IBAction func backgroundButton(_ sender: UIButton) {
        
        let range: UInt32 = UInt32(soundArray.count)
        let number = Int(arc4random_uniform(range))
        
        setUpAudioPlayer(file: soundArray[number] as NSString, type: "wav")
        self.animalName.text = soundArray[number]
        self.animalImage.image = UIImage(named: soundArray[number])
        
        player.play()
        
    }
    
    @IBAction func imageButton(_ sender: UIButton) {
        
        player.play()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
