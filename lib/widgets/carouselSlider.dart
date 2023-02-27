import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/utils/constants.dart';

import '../controllers/citycontroller.dart';

class carousel_slider extends StatelessWidget {
  carousel_slider({
    Key? key,
  }) : super(key: key);

  final CityController cityController = Get.put(CityController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CityController>(
        init: Get.find<CityController>(),
        initState: (_) {},
        builder: (controller) {
          if (controller.is_loaading.value) {
            return Center(child: const CircularProgressIndicator());
          } else {
            return SizedBox(
              height: 150,
              // width: Get.width,
              child: CarouselSlider.builder(
                itemCount: controller.cities.value.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () => Get.toNamed("/_detail_screen"),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: Get.width,
                      imageUrl: controller.cities.value[itemIndex].image,
                      placeholder: (context, url) => const Center(
                        child: FaIcon(
                          FontAwesomeIcons.image,
                          color: Constants.PRIM_COLOR,
                        ),
                      ),
                    ),
                  ),
                ),

                //

                options: CarouselOptions(
                  clipBehavior: Clip.none,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            );
          }
        });
  }
}
