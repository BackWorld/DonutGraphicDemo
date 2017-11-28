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
        var startAngle: CGFloat
        var endAngle: CGFloat
        var tint: UIColor
        var text: String?
        
        init(startAngle: CGFloat, endAngle: CGFloat, tint: UIColor, text: String?) {
            self.startAngle = startAngle
            self.endAngle = endAngle
            self.tint = tint
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
	
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
        
        let outerRadius = min(rect.width, rect.height) / 2
        for (_, slice) in slices.enumerated() {
            let layer = DonutSliceLayer()
            layer.frame = rect
            layer.startAngle = slice.startAngle
            layer.endAngle = slice.endAngle
            layer.innerRadius = outerRadius - thickness
            layer.outerRadius = outerRadius
            layer.tintColor = slice.tint
            layer.roundRadius = cornerRadius
            layer.path = layer.sliceCGPath
            
            self.layer.addSublayer(layer)
        }
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
	
// MARK: - Action & IBOutletAction
	
// MARK: - Override Method
	
// MARK: - Private method

// MARK: - Public Method

}
