//
//  ViewController.swift
//  popupTeste
//
//  Created by Aluno on 06/04/2018.
//  Copyright © 2018 Aluno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet var alo: UIView!
    @IBOutlet weak var alotext: UILabel!
    
    var displayingCard = false
    var effect: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        alo.frame = CGRect(x: 87, y: 233, width: 200, height: 200)
        alotext.text = "A L O"
        alotext.textColor = .white
        alo.layer.cornerRadius = 10
        alo.layer.masksToBounds = true
        
        effect = UIVisualEffectView(frame: view.bounds)
        effect.effect = UIBlurEffect(style: .dark)
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(_ sender: Any) {
        alo.center = view.center
        alo.transform = CGAffineTransform(scaleX: 0, y: 0)
        alo.alpha = 0
        effect.alpha = 0
        
        view.addSubview(effect)
        view.addSubview(alo)
        displayingCard = true
        
        UIView.animate(withDuration: 0.5) {
            self.effect.alpha = 1
            self.alo.alpha = 1
            self.alo.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func dismissCard() {
        UIView.animate(withDuration: 0.5, animations: {
            self.effect.alpha = 0
            self.alo.alpha = 0
            self.alo.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }, completion: {
            (value: Bool) in
            self.alo.removeFromSuperview()
            self.effect.removeFromSuperview()
        })
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if !self.alo.frame.contains(location) && self.alo.alpha == 1 {
            dismissCard()
            print("eoq")
        }
    }
    
}
