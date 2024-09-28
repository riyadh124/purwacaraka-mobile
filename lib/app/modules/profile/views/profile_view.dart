import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:purwacaraka/app/components/dialog.dart';
import 'package:purwacaraka/app/env/colors.dart';
import 'package:purwacaraka/app/modules/login/views/login_view.dart';
import 'package:purwacaraka/app/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CText(
            "Profile",
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  profileController.box.read("userData")["gender"] == "female"
                      ? GestureDetector(
                          onTap: () => Get.to(() => ProfileView()),
                          child: Container(
                            width: 60,
                            height: 60,
                            child: const Icon(
                              Icons.person_2,
                              color: Colors.white,
                              size: 36,
                            ),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF9B39BE),
                                    Color(0xFFD98CF4),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      : GestureDetector(
                          onTap: () => Get.to(() => ProfileView()),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 36,
                            ),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF4F4DD8),
                                    Color(0xFF82AFFE),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        "${profileController.box.read("userData")["name"]}",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      CText(
                        "${profileController.box.read("userData")["email"]}",
                        fontSize: 14,
                        color: Color(0xFF999999),
                      ),
                      CText("${profileController.box.read("userData")["role"]}",
                          fontSize: 14, color: Color(0xFF999999))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 36,
              ),
              GestureDetector(
                onTap: () async {
                  Uri link = Uri.parse("https://wa.me/6281255600370");
                  if (!await launchUrl(
                    link,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception('Could not launch $link');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.headset_mic,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        CText(
                          "Hubungi Admin",
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  confirmMessage(
                    context,
                    "Konfirmasi Logout",
                    "Apakah Anda yakin ingin logout?",
                    () async {
                      profileController.box.remove("token");
                      profileController.box.remove("userData");
                      Get.offAll(() => LoginView());
                    },
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CText(
                      "Logout",
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ));
  }
}
