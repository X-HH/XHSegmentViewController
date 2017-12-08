//
//  XHSegmentViewController.swift
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

class XHSegmentViewController: UIViewController {
    var segmentView: XHSegmentView?
    var contentView: XHContentView?
    var viewControllers: [UIViewController]?
    var titles:[String]!
    var selectedIndex: Int = 0 {
        didSet {
            self.segmentView?.selectedIndex = selectedIndex
        }
    }
    var segmentViewHeight:Int = 50
    var topOffset:Int = XH_NAVIGATIONBAR_HEIGHT
    var bottomOffset:Int = 0
    var normalColor:UIColor! = UIColor.gray
    var selectedColor:UIColor! = UIColor.red
    var normalFont:UIFont! = UIFont.systemFont(ofSize: 14)
    var selectedFont:UIFont! = UIFont.systemFont(ofSize: 18)
    var segmentBackgroundColor:UIColor! = UIColor.yellow
    var showsVerticalScrollIndicator = true
    var showsHorizontalScrollIndicator = true
    
    convenience public init(viewControllers: [UIViewController], titles: [String] ) {
        self.init(viewControllers: viewControllers, titles: titles, selectedIndex: 0)
    }
    
    convenience public init(viewControllers: [UIViewController], titles: [String], selectedIndex: Int) {
        self.init(nibName: nil, bundle: nil)
        self.selectedIndex = selectedIndex
        self.titles = titles
        self.viewControllers = viewControllers
        self.updateUI()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUI()
    }
    
    func updateUI() {
        self.view.backgroundColor = UIColor.white
        self.segmentView = XHSegmentView(frame: CGRect(x:0, y:topOffset, width:Int(XH_SCREEN_WIDTH), height:self.segmentViewHeight))
        self.segmentView?.normalColor = normalColor
        self.segmentView?.selectedColor = selectedColor
        self.segmentView?.normalFont = normalFont
        self.segmentView?.selectedFont = selectedFont
        self.segmentView?.segmentBackgroundColor = segmentBackgroundColor
        self.segmentView?.titles = self.titles
        self.segmentView?.selectedIndex = self.selectedIndex
        self.segmentView?.didSelectAtIndex = {
            [unowned self] (segment, index) in
            self.contentView?.showViewController(selectIndex: index)
        }
        self.segmentView?.updateUI()
        self.view.addSubview(self.segmentView!)
        
        self.contentView = XHContentView(frame: CGRect(x:0, y:Int(bottom(object: self.segmentView!)), width:XH_SCREEN_WIDTH, height:Int(XH_SCREEN_HEIGHT - XH_NAVIGATIONBAR_HEIGHT - self.segmentViewHeight - self.bottomOffset)), viewControllers:self.viewControllers!)
        self.contentView?.scrollOffsetX = self.selectedIndex * XH_SCREEN_WIDTH
        self.contentView?.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        self.contentView?.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        self.contentView?.didScrollAtIndex = {
            [unowned self] (segment, index) in
            self.segmentView?.selectedIndex = index
        }
        self.view.addSubview(self.contentView!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
