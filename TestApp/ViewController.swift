//
//  ViewController.swift
//  TestApp
//
//  Created by Sahil on 22/07/16.
//  Copyright © 2016 Sahil. All rights reserved.
//

import UIKit


import Foundation
class viehcle {
  //SuperClass viehcle
  var currentSpeed = 0
  let maxSpeed = 180
  var descripion:String{
    return "Current speed is \(currentSpeed)"
  }
}
class car:viehcle{
  //SubClass car inherits from viehcle
  var currentGear = 1
  var dangerText = ""
  //override of description instance property
  override var descripion: String{
    return ("The current speed is \(super.currentSpeed) and the gear is \(currentGear) \(dangerText)")
  }
}
class AutomaticCar:car{
  //SubClass AutomaticCar which inherits fom superClass car
  
  
  //override of dangerText instance property of car
  override var dangerText: String{
    didSet{
      if currentSpeed>maxSpeed{
        let slowDown = "Slow Down !"
        dangerText = dangerText.stringByAppendingString(slowDown)
      }
    }
  }
  //override current speed instance property of car
  override var currentSpeed: Int{
    didSet{
      
      currentGear = (currentSpeed/40)+1
      
      if currentGear <= 4 {
        
        currentGear = self.currentGear
        
      }
      else{
        currentGear = 4
      }
    }
  }
}


class ViewController: UIViewController {

  @IBOutlet weak var winterImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let label = UILabel(frame: CGRect(x: 10, y: 0, width: self.winterImageView.frame.width - 10, height: 30))
    label.textColor = UIColor.redColor()
  
    label.userInteractionEnabled = true
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    label.addGestureRecognizer(tapGesture)
    label.text = "Is Winter is coming, My Friend?"
    self.winterImageView.addSubview(label)

  }

  func handleTap(sender: UITapGestureRecognizer) {
    let senderView = sender.view as! UILabel
    senderView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: senderView, attribute: .CenterX, relatedBy: .Equal, toItem: self.winterImageView, attribute: .CenterX, multiplier: 1, constant: 0).active = true
   
    NSLayoutConstraint(item: senderView, attribute: .CenterY, relatedBy: .Equal, toItem: self.winterImageView, attribute: .CenterY, multiplier: 1, constant: 0).active = true
     print(senderView.text)
    senderView.text = "Yes!!! Winter is coming, My Friend!!"
  }

}

