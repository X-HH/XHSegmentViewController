//
//  XHSegmentView.swift
//  XHSegmentViewController
//
//  Created by xhh on 2017/11/27.
//  Copyright © 2017年 xhh. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

class XHSegmentView: UIView {
    var normalColor:UIColor! = UIColor.gray
    var selectedColor:UIColor! = UIColor.red
    var normalFont:UIFont! = UIFont.systemFont(ofSize: 14)
    var selectedFont:UIFont! = UIFont.systemFont(ofSize: 18)
    var segmentBackgroundColor:UIColor! = UIColor.yellow
    var titles:[String]!
    var titleButtons = [UIButton]()
    var selectedIndex:Int = 0 {
        didSet {
            self.changeSelectedUI(selectIndex: selectedIndex)
        }
    }
    var oldSelectedIndex = 0
    let kSegmentViewTag = 100
    var didSelectAtIndex: ((_ segment: XHSegmentView?,_ index: Int) -> Void)?
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        let count = self.titles.count
        let width = Int(self.frame.size.width / CGFloat(count))
        self.backgroundColor = self.segmentBackgroundColor
        for i in 0..<count {
            let btn:UIButton = self.prepareBtn(index: i)
            btn.tag = i + kSegmentViewTag
            btn.frame = CGRect(x:i * width, y:0, width:width, height:Int(h(object: self)))
            btn.setTitle(self.titles[i], for:UIControlState.normal)
            titleButtons.append(btn)
            self.addSubview(btn)
        }
        self.changeSelectedUI(selectIndex: self.selectedIndex)
    }
    
    func prepareBtn(index:Int) -> UIButton {
        let btn:UIButton = UIButton(type:.custom)
        let title = self.titles[index]
        btn.tag = index
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(self.normalColor, for: .normal)
        btn.setTitleColor(self.selectedColor, for: .selected)
        btn.titleLabel?.font = self.normalFont
        btn.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        return btn
    }
    
    func btnClicked(btn: UIButton) {
        let index = btn.tag - kSegmentViewTag
        if index == selectedIndex {
            return
        }
        self.selectedIndex = index
        if didSelectAtIndex != nil {
            didSelectAtIndex!(self, self.selectedIndex)
        }
        self.oldSelectedIndex = self.selectedIndex
    }
    
    func changeSelectedUI(selectIndex: Int) {
        for index in 0..<titleButtons.count {
            let button = titleButtons[index]
            button.isSelected = false
            button.titleLabel?.font = self.normalFont
            if index == selectedIndex {
                button.isSelected = true
                button.titleLabel?.font = self.selectedFont
            }
        }
    }
}
