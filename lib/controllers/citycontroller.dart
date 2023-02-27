import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';

import '../model/citymodel.dart';

class CityController extends GetxController {
  Rx<List<City>> cities = Rx<List<City>>([]);
  var is_loaading = true.obs;

  @override
  void onInit() {
    fetchCity();
    super.onInit();
  }

  void fetchCity() async {
    is_loaading(true);
    try {
      is_loaading(true);
      var res = await RemoteServices.fetchCities();
      if (res != null) {
        cities.value = cityFromJson(res.body);
        // print("from " + res.body);
        print("this should be printed");
      }
    } finally {
      is_loaading(false);
    }
  }
}
