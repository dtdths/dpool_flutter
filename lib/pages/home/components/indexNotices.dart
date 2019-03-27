import 'package:flutter/material.dart';
import 'package:dpool_flutter/api/api.dart';
import 'package:dpool_flutter/utils/launchUrl.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _noWidget = () => Container(
      width: 0,
      height: 0,
    );

final _w50 = ScreenUtil.getInstance().setWidth(50) as double;
final _w40 = ScreenUtil.getInstance().setWidth(40) as double;
final _w16 = ScreenUtil.getInstance().setWidth(16) as double;
final _w10 = ScreenUtil.getInstance().setWidth(10) as double;
final _f18 = ScreenUtil().setSp(18) as double;

class IndexNotices extends StatefulWidget {
  _IndexNoticesState createState() => _IndexNoticesState();
}

class _IndexNoticesState extends State<IndexNotices> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpGetNoticeList({"language_type": "cn"}),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _noWidget();
        } else {
          List<dynamic> noticesList = snapshot.data["data"];
          if (noticesList.length == 0) {
            return _noWidget();
          } else {
            return Container(
                //notice 行
                color: Color.fromRGBO(7, 25, 33, .5),
                height: _w50,
                padding: EdgeInsets.fromLTRB(_w40, 0, _w16, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: _w10),
                      child: Icon(
                        IconData(0xe679, fontFamily: 'IconFont'),
                        size: _f18,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Text(noticesList[index]["title"],
                              style: TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  fontSize: _f18),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis);
                        },
                        onTap: (int index) {
                          launchURL(noticesList[index]["url"]); //打开浏览器
                        },
                        scrollDirection: Axis.vertical, //垂直滚动
                        itemCount: noticesList.length,
                        autoplay: true,
                      ),
                    )
                  ],
                ));
          }
        }
      },
    );
  }
}
