import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dpool_flutter/config/coinType.dart';
import 'package:dpool_flutter/api/api.dart';

final _border = BorderSide(color: Color(0xFFEAEAEA));
final w100 = ScreenUtil.getInstance().setWidth(100) as double;
final w80 = ScreenUtil.getInstance().setWidth(80) as double;
final w24 = ScreenUtil.getInstance().setWidth(24) as double;
final w10 = ScreenUtil.getInstance().setWidth(10) as double;
final f24 = ScreenUtil().setSp(24) as double;

class IndexTable extends StatelessWidget {
  final Widget child;

  IndexTable({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Color(0xFFEAEAEA))),
      child: Column(
        children: _table(),
      ),
      // border: TableBorder(
      //   top: _border,
      //   left: _border,
      //   right: _border,
      //   bottom: _border,
      //   horizontalInside: _border,
      // ),
      // children: _createTr(),
    );
  }
}

_table() {
  List<Widget> trList = [];
  Widget _th(name) {
    return Expanded(
      flex: 1,
      child: Container(
        height: w80,
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: f24),
          ),
        ),
      ),
    );
  }

  _tr(f) {
    var coinType = f['coinType'];
    bool isBtc = coinType == 'btc';
    String baseUnit = f['baseUnit'];
    return FutureBuilder(
      // future: httpCoinstats(),
      future:
          isBtc ? httpPoolStats() : httpInPoolStats({'coin_type': coinType}),
      builder: (context, snapshot) {
        var poolHashrate;
        if (snapshot.hasData) {
          var data = snapshot.data["data"];
          var shares = isBtc
              ? '${data['hash_rate']}'
              : '${data['shares'] == 0 ? '0.00' : data['shares']}';
          var sharesUnit = isBtc
              ? '${data['shares']['shares_unit']}'
              : '${data['shares_unit']}';
          // 矿池算力
          poolHashrate = '$shares $sharesUnit$baseUnit/s';
        }
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(children: <Widget>[
              //图标
              Expanded(
                flex: 1,
                child: Container(
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
              ),
              //算力
              Expanded(
                flex: 1,
                child: Container(
                  height: w100,
                  child: Center(
                    child: Text(
                      snapshot.hasData ? poolHashrate : '加载中',
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              //日收益
              Expanded(
                flex: 1,
                child: Container(
                  height: w100,
                  child: Center(
                    child: Text('1'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: w100,
                  child: Center(
                    child: Icon(IconData(0xe665, fontFamily: 'IconFont'),size: 18,color: Color(0xff1e6887),),
                  ),
                ),
              ),
            ]));
      },
    );
  }

  trList.add(Container(
    decoration: BoxDecoration(
      color: Color(0xff247ba0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _th('币种'),
        _th('矿池算力'),
        _th('挖矿日收益'),
        _th('挖矿教程'),
      ],
    ),
  ));
  coinTypeList.forEach((f) {
    trList.add(_tr(f));
  });
  return trList;
}
