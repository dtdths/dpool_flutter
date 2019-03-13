import 'package:flutter/material.dart';
import 'package:dpool_flutter/api/api.dart';
import 'package:dpool_flutter/utils/launchUrl.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _noWidget = () => Container(
      width: 0,
      height: 0,
    );
final _height = 50; //notcie高度
final _fontSize = 18; //字号

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
                height: ScreenUtil.getInstance().setWidth(_height),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil.getInstance().setWidth(40),
                    0,
                    ScreenUtil.getInstance().setWidth(16),
                    0),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          right: ScreenUtil.getInstance().setWidth(10)),
                      child: Icon(
                        IconData(0xe679, fontFamily: 'IconFont'),
                        size: ScreenUtil().setSp(_fontSize),
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
                                  fontSize: ScreenUtil().setSp(_fontSize)),
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
