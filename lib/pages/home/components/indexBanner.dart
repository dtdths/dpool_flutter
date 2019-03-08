import 'package:flutter/material.dart';
import 'package:dpool_flutter/api/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class IndexBanner extends StatefulWidget {
  _IndexBannerState createState() => _IndexBannerState();
}

class _IndexBannerState extends State<IndexBanner> {
  // List<dynamic> bannerList = [];
  // void initState() {
  //   super.initState();
  //   banner({"type":"wap","language_type":"cn"}).then((data){
  //     bannerList = data["data"];
  //     print(bannerList is List<dynamic>);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:banner({"type":"wap","language_type":"cn"}),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<dynamic> swiperDataList = snapshot.data["data"];
             return Column(
               children: <Widget>[
                Container(
                  height: 333.0,
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                      return Image.network("${swiperDataList[index]['img_url']}",fit:BoxFit.fill);
                    },
                    onTap:(int index){
                      print("${swiperDataList[index]['pre_url']}");
                    },
                    itemCount: swiperDataList.length,
                    pagination: new SwiperPagination(),
                    autoplay: true,
                  ),
                ),   //页面顶部轮播组件
              ],
             );
          }else{
            return Container(
              height: 333.0,
              child: Center(
                child: Text('加载中'),
              ),
            );
          }
        }
      );
    
    
    
    
    //  new Swiper(
    //   itemBuilder: (BuildContext context,int index){
    //     return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
    //   },
    //   itemCount: 3,
    //   pagination: new SwiperPagination(),
    //   control: new SwiperControl(),
    // );
  }
}
