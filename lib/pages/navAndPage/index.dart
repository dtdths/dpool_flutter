import 'package:flutter/material.dart';
import 'package:dpool_flutter/pages/home/index.dart';
import 'package:dpool_flutter/pages/dashboard/index.dart';
import 'package:dpool_flutter/pages/setting/index.dart';
// import 'package:dpool_flutter/store/currentPageIndex.dart';
// import 'package:provide/provide.dart';
// import 'package:flutter/foundation.dart';

class NavAndPage extends StatefulWidget {
  // final Widget child;

  // NavAndPage({Key key, this.child}) : super(key: key);

  _NavAndPageState createState() => _NavAndPageState();
}

class _NavAndPageState extends State<NavAndPage> {
  var _controller = PageController(initialPage: 0);
  var _currentIndex = 0; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Home(),
          Dashboard(),
          Setting(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Color(0xff247ba0), // 背景颜色
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          fixedColor: Colors.white,
          // type: BottomNavigationBarType.shifting,
          items: [
            _createItem(0xe608,'首页'),
            _createItem(0xe699, '用户面板'),
            _createItem(0xe65b, '设置'),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if(_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
      _controller.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
      //Provide.value<CurrentPageIndex>(context).value
      //Provide.value<CurrentPageIndex>(context).changeIndex(index); // navIndex状态管理
    });
  }
}

BottomNavigationBarItem _createItem(icon, title) {
  return BottomNavigationBarItem(
    icon: Icon(IconData(icon,fontFamily:'IconFont')),
    title: Text(title),
  );
}
