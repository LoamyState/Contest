//
//  ViewController.swift
//  Contest
//
//  Created by J Madsen on 4/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitEmail(_ sender: Any) {
        guard let input = emailTextField.text else {
            return
        }
        if input.isNotEmpty, input.isValidEmail() {
            performSegue(withIdentifier: "entryAccepted", sender: sender)
        } else {
            shake(emailTextField)
        }
    }
    
    func shake(_ view: UIView) {
        
        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: .calculationModePaced) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                view.transform = CGAffineTransform(translationX: 5, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.1) {
                view.transform = CGAffineTransform(translationX: -5, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.1) {
                view.transform = CGAffineTransform(translationX: 5, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.1) {
                view.transform = CGAffineTransform(translationX: -5, y: 0)
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                view.transform = CGAffineTransform.identity
            }
        }

        
//        UIView.animate(withDuration: 0.1) {
//            let translation = CGAffineTransform(translationX: 5, y: 0)
//            view.transform = translation
//        } completion: { _ in
//            view.transform = CGAffineTransform.identity
//        }
    }
}

