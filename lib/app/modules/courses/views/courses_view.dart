import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:purwacaraka/app/modules/form/views/form_view.dart';
import 'package:purwacaraka/app/widgets/button.dart';
import 'package:purwacaraka/app/widgets/text.dart';

import '../controllers/courses_controller.dart';

class CoursesView extends GetView<CoursesController> {
  CoursesView({Key? key}) : super(key: key);
  CoursesController controller = Get.put(CoursesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CText(
            "Daftar Kursus Bermusik",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        body: Obx(() => controller.isListCourseDataExist.value
            ? ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: controller.courses.length,
                itemBuilder: (context, index) {
                  var name = controller.courses[index].name;
                  return Obx(
                    () => Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1CC4B),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              name == "VOCAL"
                                  ? 'assets/images/mic.png'
                                  : name == "VOCAL HOBBY"
                                      ? 'assets/images/mic.png'
                                      : name == "DRUM"
                                          ? 'assets/images/drum.png'
                                          : name == "DRUM HOBBY"
                                              ? 'assets/images/drum.png'
                                              : name == "KEYBOARD"
                                                  ? 'assets/images/piano-keyboard.png'
                                                  : name == "KEYBOARD HOBBY"
                                                      ? 'assets/images/piano-keyboard.png'
                                                      : name == "PIANO POP"
                                                          ? 'assets/images/piano.png'
                                                          : name ==
                                                                  "PIANO POP HOBBY"
                                                              ? 'assets/images/piano.png'
                                                              : name ==
                                                                      "PIANO KLASIK"
                                                                  ? 'assets/images/grand-piano.png'
                                                                  : name ==
                                                                          "PIANO KLASIK HOBBY"
                                                                      ? 'assets/images/grand-piano.png'
                                                                      : name ==
                                                                              "BIOLA"
                                                                          ? 'assets/images/violin.png'
                                                                          : name == "BIOLA HOBBY"
                                                                              ? 'assets/images/violin.png'
                                                                              : name == "GITAR KLASIK"
                                                                                  ? 'assets/images/guitar-instrument.png'
                                                                                  : name == "GITAR KLASIK HOBBY"
                                                                                      ? 'assets/images/guitar-instrument.png'
                                                                                      : name == "GITAR BASS"
                                                                                          ? 'assets/images/electric-guitar.png'
                                                                                          : name == "GITAR BASS HOBBY"
                                                                                              ? 'assets/images/electric-guitar.png'
                                                                                              : name == "GITAR ELEKTRIK"
                                                                                                  ? 'assets/images/electric-guitar.png'
                                                                                                  : name == "GITAR ELEKTRIK HOBBY"
                                                                                                      ? 'assets/images/electric-guitar.png'
                                                                                                      : 'assets/images/guitar-instrument.png',
                              height: 30,
                              width: 30,
                              color: Colors.white,
                            ),
                          ),
                          title:
                              Text('Kursus ${controller.courses[index].name}'),
                          trailing: IconButton(
                            icon: Icon(controller.isExpandedList[index]
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down),
                            onPressed: () {
                              controller.toggleExpand(index);
                            },
                          ),
                        ),
                        if (controller.isExpandedList[index])
                          Column(
                            children: [
                              Divider(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: CText(
                                  '''MATERI YANG DISAMPAIKAN

1. Pernafasan
2. Lagu
3. Pengucapan suara
4. Teknik improvisasi, interpretasi, apresiasi
5. Kelas I: pembentukan pembelajaran dasar dimana siswa akan diajarkan menyanyi dengan cara yang benar dan benar, dalam hal memproduksi suara dan dibantu dengan materi pembelajaran dan latihan.
6. Kelas II: formasi dasar periode kedua dimana siswa akan diajarkan menyanyi dengan artikulasi yang baik, interpretasi yang baik, dan mampu membaca notasi musik.
7. Kelas III: periode pengembangan tingkat pertama di mana siswa akan diajarkan untuk menyanyi dengan teknik yang lebih tinggi, yang hanya mungkin dilakukan setelah menyelesaikan Kelas I dan Kelas II.
8. Kelas IV: merupakan periode perkembangan tingkat kedua, yang akan mengembangkan potensi pribadi siswa dan meningkatkan kemampuan menyanyi ke tingkat lanjutan.

SYARAT & KETENTUAN

1. Usia minimal 5 tahun
2. Les seminggu sekali 1 murid, 1 guru (private)
3. Jadwal pertemuan les Maksimal sebulan 4x dan minimal 3x ( 3x pertemuan apabila biasanya terkena tanggal merah libur nasional dan tidak di ganti kecuali jika pertemuan lesnya terkena 2x tanggal merah maka salah satunya akan kami ganti)
4. Les seminggu sekali 30 menit kecuali Drum 45 menit 
5. Setiap grade rata rata perlu waktu 6-12 bulan. 
6. Ujian kenaikan grade diadakan 1 tahun sekali dan berbayar tergantung grade yang di ujikan. 
7. Tanggal merah libur nasional tidak ada penggantian les
8. Setiap tanggal 29,30 dan 31 libur minggu ke 5
9. Jadwal les permanen sedapat mungkin akan disesuaikan dengan siswanya.
10. Apabila berhalangan hadir selama ada konfirmasi ke admin maksimal 2 jam sebelum les maka jadwal les akan digantikan di hari lain
11. Pembayaran les paling lambat tanggal 15 untuk setiap bulannya''',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: PrimaryButton(
                                    text: "Ikuti",
                                    onTap: () {
                                      Get.to(() => FormView(),
                                          arguments:
                                              controller.courses[index].id);
                                    }),
                              )
                            ],
                          ),
                        Divider()
                      ],
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator())));
  }
}
