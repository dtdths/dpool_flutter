import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dpool_flutter/config/coinType.dart';
import 'package:dpool_flutter/api/api.dart';

class IndexTable extends StatelessWidget {
  final Widget child;

  IndexTable({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _border = BorderSide(color: Color(0xFFEAEAEA));
    final w100 = ScreenUtil.getInstance().setWidth(100);
    final w80 = ScreenUtil.getInstance().setWidth(80);
    final w24 = ScreenUtil.getInstance().setWidth(24);
    final w10 = ScreenUtil.getInstance().setWidth(10);
    final f24 = ScreenUtil().setSp(24);
    List<TableRow> _createTr() {
      List<TableRow> trList = [];
      //创建表头
      Widget _th(name) {
        return Container(
          height: w80,
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: f24),
            ),
          ),
        );
      }

      //创建币种列表
      TableRow _tr(f) {
        var coinType = f['coinType'];
        return TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            children: <Widget>[
              //图标
              Container(
                height: w100,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: w10),
                        child: Image.asset(
                          f['icon'],
                          height: w24,
                          width: w24,
                        ),
                      ),
                      Text(coinType)
                    ],
                  ),
                ),
              ),
              //算力
              Container(
                height: w100,
                child: Center(
                  child: FutureBuilder(
                    future: httpCoinstats(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text('加载中');
                      } else {
                        print(snapshot.data["data"]);
                        return Text('1111');
                      }
                    }
                  ),
                ),
              ),
              Container(
                height: w100,
                child: Center(
                  child: Text(coinType),
                ),
              ),
              Container(
                height: w100,
                child: Center(
                  child: Text(coinType),
                ),
              )
            ]);
      }

      trList.add(TableRow(
          decoration: BoxDecoration(
            color: Color(0xff247ba0),
          ),
          children: <Widget>[
            _th('币种'),
            _th('矿池算力'),
            _th('挖矿日收益'),
            _th('挖矿教程'),
          ]));
      coinTypeList.forEach((f) {
        trList.add(_tr(f));
      });
      return trList;
    }

    return Table(
      border: TableBorder(
        top: _border,
        left: _border,
        right: _border,
        bottom: _border,
        horizontalInside: _border,
      ),
      children: _createTr(),
    );
  }
}
