import 'package:flutter/material.dart';
import 'package:dpool_flutter/pages/home/components/indexBanner.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '首页',
          style: TextStyle(
            color: Color(0xffffffff),
          ),
          // textAlign:TextAlign.center
        ),
      ),
      body: Column(
        children: <Widget>[
          IndexBanner(),
          Text('Craft beautiful UIs'),
        ],
      ),
    );
  }
}
