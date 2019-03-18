//
//  ViewController.swift
//  ExplodingBlocks
//
//  Created by Elliot Glaze on 18/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    @objc func handleTap() {
        (0...50).forEach { (_) in
            generateAnimatedViews()
        }
    }
    fileprivate func generateAnimatedViews() {
        
        let blockView = UIView(frame: CGRect(x: -30, y: -30, width: 30, height: 30))
        blockView.backgroundColor = UIColor.random
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 1 + drand48() * 3
        animation.fillMode = CAMediaTimingFillMode.removed
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        blockView.layer.add(animation, forKey: nil)
        
        view.addSubview(blockView)
    }


}



func customPath() -> UIBezierPath {
    let bounds = UIScreen.main.bounds
    
    let width = bounds.width
    let widthHalf = bounds.width / 2
    let height = bounds.height
    let heightHalf = bounds.height / 2
    
    let heightD = Double(height)
    let heightHalfD = Double(heightHalf)
    let widthD = Double(width)
    let widthHalfD = Double(widthHalf)
    
    let path = UIBezierPath()

    //start
    path.move(to: CGPoint(x: widthHalfD + drand48() / 300, y: heightD))
    //end
    let endPoint = CGPoint(x: widthD - drand48() * 500, y: heightHalfD)
    
    path.addLine(to: endPoint)

    return path
}


class AnimatedView: UIView {
    override func draw(_ rect: CGRect) {
        let path = customPath()
        path.lineWidth = 3
        path.stroke()
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}

