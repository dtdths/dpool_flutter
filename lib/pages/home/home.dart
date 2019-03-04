import 'package:flutter/material.dart';
import '../../components/footer.dart';

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
      body: null,
      bottomNavigationBar: Footer()
    );
  }
}
