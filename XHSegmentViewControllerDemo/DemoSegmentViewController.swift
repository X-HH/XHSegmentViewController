//
//  DemoSegmentViewController.swift
//  XHSegmentViewController
//
//  Created by xhh on 2017/12/7.
//  Copyright © 2017年 xhh. All rights reserved.
//

import UIKit

class DemoSegmentViewController: XHSegmentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateSegmentUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateSegmentUI() {
        self.segmentViewHeight = 50
        self.selectedIndex = 2
        self.normalColor = UIColor.black
        self.selectedColor = UIColor.white
        self.normalFont = UIFont.systemFont(ofSize: 12)
        self.selectedFont = UIFont.systemFont(ofSize: 20)
        self.segmentBackgroundColor = UIColor.red
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
}
