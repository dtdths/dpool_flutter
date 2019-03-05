import 'package:flutter/material.dart';

class CurrentPageIndex with ChangeNotifier{
  int _index;

  int get value => _index;

  CurrentPageIndex(this._index);

  changeIndex(i){
    _index = i;
    notifyListeners();
  }
}