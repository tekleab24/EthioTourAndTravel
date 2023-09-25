import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tourandtravel/controllers/citycontroller.dart';
import 'package:tourandtravel/utils/constants.dart';
import 'package:tourandtravel/widgets/hotelcard.dart';

import 'homepage.dart';

class CityDetail extends StatefulWidget {
  CityDetail({super.key});

  @override
  State<CityDetail> createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  var cityData = Get.arguments;
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CityController>(
        init: CityController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () => Get.offNamed("/homepage"),
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                  )),
              title: Text(
                cityData['name'].toString(),
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                Container(
                    height: 40,
                    width: 140,
                    margin:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintStyle: const TextStyle(fontSize: 11),
                            hintText: "Search for hotel",
                            fillColor: Constants.Onbording_bacground_color,
                            contentPadding: EdgeInsets.all(15),
                            prefixIcon: const Icon(Icons.search),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.Onbording_bacground_color),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.Onbording_bacground_color),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.Onbording_bacground_color),
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Constants.Onbording_bacground_color),
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    )),
              ],
            ),
            body: Stack(children: [
              Container(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(cityData["lat"]),
                          double.parse(cityData["long"])),
                      zoom: 15),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    height: Get.height / 1.6,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Center(
                        child: Column(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(
                          "Packages in ${cityData['name']}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: Get.width,
                  height: Get.height / 1.8,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: hotels_card(),
                ),
              )
            ]),
          );
        });
  }
}
