//
//  SecondViewController.swift
//  XHSegmentViewController
//
//  Created by xhh on 2017/12/7.
//  Copyright © 2017年 xhh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        let label = UILabel(frame:CGRect(x:(XH_SCREEN_WIDTH-100)/2, y:100, width:100, height:30))
        label.textColor = UIColor.yellow
        label.font = UIFont.systemFont(ofSize:22)
        label.text = "Second"
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
