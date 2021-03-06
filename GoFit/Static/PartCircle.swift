//
//  PartCircle.swift
//  GoFit
//
//  Created by Sanzhar Koshkarbayev on 06.06.2022.
//

import Foundation
import UIKit

class PartCircleIndicator: UIView {

    private var progressLayer: CAShapeLayer!
    private var fullSize: CGSize!
    private var grayCircleSize: CGSize!
    private var innerGrayCircleSize: CGSize!
    private var greenCircleSize: CGSize!
    var value: CGFloat = 0.0
    var isInnerCircleExist: Bool

    func getOutherGrayCircle() -> CAShapeLayer {
        let center = CGPoint(x: fullSize.width / 2, y: fullSize.height)
        let beizerPath = UIBezierPath()
        beizerPath.move(to: center)
        beizerPath.addArc(withCenter: center,
                    radius: grayCircleSize.width / 2,
                    startAngle: .pi,
                    endAngle: 2 * .pi,
                    clockwise: true)
        beizerPath.close()
        let innerGrayCircle = CAShapeLayer()
        innerGrayCircle.path = beizerPath.cgPath
        innerGrayCircle.fillColor = UIColor.gray.cgColor
        return innerGrayCircle
    }
    
    func getInnerGrayCircle() -> CAShapeLayer {
        let center = CGPoint(x: fullSize.width / 2, y: fullSize.height)
        let beizerPath = UIBezierPath()
        beizerPath.move(to: center)
        beizerPath.addArc(withCenter: center,
                    radius: innerGrayCircleSize.width / 2,
                    startAngle: .pi,
                    endAngle: 2 * .pi,
                    clockwise: true)
        beizerPath.close()
        let innerGrayCircle = CAShapeLayer()
        innerGrayCircle.path = beizerPath.cgPath
        innerGrayCircle.fillColor = UIColor.gray.cgColor
        return innerGrayCircle
    }
    
    func getGreenCircle() -> CAShapeLayer {
        let center = CGPoint(x: fullSize.width / 2, y: fullSize.height)
        let beizerPath = UIBezierPath()
        beizerPath.move(to: center)
        beizerPath.addArc(withCenter: center,
                    radius: greenCircleSize.width / 2,
                    startAngle: .pi,
                    endAngle: .pi,
                    clockwise: true)
        beizerPath.close()
        let greenCircleLayer = CAShapeLayer()
        greenCircleLayer.path = beizerPath.cgPath
        greenCircleLayer.fillColor = UIColor.green.cgColor
        return greenCircleLayer
    }

    func drawShape(bounds: CGRect) {
        fullSize = bounds.size
        grayCircleSize = fullSize
        greenCircleSize = CGSize(width: bounds.width - 6.0, height: bounds.width - 6.0)
        innerGrayCircleSize = CGSize(width: greenCircleSize.width - 44.0,
                                     height: greenCircleSize.width - 44.0)
        let outerCicrcle = getOutherGrayCircle()
        let greenCircle = getGreenCircle()
        progressLayer = greenCircle
        self.layer.addSublayer(outerCicrcle)
        self.layer.addSublayer(greenCircle)
        if isInnerCircleExist {
            let innerGrayCircle = getInnerGrayCircle()
            self.layer.addSublayer(innerGrayCircle)
        }
        
        self.layer.masksToBounds = true
    }
    
    func updateProgress(percent: CGFloat) {
        var newValue: CGFloat = 0.0
        if percent < 0.0 {
            newValue = 0.0
        } else if percent > 1.0 {
            newValue = 1.0
        } else {
            newValue = percent
        }
        value = newValue
        let width = fullSize.width
        let center = CGPoint(x: width / 2, y: width / 2)
        let startAngle: CGFloat = .pi
        let endAngle: CGFloat = .pi + newValue * .pi
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center,
                    radius: greenCircleSize.width / 2,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: true)
        path.close()
        progressLayer.path = path.cgPath
    }
    
    init(frame: CGRect, isInnerCircleExist: Bool = false) {
        self.isInnerCircleExist = isInnerCircleExist
        super.init(frame: frame)
        drawShape(bounds: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
