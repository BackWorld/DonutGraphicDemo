//
//  ViewController.swift
//  DonutGraphicDemo
//
//  Created by zhuxuhong on 2017/11/28.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var donutView: DonutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        donutView.cornerRadius = 10
        donutView.slices = [
            DonutView.SliceData(startAngle: 0, endAngle: .pi / 4, tint: .red, text: nil),
            DonutView.SliceData(startAngle: .pi / 4 + donutView.cornerRadius / 100, endAngle: .pi, tint: .green, text: nil),
        ]
    }


}

