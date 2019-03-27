import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _w80 = ScreenUtil.getInstance().setWidth(80) as double;
final _f24 = ScreenUtil().setSp(24) as double;

class IndexQA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xFFEAEAEA))),
      child: Column(
        children: <Widget>[
          //头部
          Container(
            decoration: BoxDecoration(color: Color(0xff247ba0)),
            height: _w80,
            child: Center(
              child: Text('--- 常见问题 ---',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _f24,
                  )),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[Text('如何接入龙池挖矿？')],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text('详见'),
                                  Text('账户设置'),
                                  Text('和'),
                                  Text('挖矿配置'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[Text('关于支付？')],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Expanded(
                                        child: (Text(
                                            '龙池以UTC 00:00-24:00为一个账单周期做收益结算，一个账单周期对应北京时间为前一天上午8:00-当日上午8:00。')))
                                  ]),
                                  Row(children: <Widget>[
                                    Expanded(
                                        child: (Text(
                                            '在UTC 时间00:00生成前一天的账单，在北京时间10:00后开始发放前一天收益。如遇到网络拥堵等特殊情况会有所延迟，一般会在当日发出。')))
                                  ]),
                                  Row(children: <Widget>[
                                    Expanded(
                                        child: (Text(
                                            '起付额：BTC：0.001，BCH：0.001，BSV：0.001，LTC:0.001，ETH：0.05，DCR：0.05，ZEC：0.1,ETP：1')))
                                  ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[Text('收益不断变化的原因')],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                          '每个币种的挖矿难度会定时调整，随着挖矿难度的增加，您的挖矿收益将趋于减少。此外，龙池中个别矿工，可能偶尔会遇到停电或者根据丰水期、枯水期迁移矿场的情况，此时龙池的算力在短时间内会有所下降，不会影响其他矿工的正常挖矿。'))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
