# dpool_flutter
从0开始构建 flutter 应用，业余时间边学边写。

## 1. 关于 BottomNavigationBar 颜色设置

文档中说明,根据当前 type 不同而有两种形式
 1. 当 type = BottomNavigationBarType.shifting 时
  
  BottomNavigationBar 的背景色为当前激活的 BottomNavigationBarItem.backgroundColor 

 2. 当 BottomNavigationBarType.fixed 时
  
  BottomNavigationBar 的背景色为 ThemeData.canvasColor

BottomNavigationBarItem.icon 和 BottomNavigationBarItem.title 可以用 currentIndex 做动态改变，或直接用 BottomNavigationBar.fixedColor 当作激活时的颜色

## 2. IconFont 字体引用

1. 下载 ttf 字体，放入 assets/fonts 下，在 pubspec.yaml 中引入
```yaml
fonts:
  - family: IconFont
    fonts:
      - asset: assets/fonts/iconfont.ttf
        style: italic
```
2. 通过 IconData 使用
```dart
// &#xe65b; => 0xe65b  把 &x 换成 0
Icon(IconData(0xe65b,fontFamily:'IconFont')
```
## 3. BottomNavigationBar 和 PageView 切换页面

BottomNavigationBar 的 onTap 切换当前 currentIndex。

PageView 的 children 是一个组件数组，通过 controler 跳转到 currentIndex 就会切换到对应的页面。


## 4. flutter-provide
状态管理工具

1. 引入包

在 pubspec.yaml 文件中添加 provide
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.2
  provide: ^1.0.2
```
2. 创建一个数据 model
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
3. 在一个较高的层级引入

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
4. 获取值和改变值

```dart
final currentPageModel = Provide.value<CurrentPageIndex>(context); //通过 value<type> 获取到
currentPageModel.value //get
currentPageModel.changeIndex(index); //set
```

## 5. 网络请求 dio
[dio](https://github.com/flutterchina/dio/blob/master/README-ZH.md)

使用单例模式，通过 BaseOptions 完成基本配置，使用 interceptors.add 增加拦截器，拦截器需要在 main 里运行

使用 async/await 返回一个 Future，可以使用 .then 进行后续处理

## 6. 轮播图
使用 [flutter_swiper](https://github.com/best-flutter/flutter_swiper) 根据接口图片 url 创建轮播图

使用 FutureBuilder ，在请求完成后进行渲染，FutureBuilder.future 接收 dio 实例返回的 future，，在请求完成后进行渲染，FutureBuilder.builder: (context,snapshot) 中的 snapshot 接收请求状态和请求结果。

## 7. 屏幕适配
使用 [flutter_screenutil](https://github.com/OpenFlutter/flutter_screenutil) 

使用时首先在主页面进行初始化
```dart
build(
  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
        ..init(context); 
  //...
)
```
调用
```dart
build(
  ScreenUtil.getInstance().setWidth(_height)
  ScreenUtil().setSp(_fontSize) //字体大小，默认不随系统设置变
  //...
)
```

## 8. 轮播图点击打开网页
flutter没有webview,暂时使用
[url_launcher](https://github.com/flutter/plugins/tree/master/packages/url_launcher) 直接调用浏览器打开链接

## 9. Stack 层叠定位
在 home/index.dart 组合 banner 和 noticeList，使用  Positioned 与 Expanded 会报错，暂时不知道怎么解决，使用 Stack.alignment 属性完成效果
```dart
Stack( //层叠定位
  alignment: AlignmentDirectional.bottomStart,
  children: <Widget>[
    IndexBanner(),
    IndexNotices()
  ],
),
```

## 10.
1. 滚动 ListView
纵向超出屏幕后时不会滚动的，会出现警告。使用ListView使视图滚动。
2. Row 使用 mainAxisAlignment: MainAxisAlignment.center 居中


<!-- items
        .map((question) =>
            Question(question["owner"]["display_name"], question["title"]))
        .toList(); -->

## 11. setState 时会触发 build。如果把请求写在build里，请求成功会触发setState，改变build后会重复请求，无限循环了。