//
//  Gradient.swift
//  GoFit
//
//  Created by Sanzhar Koshkarbayev on 06.06.2022.
//

import Foundation
import UIKit

public extension UIViewController{
    func gradientColor(bounds: CGRect, gradientLayer: CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image!)
    }
    
    func setGradientLayer(color1: UIColor, color2: UIColor, bounds : CGRect) -> UIColor? {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = CGPoint(x: -1.0, y: -1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gradientColor(bounds: bounds, gradientLayer: gradient)
    }
}

class BlueGradientButton: UIButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [ColorPalette.blue_linear1.cgColor, ColorPalette.blue_linear2.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = 30
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
}

class BlueGradientView: UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [ColorPalette.blue_linear1.cgColor, ColorPalette.blue_linear2.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = 30
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
}
