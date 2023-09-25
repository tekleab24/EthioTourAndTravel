import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/controllers/packagecontroller.dart';
import 'package:tourandtravel/utils/constants.dart';

import '../../model/reservemodel.dart';

class Booking extends StatelessWidget {
  Booking({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController tourist = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController checkIn = TextEditingController();
  TextEditingController checkOut = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Booking",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            )),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 3,
            left: 0,
            right: 0,
            child: Container(
              width: Get.width,
              height: 120,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 110,
                      width: 150,
                      imageUrl:
                          "https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                      placeholder: (context, url) => const Center(
                        child: FaIcon(
                          FontAwesomeIcons.image,
                          color: Constants.PRIM_COLOR,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Classic Flat Room",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.star,
                            color: Colors.orange,
                            size: 13,
                          ),
                          Text("4.9"),
                          Text("(100 Reviews)")
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: Get.width,
              height: Get.height / 1.5,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Trip",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width / 2.4,
                          child: TextField(
                            controller: checkIn,
                            enabled: true,
                            decoration: const InputDecoration(
                                labelText: "Check In",
                                hintText: "Sat,Apr 3",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: Icon(Icons.calendar_view_month),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                        Container(
                          width: Get.width / 2.2,
                          child: TextField(
                            controller: checkOut,
                            enabled: true,
                            decoration: const InputDecoration(
                                labelText: "Check Out",
                                hintText: "Sun,Apr 4",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: Icon(Icons.calendar_view_month),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      " Contact Detail",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: email,
                      enabled: true,
                      decoration: const InputDecoration(
                          labelText: "Email Addres",
                          hintText: "youremail@gmail.com",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: phone,
                      enabled: true,
                      decoration: const InputDecoration(
                          labelText: "Phone ",
                          hintText: "+2519********",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: tourist,
                      enabled: true,
                      decoration: const InputDecoration(
                          hintText: "Full Name",
                          labelText: "Full Name",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: Get.width,
                        child: Obx(() => Get.find<PackageController>()
                                    .is_post_res
                                    .value ==
                                false
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(15)),
                                    onPressed: () {
                                      Reserevepacakge reserve = Reserevepacakge(
                                        checkin: DateTime.now(),
                                        checkout: DateTime.now(),
                                        email: email.text,
                                        package: 1,
                                        phone: phone.text,
                                        tourist: tourist.text,
                                      );
                                      Get.find<PackageController>()
                                          .postPackage(reserve);
                                      Get.toNamed("/paymentmethod");
                                    },
                                    child: const Text("Next")),
                              )
                            : const Center(child: CircularProgressIndicator())))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
