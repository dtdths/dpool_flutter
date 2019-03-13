import 'package:flutter/material.dart';
import 'package:dpool_flutter/pages/home/components/indexBanner.dart';
import 'package:dpool_flutter/pages/home/components/indexNotices.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        title: Text(
          '首页',
          style: TextStyle(
            color: Color(0xff76c1b3),
          ),
          // textAlign:TextAlign.center
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack( //层叠定位
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              IndexBanner(),
              IndexNotices()
            ],
          ),
          Text('Craft beautiful UIs'),
        ],
      ),
    );
  }
}
