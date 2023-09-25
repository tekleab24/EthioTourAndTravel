import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:tourandtravel/model/getdata.dart';

import '../model/reservemodel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<http.Response?> fetchHotels() async {
    var response =
        await client.get(Uri.parse("http://192.168.8.197:8000/tour/hotel/"));

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future<http.Response?> fetchCities() async {
    var response =
        await client.get(Uri.parse("http://192.168.8.197:8000/tour/city/"));

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future<http.Response?> fetchToursites() async {
    var response =
        await client.get(Uri.parse("http://192.168.8.197:8000/tour/toursite/"));
    // print(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future<http.Response?> fetchPackages() async {
    var response =
        await client.get(Uri.parse("http://192.168.8.197:8000/tour/package/"));
    // print(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future<http.Response?> postReserve(Reserevepacakge reserve) async {
    var data = reserve.toJson();
    var response = await client.post(
        Uri.parse("http://192.168.8.197:8000/tour/reservedpackage/"),
        body: data);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}
