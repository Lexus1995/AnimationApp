//
//  ViewController.swift
//  AnimationApp
//
//  Created by  Aliaksei on 05.04.2022.
//

import UIKit
import Spring

class ViewController: UIViewController {

    @IBOutlet var animatedView: SpringView!
    @IBOutlet var animationButton: SpringButton!
    @IBOutlet var viewText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedView.layer.cornerRadius = 10
        setViewText()
        animatedView.animate()
        prepareNextAnimation()
        animationButton.setTitle(_: "Run \(animatedView.animation.description)", for: .normal)
    }

    @IBAction func animationButtonPressed() {
        prepareNextAnimation()
        setViewText()
        animationButton.setTitle(_: "Run \(animatedView.animation.description)", for: .normal)
        animatedView.animate()

    }
    
    private func setViewText() {
        viewText.text = "preset: \(animatedView.animation.description)\ncurve: \(animatedView.curve)\nforce: \(animatedView.force)\nduration: \(animatedView.duration)\ndelay: \(animatedView.delay)"
    }
    private func generateRandomValues(from: CGFloat, to: CGFloat) -> CGFloat {
        round(CGFloat.random(in: from...to) * 10.0) / 10.0
    }
    
    private func prepareNextAnimation () {
        animatedView.animation = String(Spring.AnimationPreset.allCases.randomElement()!.rawValue)
        animatedView.curve = String(Spring.AnimationCurve.allCases.randomElement()!.rawValue)
        animatedView.force = generateRandomValues(from: 0.1, to: 1.0)
        animatedView.duration = generateRandomValues(from: 0.1, to: 1.0)
        animatedView.delay = generateRandomValues(from: 0.1, to: 1.0)
    }
    
}

