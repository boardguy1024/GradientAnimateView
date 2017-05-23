//
//  ViewController.swift
//  GradientAnimateView
//
//  Created by park kyung suk on 2017/05/23.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gradientView: UIViewEx!
    var colorArray: [(color1: UIColor, color2: UIColor)] = []
    
    var currentColorArrayIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //colorLiteralで色設定
        colorArray.append((color1:#colorLiteral(red: 1, green: 0.2068049014, blue: 0.3306583762, alpha: 1) ,color2: #colorLiteral(red: 0.7885962129, green: 0.2640431523, blue: 0.8871792555, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.7885962129, green: 0.2640431523, blue: 0.8871792555, alpha: 1) ,color2: #colorLiteral(red: 0.6066229343, green: 0.2149662673, blue: 0.8904331326, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.6066229343, green: 0.2149662673, blue: 0.8904331326, alpha: 1) ,color2: #colorLiteral(red: 0.3102118075, green: 0.2754229605, blue: 0.8918494582, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.3102118075, green: 0.2754229605, blue: 0.8918494582, alpha: 1) ,color2: #colorLiteral(red: 0.3354791999, green: 0.3793137074, blue: 0.8893892169, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.4454137087, green: 0.4214757085, blue: 0.9523763061, alpha: 1) ,color2: #colorLiteral(red: 0.4525182843, green: 0.4140599966, blue: 0.9525302052, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.4525182843, green: 0.4140599966, blue: 0.9525302052, alpha: 1) ,color2: #colorLiteral(red: 0.92664814, green: 0.3664760292, blue: 0.9478432536, alpha: 1)))
        colorArray.append((color1:#colorLiteral(red: 0.92664814, green: 0.3664760292, blue: 0.9478432536, alpha: 1) ,color2: #colorLiteral(red: 1, green: 0.177952081, blue: 0.566079855, alpha: 1)))
        
        animateBackgroundColor()
    }

    func animateBackgroundColor() {
        
        print("colorArray count is : \(colorArray.count)")
        
        //colorArrayをループさせるためのIndex
        currentColorArrayIndex =
            currentColorArrayIndex == (colorArray.count - 1 ) ? 0 : currentColorArrayIndex + 1
        //transitionCrossDissolve :
        UIView.transition(with: gradientView, duration: 2, options:[.transitionCrossDissolve], animations: {
        
            self.gradientView.firstColor = self.colorArray[self.currentColorArrayIndex].color1
            self.gradientView.secondColor = self.colorArray[self.currentColorArrayIndex].color2
        }, completion: { (success) in
            
            //再帰呼び出しで色の変化をループさせる
            self.animateBackgroundColor()
        })
    }
 }

