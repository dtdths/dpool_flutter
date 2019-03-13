import 'package:flutter/material.dart';
import 'package:dpool_flutter/api/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dpool_flutter/utils/launchUrl.dart';

final _height = 400; //banner高度

class IndexBanner extends StatefulWidget {
  _IndexBannerState createState() => _IndexBannerState();
}

class _IndexBannerState extends State<IndexBanner> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder( //异步加载组件
        future:httpBanner({"type":"wap","language_type":"cn"}), //请求
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<dynamic> swiperDataList = snapshot.data["data"];
             return Column(
               children: <Widget>[
                Container(
                  height: ScreenUtil.getInstance().setWidth(_height), //自适应
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                      return Image.network("${swiperDataList[index]['img_url']}",fit:BoxFit.fill);
                    },
                    onTap:(int index){
                      launchURL(swiperDataList[index]['pre_url']);//打开浏览器
                    },
                    itemCount: swiperDataList.length,
                    pagination: SwiperPagination(),
                    autoplay: true,
                  ),
                ),   //页面顶部轮播组件
              ],
             );
          }else{
            return Container(
              height: ScreenUtil.getInstance().setWidth(_height),
              child: Center(
                child: Text('加载中'),
              ),
            );
          }
        }
      );
  }
}
