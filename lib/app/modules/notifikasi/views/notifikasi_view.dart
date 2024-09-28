import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/notifikasi_controller.dart';

class Notification {
  final int id;
  final String title;
  final String description;
  final String createdAt;

  Notification({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });
}

class NotifikasiView extends GetView<NotifikasiController> {
  NotifikasiView({Key? key}) : super(key: key);
  NotifikasiController controller = Get.put(NotifikasiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: Obx(() => controller.isListNotificationsExist.value
          ? ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: controller.notifications.length,
              itemBuilder: (context, index) {
                final notification = controller.notifications[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(notification.title),
                      Text(
                        DateFormat('dd MMM yyyy, HH:mm').format(
                          DateTime.parse(notification.createdAt).toLocal(),
                        ),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  subtitle: Text(notification.description),
                  // trailing: Text(
                  //   DateFormat('dd MMM yyyy, HH:mm').format(
                  //     DateTime.parse(notification.createdAt).toLocal(),
                  //   ),
                  //   style: TextStyle(color: Colors.grey),
                  // ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}
