import 'dart:convert';

import 'package:tourandtravel/model/getdata.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tourandtravel/services/remote_services.dart';
import '../model/packagemodel.dart';
import '../model/reservemodel.dart';

class PackageController extends GetxController {
  Rx<List<Package>> packages = Rx<List<Package>>([]);
  var is_loaading = false.obs;
  var is_post_res = false.obs;
  var is_successful = false.obs;
  get hotels => null;
  @override
  void onInit() {
    fetchPackage();
    super.onInit();
  }

  void fetchPackage() async {
    try {
      is_loaading.value = true;
      var res = await RemoteServices.fetchPackages();
      if (res != null) {
        is_loaading.value = false;
        packages.value = packageFromJson(res.body);
        update();
        // print("from " + res.body);
      }
    } finally {
      is_loaading(false);
    }
  }

  void postPackage(Reserevepacakge reserevepacakge) async {
    is_post_res.value = true;
    var res = await RemoteServices.postReserve(reserevepacakge);
    if (res!.statusCode == 200) {
      is_post_res.value = false;
      is_successful.value = true;
    }
  }
}
