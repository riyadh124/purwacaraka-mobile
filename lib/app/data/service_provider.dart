import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purwacaraka/app/components/dialog.dart';
import 'package:purwacaraka/app/components/loading.dart';
import 'package:purwacaraka/app/env/global_var.dart';
import 'package:purwacaraka/app/modules/home/views/home_view.dart';
import 'package:purwacaraka/app/modules/login/views/login_view.dart';

class ServiceProvider extends GetConnect {
  @override
  void login(context, id, pass) async {
    print("username: " + id);
    print("password: " + pass);

    if (id != '' && pass != '') {
      showLoading();

      try {
        final response =
            await post('$urlApi/api/login', {"email": id, "password": pass});

        var data = response.body;
        print("response $data");

        if (data['message'] == 'Login successful') {
          GetStorage().write("token", data["token"]);
          GetStorage().write("userData", data["data"]);
          onLoadingDismiss();
          Get.offAll(() => HomeView());
          successMessage(context, data['message']);
        } else {
          onLoadingDismiss();
          errorMessage(data['message']);
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
      }
    } else {
      errorMessage("Lengkapi Email dan Password terlebih dahulu.");
    }
  }

  void register(context, name, email, pass, gender) async {
    print("name: " + name);
    print("email: " + email);
    print("password: " + pass);
    print("gender: " + gender);

    if (name != '' && pass != '' && email != '') {
      showLoading();

      try {
        final response = await post('$urlApi/api/register', {
          "name": "$name",
          "email": "$email",
          "password": "$pass",
          "role": "student",
          "gender": "$gender"
        });

        var data = response.body;
        print("response $data");

        if (data['message'] == 'user regsitered successfully') {
          onLoadingDismiss();
          Get.offAll(() => LoginView());
          successMessage(context, "user registered successfully");
        } else {
          onLoadingDismiss();
          errorMessage(data);
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
      }
    } else {
      errorMessage("Lengkapi Email dan Password terlebih dahulu.");
    }
  }

  void submitForm(
      context,
      String name,
      String gender,
      String placeOfBirth,
      String dateOfBirth,
      String religion,
      String address,
      String phoneNumber,
      String email,
      int courseGradeId,
      int courseFee,
      String educationalLevel,
      String schoolName,
      String schoolAddress,
      String schoolCity,
      String fatherName,
      String fatherPhoneNumber,
      String fatherEmail,
      String fatherOccupation,
      String motherName,
      String motherPhoneNumber,
      String motherEmail,
      String motherOccupation,
      String socialMedia) async {
    // Printing each parameter for debugging purposes
    print("Name: $name");
    print("Gender: $gender");
    print("Place of Birth: $placeOfBirth");
    print("Date of Birth: $dateOfBirth");
    print("Religion: $religion");
    print("Address: $address");
    print("Phone Number: $phoneNumber");
    print("Email: $email");
    print("Course Grade ID: $courseGradeId");
    print("Course Fee: $courseFee");
    print("Educational Level: $educationalLevel");
    print("School Name: $schoolName");
    print("School Address: $schoolAddress");
    print("School City: $schoolCity");
    print("Father's Name: $fatherName");
    print("Father's Phone Number: $fatherPhoneNumber");
    print("Father's Email: $fatherEmail");
    print("Father's Occupation: $fatherOccupation");
    print("Mother's Name: $motherName");
    print("Mother's Phone Number: $motherPhoneNumber");
    print("Mother's Email: $motherEmail");
    print("Mother's Occupation: $motherOccupation");

    // Check if the necessary fields are not empty

    showLoading();

    var token = GetStorage().read("token");

    try {
      final response = await post('$urlApi/api/transactions', {
        "name": name,
        "gender": gender,
        "social_media": socialMedia,
        "birth_place": placeOfBirth,
        "date_of_birth": dateOfBirth,
        "religion": religion,
        "address": address,
        "phone_number": phoneNumber,
        "email": email,
        "course_grade_id": courseGradeId,
        "course_fee": courseFee,
        "educational_level": educationalLevel,
        "school_name": schoolName,
        "school_address": schoolAddress,
        "school_city": schoolCity,
        "father_name": fatherName,
        "father_phone_number": fatherPhoneNumber,
        "father_email": fatherEmail,
        "father_occupation": fatherOccupation,
        "mother_name": motherName,
        "mother_phone_number": motherPhoneNumber,
        "mother_email": motherEmail,
        "mother_occupation": motherOccupation,
      }, headers: {
        'Authorization': "Bearer $token"
      });

      var data = response.body;
      print("Response: $data");
      if (data["notification"] != null) {
        Get.off(HomeView());
        onLoadingDismiss();
        Get.snackbar('Success', 'Form submitted successfully!',
            backgroundColor: Colors.green, colorText: Colors.white);
        successMessage(context, data["notification"]["description"]);
      } else {
        onLoadingDismiss();
        errorMessage(data);
      }
    } catch (e) {
      onLoadingDismiss();
      errorMessage(e);
    }
  }

  Future<dynamic> getListCourseGrade(int idCourse) async {
    var token = GetStorage().read("token");

    if (token != null && token.isNotEmpty) {
      showLoading();

      try {
        final response = await get('$urlApi/api/course-grades?id=$idCourse',
            headers: {'Authorization': "Bearer $token"});

        var data = response.body;
        print("Response: $data");

        if (data != null) {
          onLoadingDismiss();
          return data["data"];
        } else {
          onLoadingDismiss();
          errorMessage("No data available");
          return false;
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage("An error occurred: ${e.toString()}");
        return false;
      }
    } else {
      errorMessage("No token found");
      return false;
    }
  }

  getListCourses(name) async {
    var token = GetStorage().read("token");

    if (token != '') {
      showLoading();

      try {
        final response = await get('$urlApi/api/courses?name=$name',
            headers: {'Authorization': "Bearer $token"});

        var data = response.body;
        print("response $data");

        if (data != null) {
          onLoadingDismiss();
          return data["data"];
        } else {
          onLoadingDismiss();
          errorMessage(data);
          return false;
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
        return false;
      }
    } else {
      return false;
    }
  }

  getListTransactions() async {
    var token = GetStorage().read("token");

    if (token != '') {
      showLoading();

      try {
        final response = await get('$urlApi/api/transaction-users?page',
            headers: {'Authorization': "Bearer $token"});

        var data = response.body;
        print("response $data");

        if (data != null) {
          onLoadingDismiss();
          return data["data"]["data"];
        } else {
          onLoadingDismiss();
          errorMessage(data);
          return false;
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
        return false;
      }
    } else {
      return false;
    }
  }

  getListActiveCourses() async {
    var token = GetStorage().read("token");

    if (token != '') {
      showLoading();

      try {
        final response = await get('$urlApi/api/student-course-active',
            headers: {'Authorization': "Bearer $token"});

        var data = response.body;
        print("response $data");

        if (data != null) {
          onLoadingDismiss();
          return data["data"];
        } else {
          onLoadingDismiss();
          errorMessage(data);
          return false;
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
        return false;
      }
    } else {
      return false;
    }
  }

  getListNotifikasi() async {
    var token = GetStorage().read("token");

    if (token != '') {
      showLoading();

      try {
        final response = await get('$urlApi/api/notifications',
            headers: {'Authorization': "Bearer $token"});

        var data = response.body;
        print("response $data");

        if (data != null) {
          onLoadingDismiss();
          return data["data"];
        } else {
          onLoadingDismiss();
          errorMessage(data);
          return false;
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
        return false;
      }
    } else {
      return false;
    }
  }
}
