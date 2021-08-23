//
//  ViewController3.swift
//  Max Day
//
//  Created by Kendell Graham on 6/14/21.
//


import UIKit

class ViewController3: UIViewController {
        // Do any additional setup after loading the view.
    
    var currSet = ["1","2","3","4","5","6","7","8","9","10"]
    var currRep = ["8 Repetition","5 Repetition","3 Repetition","1 Repetition","1 Repetition","1 Repetition","1 Repetition","1 Repetition","1 Repetition","1 Repetition"]
    var currRest = ["2 Minute Rest","2 Minute Rest","3 Minute Rest","3 Minute Rest","5 Minute Rest","10 Minute Rest","10 Minute Rest","10 Minute Rest","10 Minute Rest","10 Minute Rest"]
    var recWeight = Float(0.0)
    var current = 0
    var nextWeight = Float(0.0)
    @IBOutlet weak var restAmount: UILabel!
    @IBOutlet weak var currWeight: UILabel!
    @IBOutlet weak var repAmount: UILabel!
    @IBOutlet weak var setNum: UILabel!
    @IBOutlet weak var success: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let weightNumbers = [recWeight/100*40,recWeight/100*60,recWeight/100*70,recWeight/100*80,recWeight/100*90,recWeight/100*100,recWeight/100*110,recWeight/100*115,recWeight/100*120,recWeight/100*125]

        print("here")
        print(weightNumbers)
        restAmount.text = currRest[current]
        currWeight.text = "\(String(format: "%.1f", weightNumbers[current])) lbs"
        repAmount.text = currRep[current]
        setNum.text = "\(currSet[current])/7"
        // Do any additional setup after loading the view.
        self.nextWeight = weightNumbers[current+1]

    }
    @IBAction func failBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "v3tv1", sender: self)
            }
    @IBAction func successBtn(_ sender: UIButton) {
    performSegue(withIdentifier: "v3tv4", sender: self)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "v3tv4"{
        let vc = segue.destination as! ViewController4
        vc.recCurrent = self.current
        vc.nextAmount = self.nextWeight
        vc.MAX = self.recWeight
        }else{
        let vc = segue.destination as! ViewController
        }

    }
    
}
