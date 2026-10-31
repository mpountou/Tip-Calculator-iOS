import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var recalculatePressed: UIButton!
    
    var tipAmount: Double = 0.0
    var splitCount = 2
    var tipPercent = "0%"
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f",tipAmount)
        settingsLabel.text = "Split between \(splitCount), with \(tipPercent) tip."
        
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
