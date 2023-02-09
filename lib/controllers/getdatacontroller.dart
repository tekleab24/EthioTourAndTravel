import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';

import '../model/user.dart';

class HotelController extends GetxController {
  Rx<List<Photos>> photos = Rx<List<Photos>>([]);
  var is_loaading = false.obs;

  @override
  void onInit() {
    fetchHotels();
    super.onInit();
  }

  void fetchHotels() async {
    is_loaading.value = true;
    var res = await RemoteServices.fetchHotels();
    photos.value = photosFromJson(res!.body);
  }
}
