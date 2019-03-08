import 'package:dio/dio.dart';
import 'package:dpool_flutter/api/http.dart';

Future banner(params)async {
  try{
    Response response;
    response = await dio.get("/v3/pools/banner",queryParameters:params);
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