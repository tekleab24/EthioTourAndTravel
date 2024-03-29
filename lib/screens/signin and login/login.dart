import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tourandtravel/controllers/logincontroller.dart';
import 'package:tourandtravel/utils/constants.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            opacity: 0.5,
            image: AssetImage("assets/onboarding1.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.offNamed("/getstarted"),
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Sign in with your email and password",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 35),
                Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                          labelText: "Email",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => TextFormField(
                        obscureText: Get.find<LoginController>().passshow.value,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelText: "password",
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              onPressed: () {
                                Get.find<LoginController>().passshow.value =
                                    !Get.find<LoginController>().passshow.value;
                              },
                              icon: Get.find<LoginController>().passshow.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ))),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Constants.PRIM_COLOR,
                              elevation: 10,
                              padding: const EdgeInsets.all(20)),
                          onPressed: () {
                            Get.offNamed("/homepage");
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                        onTap: () => Get.toNamed("/forgotpassword"),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
