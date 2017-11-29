//
//  DonutView.swift
//  DemoDonutChart
//
//  Created by zhuxuhong on 2017/11/27.
//  Copyright © 2017年 北大方正电子. All rights reserved.
//

import UIKit

class DonutView: UIView {
    struct SliceData {
        var value: Float
		var tintColor: UIColor
        var text: String?
        
        init(value: Float, tintColor: UIColor, text: String?) {
            self.value = value
            self.tintColor = tintColor
            self.text = text
        }
    }
// MARK: - IBOutlets
	
// MARK: - Properties
    var cornerRadius: CGFloat = 0
    
    var thickness: CGFloat = 100
    
    var slices: [SliceData] = []
	
// MARK: - Initial Method
	private func setupUI() {
//        backgroundColor = .clear
	}
	
 
// MARK: - Lifecycle Method
	override func awakeFromNib() {
		super.awakeFromNib()		
		setupUI()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
	var layers: [DonutSliceLayer] = []
	
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		buildFakeSliceLayers()
	}
	
	fileprivate func buildFakeSliceLayers(){
		let outerRadius = min(bounds.width, bounds.height) / 2
		var endAngle: CGFloat = 0
		
		for (i, slice) in slices.enumerated() {
			let slayer = DonutSliceLayer()
			slayer.frame = bounds
			slayer.startAngle = endAngle
			slayer.endAngle = i == 0 ? angle(of: slice) : angle(of: slice) + endAngle
			slayer.innerRadius = outerRadius - thickness
			slayer.outerRadius = outerRadius
			
			endAngle = slayer.endAngle
			
			let layer = CAShapeLayer()
			layer.frame = bounds
			layer.lineCap = kCALineCapRound
			layer.lineJoin = kCALineJoinRound
			layer.lineWidth = 10
			layer.strokeColor = UIColor.white.cgColor
			layer.fillColor = slice.tintColor.cgColor
			layer.path = slayer.sliceCGPath
			self.layer.addSublayer(layer)
		}
	}
	
	fileprivate func buildSliceLayers(){
		
		let outerRadius = min(bounds.width, bounds.height) / 2
		var endAngle: CGFloat = 0
		let path = CGMutablePath()
		
		for (i, slice) in slices.enumerated() {
			let layer = DonutSliceLayer()
			layer.frame = bounds
			layer.startAngle = endAngle
			layer.endAngle = i == 0 ? angle(of: slice) : angle(of: slice) + endAngle
			layer.innerRadius = outerRadius - thickness
			layer.outerRadius = outerRadius
			layer.tintColor = slice.tintColor
			layer.roundRadius = cornerRadius
			layer.path = layer.sliceCGPath
			
			let v = UIView(frame: bounds)
			v.layer.addSublayer(layer)
			addSubview(v)
			
			endAngle = layer.endAngle
			
			layers.append(layer)
			path.addPath(layer.sliceCGPath)
		}
		
	}
	
	fileprivate lazy var sumOfSliceValues: Float = {
		return self.slices.map{ $0.value }.reduce(0){ $0 + $1 }
	}()
	
	fileprivate func angle(of slice: SliceData) -> CGFloat{
		return CGFloat(slice.value / sumOfSliceValues) * CGFloat.pi * 2
	}
	
	var sliceLayer = DonutSliceLayer()
	
	var i = true
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		for layer in layers {
			layer.path = i == true ? layer.sliceNewCGPath : layer.sliceCGPath
			layer.setNeedsDisplay()
		}
		
		i = !i
	}
	
	
// MARK: - Action & IBOutletAction
	
// MARK: - Override Method
	
// MARK: - Private method

// MARK: - Public Method

}
