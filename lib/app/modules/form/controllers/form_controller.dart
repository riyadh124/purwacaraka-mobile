import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purwacaraka/app/data/service_provider.dart';

class FormController extends GetxController {
  //TODO: Implement FormController
  var courseId = Get.arguments;
  List genderList = ["male", "female"];

  RxBool isListInstrumentsExist = false.obs;
  List<Map<String, dynamic>> instruments = [];

  Future<void> fetchCourseGrades(idCourse) async {
    var data = await ServiceProvider().getListCourseGrade(idCourse);

    if (data != null) {
      instruments = List<Map<String, dynamic>>.from(data);
      isListInstrumentsExist.value = true;
    } else {
      instruments = [];
      isListInstrumentsExist.value = true;
    }
  }

  String monthToString(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }

  //Informasi Formulir
  TextEditingController nameTextEditingtController = TextEditingController();
  TextEditingController genderTextEditingtController = TextEditingController();
  TextEditingController tempatLahirTextEditingtController =
      TextEditingController();
  DateTime tanggalLahirSelected = DateTime(2024, 1, 1); // Set default date
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController agamaTextEditingtController = TextEditingController();
  TextEditingController addressTextEditingtController = TextEditingController();
  TextEditingController phoneNumberTextEditingtController =
      TextEditingController();
  TextEditingController emailTextEditingtController = TextEditingController();

  TextEditingController schoolTextEditingtController = TextEditingController();
  TextEditingController schoolNameTextEditingtController =
      TextEditingController();
  TextEditingController schoolAddressTextEditingtController =
      TextEditingController();
  TextEditingController schoolCityTextEditingtController =
      TextEditingController();

  TextEditingController nameAyahTextEditingtController =
      TextEditingController();
  TextEditingController phoneNumberAyahTextEditingtController =
      TextEditingController();
  TextEditingController pekerjaanAyahTextEditingtController =
      TextEditingController();
  TextEditingController emailAyahTextEditingtController =
      TextEditingController();

  TextEditingController nameIbuTextEditingtController = TextEditingController();
  TextEditingController phoneNumberIbuTextEditingtController =
      TextEditingController();
  TextEditingController pekerjaanIbuTextEditingtController =
      TextEditingController();
  TextEditingController emailIbuTextEditingtController =
      TextEditingController();

  RxInt selectedInstrumentId = 1.obs;

  final List<Map<String, dynamic>> socmeds = [
    {"id": 1, "name": "FACEBOOK"},
    {"id": 2, "name": "INSTAGRAM"},
    {"id": 3, "name": "TEMAN"},
    {"id": 4, "name": "BROSUR"},
  ];

  RxString selectedSource = "FACEBOOK".obs;
  RxBool isTermsAccepted = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourseGrades(courseId);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
