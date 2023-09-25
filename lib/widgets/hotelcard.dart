import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/controllers/citycontroller.dart';
import 'package:tourandtravel/utils/constants.dart';

import '../controllers/hotelcontroller.dart';
import '../controllers/packagecontroller.dart';

class hotels_card extends StatelessWidget {
  final packageController = Get.put(PackageController());
  final hotelController = Get.put(HotelController());
  var packageId;
  var hotelId;
  var cityName;
  // var hotelId = HotelController().hotels.value[].id;
  hotels_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PackageController>(
        init: Get.find<PackageController>(),
        initState: (_) {},
        builder: (packageController) {
          return SizedBox(
            height: 320,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                packageController.packages.value.length,
                (index) => Container(
                  width: Get.width / 1.5,
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: GetBuilder<HotelController>(
                                  init: Get.find<HotelController>(),
                                  initState: (_) {},
                                  builder: (controllers) {
                                    packageId = packageController
                                        .packages.value[index].id;
                                    return CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: Get.width,
                                      imageUrl: controllers
                                          .hotels.value[packageId].image,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.image,
                                          color: Constants.PRIM_COLOR,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 12,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20)),
                                  color: Colors.black.withOpacity(0.5)),
                              child: Text(
                                packageController.packages.value[index].cost +
                                    " birr/night",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 7,
                            right: 12,
                            child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.white,
                                  size: 18,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: GetBuilder<HotelController>(
                            init: Get.find<HotelController>(),
                            initState: (_) {},
                            builder: (hotelController) {
                              hotelId = hotelController.hotels.value[index].id;

                              return Text(
                                hotelController.hotels.value[packageId].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.locationPin,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GetBuilder<CityController>(
                                    init: Get.find<CityController>(),
                                    initState: (_) {},
                                    builder: (cityController) {
                                      cityName = cityController
                                          .cities.value[hotelId].name;
                                      return Text(
                                        cityName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              elevation: 0,
                              onPressed: () {
                                Get.toNamed("/hoteldetail", arguments: {
                                  "name": hotelController
                                      .hotels.value[packageId].name,
                                  "cost": packageController
                                      .packages.value[index].cost,
                                  "image": hotelController
                                      .hotels.value[packageId].image,
                                  "city": cityName,
                                });
                              },
                              backgroundColor: Constants.PRIM_COLOR,
                              child: const FaIcon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
