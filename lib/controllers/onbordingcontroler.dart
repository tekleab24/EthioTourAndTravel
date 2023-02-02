import 'package:get/get.dart';
import 'package:tourandtravel/model/onbordmodel.dart';

class OnbordingController extends GetxController {
  var intialpage = 0.obs;

  List<OnbordModel> onbordlist = [
    OnbordModel(
        "Best Apartment and Hotel Booking",
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
        "assets/onboarding1.jpg"),
    OnbordModel(
        "Best Apartment and Hotel Booking",
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
        "assets/onboarding2.jpg"),
    OnbordModel(
        "Enjoy Your Holiday Time",
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour",
        "assets/onboarding3.jpg"),
  ];

  void updatepage(int value) {
    intialpage.value = value;
  }
}
