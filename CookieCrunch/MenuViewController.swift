import UIKit

class MenuViewController: UIViewController {

  @IBOutlet weak var viralPoints: UILabel!
  @IBOutlet weak var diamonds: UILabel!
  @IBOutlet weak var level: UILabel!
  var text:Int?
  var points:Int?

  
  @IBAction func goToMap(_ sender: Any) {
    performSegue(withIdentifier: "MapSegue", sender: self)
  }

  @IBAction func goToInfections(_ sender: Any) {
    performSegue(withIdentifier: "InfectionsSegue", sender: self)
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    if let receivedText = text {
      diamonds.text = String(format: "%ld", receivedText);

    }
    
    if let receivedPoints = points {
      viralPoints.text = String(format: "%ld", receivedPoints);

    }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
