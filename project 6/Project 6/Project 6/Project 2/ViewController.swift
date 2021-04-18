
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    
    var countries = [String] ()
    var score = 0
    var correctAnswer = 0
    var quastion = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        countries += ["estonia","france", "germany",
                      "ireland", "italy", "monaco",
                      "nigeria", "poland","russia",
                      "spain", "uk", "us"]
   
        buttonOne.layer.borderWidth = 1
        buttonTwo.layer.borderWidth = 1
        buttonThree.layer.borderWidth = 1
        
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
 
    func askQuestion (action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
    
        title = "\(countries[correctAnswer].uppercased()) \(score)"
    }
 
    @IBAction func actionButtonOne(_ sender: UIButton) {
        var title: String!
        if quastion < 9 {
        if sender.tag == correctAnswer{
           title = "Correct"
            score += 1
            quastion += 1
        } else {
         title = "Wrong"
          score -= 1
          quastion += 1

        }
        func alerts () {
            let alertWrongController = UIAlertController(title: title, message: "Your score is \(score). That's the flag of \(countries[sender.tag].uppercased())! ", preferredStyle: .alert)
            alertWrongController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertWrongController, animated: true)
        }
        switch sender.tag {
         case 0 :
        if sender.tag != correctAnswer {
         alerts() }
         case 1 :
         if sender.tag != correctAnswer {
         alerts() }
         case 2 :
         if sender.tag != correctAnswer {
         alerts()
            }
        default:
            break
        }
        
   let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        } else {
               quastion = 0
               let dc = UIAlertController(title: "FINISH", message: "Your score is \(score)", preferredStyle: .alert)
                    dc.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
                    present(dc, animated: true)
            score = 0

    }

}

}
