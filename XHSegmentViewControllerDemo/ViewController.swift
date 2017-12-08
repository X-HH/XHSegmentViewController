//
//  ViewController.swift
//  XHSegmentViewController
//
//  Created by xhh on 2017/11/27.
//  Copyright © 2017年 xhh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let pushButton = UIButton(type: .custom)
        pushButton.frame = CGRect(x:(self.view.bounds.size.width-120)/2, y: 200, width:120, height:44)
        pushButton.setTitle("push", for: .normal)
        pushButton.setTitleColor(UIColor.red, for: .normal)
        pushButton.addTarget(self, action: #selector(self.push(sender:)), for: .touchUpInside)
        self.view.addSubview(pushButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func push(sender: UIButton) {
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        
        let demoSegmentVC = DemoSegmentViewController(viewControllers:[firstVC, secondVC, thirdVC], titles:["11", "22", "33"])
        
        self.navigationController?.pushViewController(demoSegmentVC, animated: true)
    }
}

