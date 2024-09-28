import 'package:get/get.dart';
import 'package:purwacaraka/app/data/service_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NeraceController extends GetxController {
  //TODO: Implement NeraceController
  RxBool isListTransactionsDataExist = false.obs;

  List transactions = [];

  Future<void> launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void onInit() async {
    super.onInit();
    var transactionsData = await ServiceProvider().getListTransactions();
    if (transactionsData != false) {
      transactions = transactionsData;
      isListTransactionsDataExist.value = true;
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
