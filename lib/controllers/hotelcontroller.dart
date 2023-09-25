import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';
import '../model/hotelmodel.dart';
import '../model/toursitemodel.dart';

class HotelController extends GetxController {
  Rx<List<Hotel>> hotels = Rx<List<Hotel>>([]);
  var is_loaading = true.obs;

  @override
  void onInit() {
    fetchHotel();
    super.onInit();
  }

  void fetchHotel() async {
    try {
      is_loaading(true);
      var res = await RemoteServices.fetchHotels();
      if (res != null) {
        is_loaading(false);
        hotels.value = hotelFromJson(res.body);
        update();
      }
    } finally {
      is_loaading(false);
    }
  }
}
