import 'package:flutter/material.dart';

// Color unActiveColor = Color(0xff7ab3cc);

class Footer extends StatefulWidget {
  final Widget child;

  Footer({Key key, this.child}) : super(key: key);

  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Color(0xff247ba0), // 背景颜色
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.white,
        // type: BottomNavigationBarType.shifting,
        items: [
          _createItem(Icons.home, '首页'),
          _createItem(Icons.dashboard, '用户面板'),
          _createItem(Icons.settings, '设置'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _createItem(icon, title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(title),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
