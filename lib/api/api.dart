import 'package:dio/dio.dart';
import 'package:dpool_flutter/api/http.dart';

Future httpBanner(params)async {
  try{
    Response response;
    response = await dio.get("/v3/pools/banner",queryParameters:params);
    return response.data;
  }catch(e){
    return print('ERROR:======>$e');
  }
}

Future httpGetNoticeList(params)async {
  try{
    Response response;
    response = await dio.post("/v3/get-notice-list",queryParameters:params);
    return response.data;
  }catch(e){
    return print('ERROR:======>$e');
  }
}

Future httpCoinstats()async {
  try{
    Response response;
    response = await dio.get("/v3/pools/coinstats");
    return response.data;
  }catch(e){
    return print('ERROR:======>$e');
  }
}


// Future getHttp(params)async{
//     try{
//       Response response;
//       response = await dio.post(
//         "地址隐藏了,地址会单独发送给正版视频者",
//           queryParameters:params
//       );
//       return response.data;
//     }catch(e){
//       return print(e);
//     }
//   }