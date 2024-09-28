import 'package:get/get.dart';
import 'package:purwacaraka/app/data/service_provider.dart';
import 'package:purwacaraka/app/modules/notifikasi/views/notifikasi_view.dart';

class NotifikasiController extends GetxController {
  //TODO: Implement NotifikasiController

  final List<Notification> notifications = [];
  RxBool isListNotificationsExist = false.obs;
  @override
  void onInit() async {
    super.onInit();
    var notificationData = await ServiceProvider().getListNotifikasi();
    if (notificationData != false) {
      print("courseData: ${notificationData.length}");
      for (var i = 0; i < notificationData.length; i++) {
        notifications.add(Notification(
            id: notificationData[i]['id'],
            title: notificationData[i]['title'],
            description: notificationData[i]['description'],
            createdAt: notificationData[i]['created_at']));
      }
      isListNotificationsExist.value = true;
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
}
