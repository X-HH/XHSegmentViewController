//
//  XHContentView.swift
//  XHSegmentViewController
//
//  Created by xhh on 2017/12/7.
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

class XHContentView: UIScrollView, UIScrollViewDelegate {
    var viewControllers: [UIViewController]?
    var didScrollAtIndex: ((_ scrollView: UIScrollView?,_ index: Int) -> Void)?
    var scrollOffsetX = 0 {
        didSet {
            self.updateContentOffset()
        }
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience public init(frame: CGRect, viewControllers: [UIViewController]) {
        self.init(frame: frame)
        self.viewControllers = viewControllers
        self.updateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        self.delegate = self
        self.backgroundColor = UIColor.white
        self.contentSize = CGSize(width:Int(XH_SCREEN_WIDTH)*(viewControllers?.count)!, height:Int(self.bounds.size.height))
        self.isPagingEnabled = true
        
        for index in 0..<viewControllers!.count {
            let vc = viewControllers![index]
            vc.view.frame = CGRect(x:CGFloat(Int(XH_SCREEN_WIDTH * index)), y:0, width:w(object: self), height:h(object: self))
            self.addSubview(vc.view)
        }
    }
    
    func updateContentOffset() {
        self.setContentOffset(CGPoint(x:(Int)(scrollOffsetX) , y:(Int)(self.contentOffset.y)), animated: false)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.x
        if didScrollAtIndex != nil {
            didScrollAtIndex!(self, (Int)(offsetY)/XH_SCREEN_WIDTH)
        }
    }
    
    func showViewController(selectIndex: Int) {
        self.setContentOffset(CGPoint(x: (CGFloat)(XH_SCREEN_WIDTH * selectIndex), y:0), animated: true)
    }
    
}
