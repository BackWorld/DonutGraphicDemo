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

        donutView.cornerRadius = 30
        donutView.slices = [
			DonutView.SliceData(value: 0.3, tintColor: .red, text: nil),
			DonutView.SliceData(value: 0.5, tintColor: .green, text: nil),
			DonutView.SliceData(value: 0.2, tintColor: .blue, text: nil)
        ]
    }


}

