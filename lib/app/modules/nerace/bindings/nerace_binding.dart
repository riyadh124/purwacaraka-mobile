import 'package:get/get.dart';

import '../controllers/nerace_controller.dart';

class NeraceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NeraceController>(
      () => NeraceController(),
    );
  }
}
