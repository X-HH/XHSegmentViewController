//
//  XHUtil.swift
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

let XH_SCREEN_WIDTH = (Int)(UIScreen.main.bounds.size.width)
let XH_SCREEN_HEIGHT = (Int)(UIScreen.main.bounds.size.height)

let XH_IS_iPhoneX_DEPEND_H = (XH_SCREEN_HEIGHT > 736)

func XH_IS_EQUAL_SIZE(modeSize:CGSize) -> Bool {
    return modeSize.equalTo(UIScreen.main.bounds.size)
}

let XH_IS_SCREEN_320X480 = XH_IS_EQUAL_SIZE(modeSize: CGSize(width:320, height:480))

let XH_IS_SCREEN_320X568 = XH_IS_EQUAL_SIZE(modeSize: CGSize(width:320, height:568))

let XH_IS_SCREEN_375X667 = XH_IS_EQUAL_SIZE(modeSize: CGSize(width:375, height:667))

let XH_IS_SCREEN_320X667 = XH_IS_EQUAL_SIZE(modeSize: CGSize(width:320, height:667))

let XH_IS_SCREEN_414X736 = XH_IS_EQUAL_SIZE(modeSize: CGSize(width:414, height:736))

let XH_IS_SCREEN_375X812 = XH_IS_EQUAL_SIZE(modeSize: CGSize(width:375, height:812))

let XH_NAVIGATIONBAR_HEIGHT = (Int)(XH_IS_SCREEN_375X812 ? 88:64)

let XH_SAFEAREA_BOTTOM_HEIGHT = (Int)(XH_IS_SCREEN_375X812 ? 34:0)

func x(object: UIView) -> CGFloat {
    return object.frame.origin.x
}

func y(object: UIView) -> CGFloat {
    return object.frame.origin.y
}

func w(object: UIView) -> CGFloat {
    return object.frame.size.width
}

func h(object: UIView) -> CGFloat {
    return object.frame.size.height
}

func left(object: UIView) -> CGFloat {
    return x(object: object)
}

func right(object: UIView) -> CGFloat {
    return (x(object: object) + w(object: object))
}

func top(object: UIView) -> CGFloat {
    return y(object: object)
}

func bottom(object: UIView) -> CGFloat {
    return (y(object: object) + h(object: object))
}

class XHUtil {
    
}
