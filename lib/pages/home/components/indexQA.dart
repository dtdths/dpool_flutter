import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexQA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w80 = ScreenUtil.getInstance().setWidth(80);
    final f24 = ScreenUtil().setSp(24);

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xFFEAEAEA))),
      child: Column(
        children: <Widget>[
          //头部
          Container(
            decoration: BoxDecoration(color: Color(0xff247ba0)),
            height: w80,
            child: Center(
              child: Text('--- 常见问题 ---',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: f24,
                  )),
            ),
          ),
          Container(
            child: Column(
              
            ),
          )
        ],
      ),
    );
  }
}
