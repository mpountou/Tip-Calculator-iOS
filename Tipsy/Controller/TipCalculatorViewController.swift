import UIKit

class TipCalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    var tipAmount = 0.0
    var splitCount = 2
    var tipPercent = "10%"
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.keyboardType = .numberPad
        
    }
    
    @IBAction func onTipChanged(_ sender: UIButton) {
        zeroButton.isSelected = sender.tag == 0
        tenButton.isSelected = sender.tag == 10
        twentyButton.isSelected = sender.tag == 20
        tipPercent = "\(sender.tag)%"
    }
    
    @IBAction func onSplitChanged(_ sender: UIStepper) {
        splitCount = Int(sender.value)
        splitLabel.text = "\(splitCount)"
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        let amount = Double(billTextField.text ?? "") ?? 0.0
        if amount == 0.0 {
            return
        }
        var totalTip: Double = if zeroButton.isSelected {
            0.0
        } else if tenButton.isSelected {
            amount * 0.1
        } else {
            amount * 0.2
        }
        
        tipAmount = totalTip / Double(splitCount)
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? ResultsViewController {
            destination.splitCount = self.splitCount
            destination.tipPercent = self.tipPercent
            destination.tipAmount = self.tipAmount
        }
    }
}

