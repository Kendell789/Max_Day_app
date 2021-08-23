//
//  ViewController.swift
//  Max Day
//
//  Created by Kendell Graham on 6/14/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var picker: UIPickerView!
    
    let data = (0...1000).map { "\($0)" }
    var lift = "null"
    var Max = "null"
    var passMax = ""
    var passLift = ""
    
    
    @IBOutlet weak var deadlift: UIButton!
    @IBOutlet weak var bench: UIButton!
    @IBOutlet weak var squat: UIButton!
    @IBOutlet weak var selectliftbtn: UIButton!
    @IBOutlet var liftcollections: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
        selectliftbtn.layer.cornerRadius = selectliftbtn.frame.height / 2
        liftcollections.forEach {(btn) in btn.layer.cornerRadius = btn.frame.height / 2
            showAlert()
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func SelectLiftPressed(_ sender: UIButton) {
    }
    @IBAction func liftPressed(_ sender: UIButton) {
        if let btnLbl = sender.titleLabel?.text{
            print(btnLbl)
            lift = btnLbl
            if btnLbl == "Squat" {
                squat.setTitleColor(.white, for: .normal)
                bench.setTitleColor(.systemYellow, for: .normal)
                deadlift.setTitleColor(.systemYellow, for: .normal)
            }
            else if btnLbl == "Bench"{
                squat.setTitleColor(.systemYellow, for: .normal)
                bench.setTitleColor(.white, for: .normal)
                deadlift.setTitleColor(.systemYellow, for: .normal)
            }
            else{
                squat.setTitleColor(.systemYellow, for: .normal)
                bench.setTitleColor(.systemYellow, for: .normal)
                deadlift.setTitleColor(.white, for: .normal)
            }
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Field Missing", message:
            "Please ensure you select a Lift and a Weight", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }

@IBAction func Max(_ sender: Any) {
    if(lift == "null" || Max == "null"){
        showAlert()
    }else{
    self.passLift = lift
    self.passMax = Max
    performSegue(withIdentifier: "v1tv2", sender: self)
    }
}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ViewController2
        vc.finalMax = self.passMax
        vc.finalLift = self.passLift
    }

}


extension ViewController: UIPickerViewDataSource  {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
}

extension ViewController: UIPickerViewDelegate  {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]

    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Max = data[row]

    }
}
