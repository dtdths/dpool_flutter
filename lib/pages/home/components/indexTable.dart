import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:dpool_flutter/config/coinType.dart';

class IndexTable extends StatelessWidget {
  final Widget child;

  IndexTable({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _border = BorderSide(color: Color(0xFFEAEAEA));
    Widget _th(name) {
      return Container(
        height: ScreenUtil.getInstance().setWidth(80),
        decoration: BoxDecoration(color: Color(0xff247ba0)),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: ScreenUtil().setSp(24)),
          ),
        ),
      );
    }

    TableRow _tr(coinType) {
      return TableRow(children: <Widget>[
        Container(
          color: Colors.white,
          height: ScreenUtil.getInstance().setWidth(100),
          child: Center(
            child: Text(coinType),
          ),
        ),
        Container(
          color: Colors.white,
          height: ScreenUtil.getInstance().setWidth(100),
          child: Center(
            child: Text(coinType),
          ),
        ),
        Container(
          color: Colors.white,
          height: ScreenUtil.getInstance().setWidth(100),
          child: Center(
            child: Text(coinType),
          ),
        ),
        Container(
          color: Colors.white,
          height: ScreenUtil.getInstance().setWidth(100),
          child: Center(
            child: Text(coinType),
          ),
        )
      ]);
    }

    return Table(
      border: TableBorder(
        top: _border,
        left: _border,
        right: _border,
        bottom: _border,
        horizontalInside: _border,
      ),
      children: <TableRow>[
        // 表头
        TableRow(children: <Widget>[
          _th('币种'),
          _th('矿池算力'),
          _th('挖矿日收益'),
          _th('挖矿教程'),
        ]),
      ],
    );
  }
}
