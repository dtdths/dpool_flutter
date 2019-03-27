import 'package:flutter/material.dart';
import 'package:dpool_flutter/pages/home/components/indexBanner.dart';
import 'package:dpool_flutter/pages/home/components/indexNotices.dart';
import 'package:dpool_flutter/pages/home/components/indexTable.dart';
import 'package:dpool_flutter/pages/home/components/indexQA.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _w30= ScreenUtil.getInstance().setWidth(30) as double;
final _w20 = ScreenUtil.getInstance().setWidth(20) as double;

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
        body: ListView(
          children: <Widget>[
            Stack(
              //层叠定位
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                //轮播
                IndexBanner(),
                //新闻
                IndexNotices()
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  _w30, _w20, _w30, _w20),
              // 币种列表
              child: IndexTable(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  _w30, 0, _w30, _w20),
              // 币种列表
              child: IndexQA(),
            )
          ],
        ));
  }
}
