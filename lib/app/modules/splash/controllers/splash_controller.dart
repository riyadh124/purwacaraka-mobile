import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purwacaraka/app/modules/home/views/home_view.dart';
import 'package:purwacaraka/app/modules/login/views/login_view.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() async {
    super.onInit();

    Future.delayed(
      const Duration(seconds: 1),
      () async {
        String? token = await GetStorage().read("token");
        if (token == null) {
          Get.off(LoginView());
        } else {
          Get.off(HomeView());
        }
      },
    );
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
