//
//  ViewController.swift
//  CustomTextToSepeech
//
//  Created by Md Murad Hossain on 15/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var speechButton: UIButton!
    @IBOutlet weak var pressButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        textView.text = "Bangladesh is a small country. Bangladesh is a river country."
        textView.layer.cornerRadius = 20
        clearButton.layer.cornerRadius = 20
        speechButton.layer.cornerRadius = 20
        textView.layer.borderColor = UIColor.black.cgColor
        clearButton.tintColor = .cyan
        clearButton.backgroundColor = .black
        speechButton.backgroundColor = .black
        speechButton.tintColor = .cyan
        
//      MARK: Button Animation
        clearButton.clearButtonAnimation()
        speechButton.speechButtonAnimation()

    }
    
    @IBAction func buttonTappedAction(_ sender: UIButton) {
        if sender == clearButton {
            if textView.text == "" {
                // Create Alert
                let alertAction = UIAlertController(title: "Opps!", message: "Your textbox is already empty.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { [self] (action) -> Void in
                    // print("Ok button tapped")
                    clearButton.tintColor = .cyan
                    clearButton.backgroundColor = .black
                    speechButton.backgroundColor = .black
                    speechButton.tintColor = .cyan

                })
                alertAction.addAction(ok)
                self.present(alertAction, animated: true, completion: nil)
            }
            else {
                clearButton.backgroundColor = .systemPink
                clearButton.tintColor = .black
                speechButton.tintColor = .cyan
                speechButton.backgroundColor = .black
                textView.text = ""
                textView.becomeFirstResponder()
            }
            
        }
        else if sender == speechButton {
            if textView.text == "" {
                // Create Alert
                let alertAction = UIAlertController(title: "Emty!", message: "Your textbox is empty. Please type something in the text box and click the 'Speech' button!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { [self] (action) -> Void in
                    SpeechService.shared.startSpeech(textView.text)
                    clearButton.tintColor = .cyan
                    clearButton.backgroundColor = .black
                    speechButton.backgroundColor = .black
                    speechButton.tintColor = .cyan
//                    print("Ok button tapped")
                })
                alertAction.addAction(ok)
                self.present(alertAction, animated: true, completion: nil)
                
            }
            else {
                clearButton.backgroundColor = .black
                clearButton.tintColor = .cyan
                speechButton.tintColor = .black
                speechButton.backgroundColor = .systemPink
                textView.resignFirstResponder()
                SpeechService.shared.startSpeech(textView.text)
            }
            
        }
        else if sender == pressButton {
            clearButton.tintColor = .cyan
            clearButton.backgroundColor = .black
            speechButton.backgroundColor = .black
            speechButton.tintColor = .cyan
        }
    }
}

// MARK: Button Animation
extension UIView {
    func speechButtonAnimation() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 0.98
        pulse.toValue = 0.90
        pulse.autoreverses = true
        pulse.repeatCount = 10000000000
        pulse.initialVelocity = 0.98
        pulse.damping = 30
        layer.add(pulse, forKey: "pulse")
    }
    
    func clearButtonAnimation() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1.2
        pulse.fromValue = 0.98
        pulse.toValue = 0.90
        pulse.autoreverses = true
        pulse.repeatCount = 10000000000
        pulse.initialVelocity = 0.98
        pulse.damping = 30
        layer.add(pulse, forKey: "pulse")
    }
}

