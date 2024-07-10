import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpservice/httpservice.dart';

class HomeProvider extends ChangeNotifier {
  List productsList = [];

  Future getApiData(String apix) async {
    HttpService httpService = HttpService("$apix");
    var data = await httpService.getContents();

    productsList = jsonDecode(data);
    notifyListeners();
    print("productsList");
    print(productsList);
  }
}
