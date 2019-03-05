# dpool_flutter

## 1.关于 BottomNavigationBar 颜色设置

文档中说明,根据当前 type 不同而有两种形式
* >当 type = BottomNavigationBarType.shifting 时
  
  BottomNavigationBar 的背景色为当前激活的 BottomNavigationBarItem.backgroundColor 

* >当 BottomNavigationBarType.fixed 时
  
  BottomNavigationBar 的背景色为 ThemeData.canvasColor

BottomNavigationBarItem.icon 和 BottomNavigationBarItem.title 可以用 currentIndex 做动态改变，或直接用 BottomNavigationBar.fixedColor 当作激活时的颜色

## 2. BottomNavigationBar 和 PageView 切换页面

BottomNavigationBar 的 onTap 切换当前 currentIndex。

PageView 的 children 是一个组件数组，通过 controler 跳转到 currentIndex 就会切换到对应的页面。


## 3.flutter-provide
状态管理工具

1.引入包

在 pubspec.yaml 文件中添加 provide
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.2
  provide: ^1.0.2
```
2.创建一个数据 model
```dart
import 'package:flutter/material.dart'; //引入包

//创建 CurrentPageIndex
class CurrentPageIndex with ChangeNotifier{
  int _index;

  int get value => _index; //外部通 value 取得内部 _index

  CurrentPageIndex(this._index); //有点像js的构造函数，需要默认值

  changeIndex(i){ //改变_index的方法
    _index = i;
    notifyListeners();
  }
}
```
3.在一个较高的层级引入

```dart
// 先引入 provide 包和定义的 model 包
void main(){
  var currentPageIndex = CurrentPageIndex(0); //默认0

  var providers = Providers();

  providers
    ..provide(Provider<CurrentPageIndex>.value(currentPageIndex));

  runApp(ProviderNode(child: Dpool(), providers: providers));

}
```
4.获取值和改变值

```dart
final currentPageModel = Provide.value<CurrentPageIndex>(context); //通过 value<type> 获取到
currentPageModel.value //get
currentPageModel.changeIndex(index); //set
```
