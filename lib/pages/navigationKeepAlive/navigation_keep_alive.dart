import 'package:flutter/material.dart';
import '../../components/footer.dart';
import '../home/index.dart';
import '../dashboard/index.dart';
import '../setting/index.dart';

class NavigationKeepAlive extends StatefulWidget {
  final Widget child;

  NavigationKeepAlive({Key key, this.child}) : super(key: key);

  _NavigationKeepAliveState createState() => _NavigationKeepAliveState();
}

class _NavigationKeepAliveState extends State<NavigationKeepAlive> {
  var _controller = PageController(
    initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: _controller,
        children: <Widget>[
          Home(),
          Dashboard(),
          Setting(),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }

  
}