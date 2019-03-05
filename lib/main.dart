import 'package:flutter/material.dart';
// import 'package:provide/provide.dart';
import 'pages/navAndPage/index.dart';
// import 'store/currentPageIndex.dart';

// void main(){
//   var currentPageIndex = CurrentPageIndex(2);

//   var providers = Providers();

//   providers
//     ..provide(Provider<CurrentPageIndex>.value(currentPageIndex));

//   runApp(ProviderNode(child: Dpool(), providers: providers));

// }
void main() => runApp(Dpool());

class Dpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dpool',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff9f9f9), //背景色
      ),
      home: NavAndPage(),
    );
  }
}
