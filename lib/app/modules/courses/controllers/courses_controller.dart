import 'package:get/get.dart';
import 'package:purwacaraka/app/data/course_class.dart';
import 'package:purwacaraka/app/data/service_provider.dart';

class CoursesController extends GetxController {
  //TODO: Implement CoursesController
  var courses = <Course>[];
  RxList isExpandedList = <bool>[].obs;
  RxBool isListCourseDataExist = false.obs;

  @override
  void onInit() async {
    super.onInit();
    var courseData = await ServiceProvider().getListCourses("");
    if (courseData != false) {
      print("courseData: ${courseData.length}");
      for (var i = 0; i < courseData.length; i++) {
        courses.add(Course(
            id: courseData[i]['id'],
            name: courseData[i]['name'],
            createdAt: courseData[i]['created_at'],
            updatedAt: courseData[i]['updated_at']));
      }
      isExpandedList.value = List<bool>.generate(courses.length, (_) => false);
      isListCourseDataExist.value = true;
    }
  }

  void toggleExpand(int index) {
    isExpandedList[index] = !isExpandedList[index];
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
