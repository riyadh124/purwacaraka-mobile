import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:purwacaraka/app/env/colors.dart';
import 'package:purwacaraka/app/modules/courses/views/courses_view.dart';
import 'package:purwacaraka/app/modules/nerace/views/nerace_view.dart';
import 'package:purwacaraka/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:purwacaraka/app/modules/profile/views/profile_view.dart';
import 'package:purwacaraka/app/widgets/button.dart';
import 'package:purwacaraka/app/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView(
        children: [
          Row(
            children: [
              homeController.dataUser["gender"] == "female"
                  ? GestureDetector(
                    onTap: () => Get.to(()=> ProfileView()),
                    child: Container(
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.person_2,
                          color: Colors.white,
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
                    onTap: () => Get.to(()=> ProfileView()),
                    child: Container(
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
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
              const SizedBox(
                width: 14,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    homeController.formattedDate,
                    color: const Color(0xFF898A97),
                    fontSize: 14,
                  ),
                  CText(
                    "Hi, ${homeController.dataUser["name"]}!",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.to(()=>NotifikasiView()),
                child: const Icon(
                  Icons.notifications,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const CText(
            "Temukan kursus\nfavorit Anda.",
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => CoursesView());
            },
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4F4DD8),
                    Color(0xFF82AFFE),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    'assets/images/music-note.png',
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const CText(
                    "Daftar Kursus\nBermusik",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => NeraceView());
            },
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF9B39BE),
                    Color(0xFFD98CF4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    'assets/images/bill.png',
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const CText(
                    "Neraca",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CText(
                "Jadwal Kursus",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              // CText(
              //   "Lihat Semua",
              //   color: Colors.black,
              //   fontSize: 14,
              // ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Obx(() => homeController.isListActiveCoursesExist.value
              ? SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 100,
                  child: ListView.builder(
                    itemCount:  1,
                    itemBuilder: (context, index) {
                      return homeController.ListActiveCourses == null ? Center(child: CText("Tidak ada kursus saat ini.")) : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF5659DD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                               homeController.ListActiveCourses["course_grade"]["course"]["name"] == "VOCAL"
                                  ? 'assets/images/mic.png'
                                  : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "VOCAL HOBBY"
                                      ? 'assets/images/mic.png'
                                      : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "DRUM"
                                          ? 'assets/images/drum.png'
                                          : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "DRUM HOBBY"
                                              ? 'assets/images/drum.png'
                                              : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "KEYBOARD"
                                                  ? 'assets/images/piano-keyboard.png'
                                                  : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "KEYBOARD HOBBY"
                                                      ? 'assets/images/piano-keyboard.png'
                                                      : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "PIANO POP"
                                                          ? 'assets/images/piano.png'
                                                          : homeController.ListActiveCourses["course_grade"]["course"]["name"] ==
                                                                  "PIANO POP HOBBY"
                                                              ? 'assets/images/piano.png'
                                                              : homeController.ListActiveCourses["course_grade"]["course"]["name"] ==
                                                                      "PIANO KLASIK"
                                                                  ? 'assets/images/grand-piano.png'
                                                                  : homeController.ListActiveCourses["course_grade"]["course"]["name"] ==
                                                                          "PIANO KLASIK HOBBY"
                                                                      ? 'assets/images/grand-piano.png'
                                                                      : homeController.ListActiveCourses["course_grade"]["course"]["name"] ==
                                                                              "BIOLA"
                                                                          ? 'assets/images/violin.png'
                                                                          : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "BIOLA HOBBY"
                                                                              ? 'assets/images/violin.png'
                                                                              : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "GITAR KLASIK"
                                                                                  ? 'assets/images/guitar-instrument.png'
                                                                                  : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "GITAR KLASIK HOBBY"
                                                                                      ? 'assets/images/guitar-instrument.png'
                                                                                      : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "GITAR BASS"
                                                                                          ? 'assets/images/electric-guitar.png'
                                                                                          : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "GITAR BASS HOBBY"
                                                                                              ? 'assets/images/electric-guitar.png'
                                                                                              : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "GITAR ELEKTRIK"
                                                                                                  ? 'assets/images/electric-guitar.png'
                                                                                                  : homeController.ListActiveCourses["course_grade"]["course"]["name"] == "GITAR ELEKTRIK HOBBY"
                                                                                                      ? 'assets/images/electric-guitar.png'
                                                                                                      : 'assets/images/guitar-instrument.png',
                              height: 30,
                              width: 30,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CText(
                                "KURSUS ${homeController.ListActiveCourses["course_grade"]["course"]["name"]}",
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.grade,
                                    size: 16,
                                    color: Color(0xFF5659DD),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  CText(
                                    "${homeController.ListActiveCourses["course_grade"]["grade"]}",
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    size: 16,
                                    color: Color(0xFF5659DD),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  CText(
                                    "${homeController.covertDate(homeController.ListActiveCourses["start_date"])}",
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                )
              : CircularProgressIndicator()),
          const SizedBox(
            height: 24,
          ),
          const CText(
            "Berita",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () async {
              Uri link = Uri.parse(
                  "https://www.purwacarakamusicstudio.com/post/audisi-purwa-caraka-youth-orchestra");
              if (!await launchUrl(
                link,
                mode: LaunchMode.externalApplication,
              )) {
                throw Exception('Could not launch $link');
              }
            },
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                      "https://static.wixstatic.com/media/5c310a_b9db6b31f5f140839454d48f4bc1a155~mv2.jpg/v1/fill/w_1080,h_1080,al_c,q_85,enc_auto/5c310a_b9db6b31f5f140839454d48f4bc1a155~mv2.jpg"),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 136,
                      child: CText(
                        "Audisi Purwa Caraka Youth Orchestra",
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                      ),
                    ),
                    CText(
                      "Feb 15, 2024 | Headline",
                      color: Color(0xFF5659DD),
                      fontSize: 14,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 136,
                      child: CText(
                        "Purwa Caraka Youth Orchestra kembali membuka kesempatan bagi kamu yang berminat untuk bergabung dalam sebuah Orchestra yang tentunya dapat menambah pengalaman serta wawasan musikmu..",
                        fontSize: 14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
