import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';

//import '../model/user.dart';

class HotelController extends GetxController {
  Rx<List<Photos>> photos = Rx<List<Photos>>([]);
  var is_loaading = true.obs;

  @override
  void onInit() {
    fetchHotels();
    super.onInit();
  }

  void fetchHotels() async {
    is_loaading(true);
    try {
      is_loaading(true);
      var res = await RemoteServices.fetchHotels();
      if (res != null) {
        photos.value = photosFromJson(res.body);
        print("froo api " + res.body); //this is to check the response data
      }
    } finally {
      is_loaading(false);
    }
  }
}
