//
//  UIViewEx.swift
//  GradientAnimateView
//
//  Created by park kyung suk on 2017/05/23.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit

//Attribute inspectにPropertyを表示させるために設定
@IBDesignable
class UIViewEx: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    //グラデーションの方向を設定するためのフラグ
    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            updateView()
        }
    }
    //UIViewのサブクラスを作り、layerClassをオーバーライドして　CAGradientLayerに差し替える
    //UIViewのLaterClassはデフォルトとしてCALayerを返すが、
    //このクラスはグラデーションレイヤを使用しているのでサブクラスのCAGradientLayerを返すようにする
    //これをしないとエラーになる。
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        //LayerをCAGradientLayerとしてインスタンスを生成
        let layer = self.layer as! CAGradientLayer
        //layerにinspectから選択したグラデーションするための色を設定
        layer.colors = [ firstColor.cgColor , secondColor.cgColor]
        
        if horizontalGradient {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 1, y: 0)
        } else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    //あまり使わないかもプロパティ
    //Mark:- Border Properties
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    //Shadow Properties
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var shadowOffsetX: CGFloat = 0 {
        didSet {
            layer.shadowOffset.width = shadowOffsetX
        }
    }
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    

   
    
    
    
}
