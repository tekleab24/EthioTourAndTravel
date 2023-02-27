import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/controllers/homepagecontroller.dart';
import 'package:tourandtravel/screens/home%20and%20others/chooserooms.dart';
import 'package:tourandtravel/screens/home%20and%20others/popularhotel.dart';
import 'package:tourandtravel/screens/home%20and%20others/trips.dart';
import 'package:tourandtravel/screens/home%20and%20others/profile.dart';
import 'package:tourandtravel/utils/constants.dart';
import 'package:tourandtravel/widgets/homescreen.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  PageController homepageview_controller = PageController(
      initialPage: Get.find<HomepageController>().intial_page.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFfcf5ef),
        body: GetBuilder<HomepageController>(
          init: Get.find<HomepageController>(),
          initState: (_) {},
          builder: (controller) {
            return PageView(
              controller: homepageview_controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Homescreen(),
                const PopularHotel(),
                const Trips(),
                Profile(),
                // Center(
                //   child: Text("Booking"),
                // ),
                const Center(
                  child: Text("User profile information"),
                ),
              ],
              onPageChanged: (value) {
                controller.intial_page.value = value;
              },
            );
          },
        ),
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar(
            height: 60,
            backgroundColor: Color.fromARGB(255, 231, 229, 224),
            activeColor: Constants.PRIM_COLOR,
            inactiveColor: Colors.grey,
            gapWidth: 10,
            notchSmoothness: NotchSmoothness.defaultEdge,
            elevation: 10,
            iconSize: 30,
            icons: const [
              Icons.home,
              Icons.favorite,
              Icons.airplanemode_active,
              // Icons.bedroom_child,
              Icons.person
            ],

            activeIndex: Get.find<HomepageController>().intial_page.value,

            onTap: (index) {
              Get.find<HomepageController>().intial_page.value = index;
              homepageview_controller.jumpToPage(index);
            },
            //other params
          ),
        )

        //other params

        );
  }
}
