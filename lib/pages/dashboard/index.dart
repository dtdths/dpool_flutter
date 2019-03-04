import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '用户面板',
          style: TextStyle(
            color: Color(0xffffffff),
          ),
          // textAlign:TextAlign.center
        ),
      ),
      body: Center(
        child: Text('dashboard'),
      ),
    );
  }
}
