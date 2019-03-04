# dpool_flutter

## 1.关于 BottomNavigationBar 颜色设置

文档中说明,根据当前 type 不同而有两种形式
* >当 type = BottomNavigationBarType.shifting 时
  
  BottomNavigationBar 的背景色为当前激活的 BottomNavigationBarItem.backgroundColor 

* >当 BottomNavigationBarType.fixed 时
  
  BottomNavigationBar 的背景色为 ThemeData.canvasColor

BottomNavigationBarItem.icon 和 BottomNavigationBarItem.title 可以用 currentIndex 做动态改变，或直接用 BottomNavigationBar.fixedColor 当作激活时的颜色

## 2.flutter-provide
