//
//  ViewController4.swift
//  Max Day
//
//  Created by Kendell Graham on 6/14/21.
//

import UIKit
import AVFoundation

class ViewController4: UIViewController {
        // Do any additional setup after loading the view.
    var nextAmount = Float(0.0)
    var currSet = ["1","2","3","4","5","6","7","8","9","10"]
    var recCurrent = 0
    var MAX = Float(0.0)
    @IBOutlet weak var leftSet: UILabel!
    @IBOutlet weak var rightSet: UILabel!
    @IBOutlet weak var nextWeight: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var readyB: UIButton!
    var secondsS1a2 = 120
    var secondsS3a4 = 180
    var secondsS5 = 300
    var secondsS6Plus = 600
    var timeLabel = Timer()
    var isTimerRunning = false
    var player: AVAudioPlayer?
    
    
    func runTimer(cur: Int) {
 
        if cur == 0 || cur == 1 {
            timeLabel = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController4.updateTimer1)), userInfo: nil, repeats: true)
            isTimerRunning = true
        } else if cur == 2 || cur == 3{
            timeLabel = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController4.updateTimer2)), userInfo: nil, repeats: true)
            isTimerRunning = true
        } else if cur == 4 {
            timeLabel = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController4.updateTimer3)), userInfo: nil, repeats: true)
            isTimerRunning = true
        } else{
            timeLabel = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController4.updateTimer4)), userInfo: nil, repeats: true)
            isTimerRunning = true
            }
            
        }
    
    
    @objc func updateTimer1() {
            if secondsS1a2 < 1 {
                timeLabel.invalidate()
                print("Done")
                timer.text = "Done"
                readyB.isEnabled = true
                readyB.alpha = 1
                if let player = player, player.isPlaying{
                    player.stop()
                }else{
                    let urlString = Bundle.main.path(forResource: "music_zapsplat_winter_dance", ofType: "mp3")
                do{
                    try AVAudioSession.sharedInstance().setMode(.default)
                    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                    
                    guard let urlString = urlString else{
                        return
                    }
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                    
                    guard let player = player else {return}
                    player.play()
                    }catch{print("something went wrong")}

                //Send alert to indicate time's up.
                }
                
                    }else  {
                secondsS1a2 -= 1
                timer.text = timeString(time: TimeInterval(secondsS1a2))
        }
    }
    
    @objc func updateTimer2() {
            if secondsS3a4 < 1 {
                timeLabel.invalidate()
                timer.text = "Done"
                readyB.isEnabled = true
                readyB.alpha = 1

                //Send alert to indicate time's up.
            } else {
                secondsS3a4 -= 1
                timer.text = timeString(time: TimeInterval(secondsS3a4))
        }
    }
    @objc func updateTimer3() {
            if secondsS5 < 1 {
                timeLabel.invalidate()
                timer.text = "Done"
                readyB.isEnabled = true
                readyB.alpha = 1

                //Send alert to indicate time's up.
            } else {
                secondsS5 -= 1
                timer.text = timeString(time: TimeInterval(secondsS5))
        }
    }
    @objc func updateTimer4() {
            if secondsS6Plus < 1 {
                timeLabel.invalidate()
                timer.text = "Done"
                readyB.isEnabled = true
                readyB.alpha = 1

                //Send alert to indicate time's up.
            } else {
                secondsS6Plus -= 1
                timer.text = timeString(time: TimeInterval(secondsS6Plus))
        }
    }
    
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer(cur: recCurrent)
        leftSet.text = "\(currSet[recCurrent])/7"
        rightSet.text = "\(currSet[recCurrent + 1])/7"
        nextWeight.text = "\(String(format: "%.1f", (nextAmount))) lbs"
        readyB.isEnabled = false
        // Do any additional setup after loading the view.
    }
    


    @IBAction func readyBtn(_ sender: UIButton) {
        player!.stop()
        performSegue(withIdentifier: "v4tv3", sender: self)
            }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ViewController3
            vc.current = self.recCurrent + 1
            vc.recWeight = self.MAX
            }
}
    
    


    

