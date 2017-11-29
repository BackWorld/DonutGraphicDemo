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
			roundRadius = roundRadius > 10 ? 10 : roundRadius
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
		
        path.addRelativeArc(center: center, radius: outerRadius - roundRadius, startAngle: startAngle, delta: endAngle - startAngle )
        path.addRelativeArc(center: center, radius: innerRadius - roundRadius, startAngle: endAngle, delta: startAngle - endAngle)
        path.closeSubpath()
        return path
    }
	
	var sliceNewCGPath: CGPath{
		fillColor = tintColor.cgColor
		strokeColor = tintColor.cgColor
		lineWidth = roundRadius
		lineJoin = kCALineJoinRound
		
		let halfOfAngle = (endAngle - startAngle) / 2
		let innerRadiusOffset = lineWidth / sin(halfOfAngle)

		let path = CGMutablePath()
		let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
		let bPath = UIBezierPath(arcCenter: center, radius: innerRadiusOffset, startAngle: startAngle, endAngle: startAngle + halfOfAngle, clockwise: true)
		
		let newCenter = bPath.currentPoint
		
		let innerR = outerRadius - cos(halfOfAngle) * innerRadiusOffset - roundRadius * 2
		
		path.addRelativeArc(center: newCenter, radius: innerR, startAngle: startAngle, delta: endAngle - startAngle)
		path.addRelativeArc(center: newCenter, radius: innerR - (outerRadius - innerRadius), startAngle: endAngle, delta: startAngle - endAngle)
		path.closeSubpath()
		
		return path
	}
}

