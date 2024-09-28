import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:purwacaraka/app/data/service_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var dataUser;
  var box = GetStorage();
  DateTime now = DateTime.now();
  String formattedDate = "";

  var ListActiveCourses;
  RxBool isListActiveCoursesExist = false.obs;

  covertDate(date) {
    DateTime dateTime = DateTime.parse(date);

    // Format the date into a localized string
    String formattedDate =
        DateFormat('dd MMMM yyyy, HH:mm', 'id_ID').format(dateTime.toLocal());

    return formattedDate;
  }

  @override
  void onInit() async {
    super.onInit();
    dataUser = box.read("userData");
    formattedDate = DateFormat('EEEE, d MMMM', 'id_ID').format(now);
    var activeCourseData = await ServiceProvider().getListActiveCourses();
    if (activeCourseData != false) {
      ListActiveCourses = activeCourseData;
      isListActiveCoursesExist.value = true;
    }
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
