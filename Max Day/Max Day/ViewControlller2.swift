//
//  ViewControlller2.swift
//  Max Day
//
//  Created by Kendell Graham on 6/14/21.
//

import UIKit

class ViewController2: UIViewController {
    var finalMax = ""
    var finalLift = ""
    var passWeightNumbers = Float(0.0)

    @IBOutlet weak var s1weight: UILabel!
    @IBOutlet weak var s2weight: UILabel!
    @IBOutlet weak var s3weight: UILabel!
    @IBOutlet weak var s4weight: UILabel!
    @IBOutlet weak var s5weight: UILabel!
    @IBOutlet weak var s6weight: UILabel!
    @IBOutlet weak var s7weight: UILabel!
    @IBOutlet weak var liftName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        liftName.text = finalLift
        print(finalMax)
        let weightNumbers = [Float(finalMax)!/100*30,Float(finalMax)!/100*50,Float(finalMax)!/100*60,Float(finalMax)!/100*70,Float(finalMax)!/100*80,Float(finalMax)!/100*90,Float(finalMax)!/100*100,Float(finalMax)!/100*105]
        let strMax1 = "\(String(format: "%.1f", weightNumbers[0]))lbs - \(String(format: "%.1f",weightNumbers[1]))lbs"
        let strMax2 = "\(String(format: "%.1f", weightNumbers[2]))lbs"
        let strMax3 = "\(String(format: "%.1f", weightNumbers[3]))lbs"
        let strMax4 = "\(String(format: "%.1f", weightNumbers[4]))lbs"
        let strMax5 = "\(String(format: "%.1f", weightNumbers[5]))lbs"
        let strMax6 = "\(String(format: "%.1f", weightNumbers[6]))lbs"
        let strMax7 = "\(String(format: "%.1f", weightNumbers[7]))lbs"

        s1weight.text = strMax1
        s2weight.text = strMax2
        s3weight.text = strMax3
        s4weight.text = strMax4
        s5weight.text = strMax5
        s6weight.text = strMax6
        s7weight.text = strMax7
        
        // Do any additional setup after loading the view.
    
    }
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "v2tv1", sender: self)
        }

    @IBAction func Start(_ sender: UIButton) {
        self.passWeightNumbers = Float(finalMax)!
        performSegue(withIdentifier: "v2tv3", sender: self)
        }
    
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier ==  "v2tv3"{
            let vc = segue.destination as! ViewController3
            vc.recWeight = self.passWeightNumbers
            }else{
            let vc = segue.destination as! ViewController
        }
    }
    

}
