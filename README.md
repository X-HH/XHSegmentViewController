# XHSegmentViewController
Swift实现的一个可高度定制的SegmentViewController

提供的配置项
---
- SegmentControl高度
- ContentView高度
- SegmentControl背景颜色
- SegmentControl普通和选中状态下的字体颜色和大小
- ...

安装
---
手动添加，把XHSegmentViewController下面的代码放到你的工程里面

安装要求
---
- Xcode8.3.2+
- iOS8.0+
- Swift3.0+

使用姿势
---
将需要做Segment切换功能的UIViewController继承XHSegmentViewController

```
class DemoSegmentViewController: XHSegmentViewController {
}
```
进行一些自定义配置

```
self.segmentViewHeight = 50
self.selectedIndex = 2
self.normalColor = UIColor.black
self.selectedColor = UIColor.white
self.normalFont = UIFont.systemFont(ofSize: 12)
self.selectedFont = UIFont.systemFont(ofSize: 20)
self.segmentBackgroundColor = UIColor.red
self.showsVerticalScrollIndicator = false
self.showsHorizontalScrollIndicator = false
```

协议
---
XHSegmentViewController 被许可在 MIT 协议下使用。查阅 LICENSE 文件来获得更多信息。




