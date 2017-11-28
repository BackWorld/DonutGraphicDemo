//
//  DonutSliceLayer.swift
//  DonutGraphicDemo
//
//  Created by zhuxuhong on 2017/11/28.
//Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

class DonutSliceLayer: CAShapeLayer {
// MARK: - Properties
    var tintColor: UIColor = .gray {
        didSet{
            setNeedsDisplay()
        }
    }
    
    var startAngle: CGFloat = 0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var endAngle: CGFloat = 0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    fileprivate var offsetAngle: CGFloat{
        return roundRadius / 100
    }
    
    var innerRadius: CGFloat = 0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var outerRadius: CGFloat = 0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var roundRadius: CGFloat = 10{
        didSet{
            setNeedsDisplay()
        }
    }
    
	
// MARK: - Override Method
    override init() {
        super.init()
        
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        
    }
    
    var sliceCGPath: CGPath{
        fillColor = tintColor.cgColor
        strokeColor = tintColor.cgColor
        lineWidth = roundRadius
        lineJoin = kCALineJoinRound
        
        let path = CGMutablePath()
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        path.addRelativeArc(center: center, radius: outerRadius - roundRadius, startAngle: startAngle, delta: endAngle - startAngle)
        path.addRelativeArc(center: center, radius: innerRadius - roundRadius, startAngle: endAngle - offsetAngle, delta: startAngle - endAngle + offsetAngle)
        path.closeSubpath()
        return path
    }
}

