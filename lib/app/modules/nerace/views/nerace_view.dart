import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/nerace_controller.dart';

class NeraceView extends GetView<NeraceController> {
  NeraceView({Key? key}) : super(key: key);
  NeraceController controller = Get.put(NeraceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neraca'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isListTransactionsDataExist.value
          ? ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: controller.transactions.length,
              itemBuilder: (context, index) {
                final transaction = controller.transactions[index];
                return TransactionTile(
                  title: transaction['transaction_type'],
                  date: transaction['created_at'],
                  amount: transaction['total'] == null
                      ? "Menunggu Konfirmasi"
                      : transaction['total'].toString(),
                  status: transaction['transaction_status'],
                  snap_token: transaction["snap_token"] ?? "",
                );
              },
            )
          : Center(child: CircularProgressIndicator())),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String status;
  final String snap_token;

  TransactionTile({
    Key? key,
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
    required this.snap_token,
  }) : super(key: key);

  @override
  NeraceController controller = Get.put(NeraceController());

  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(date);

    String formatCurrency(String amount) {
      final formatter = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp. ',
        decimalDigits: 0,
      );
      return formatter.format(double.parse(amount));
    }

    // Format the date into a localized string
    String formattedDate =
        DateFormat('dd MMMM yyyy, HH:mm', 'id_ID').format(dateTime.toLocal());

    return ListTile(
      leading: Icon(
        status == "oncheck" || status == "unpaid"
            ? Icons.access_time
            : Icons.done,
        color: status == "oncheck"
            ? Colors.grey
            : status == "unpaid"
                ? Colors.amber
                : Colors.green,
      ),
      title: Text(title == "register" ? "Mendaftar course" : title),
      subtitle: Text(formattedDate),
      trailing: Text(
        amount != "Menunggu Konfirmasi" ? formatCurrency(amount) : amount,
        style: TextStyle(
            color: status == "oncheck" ? Colors.grey : Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      onTap: () {
        if (status == "unpaid") {
          Uri link = Uri.parse(
              "https://app.sandbox.midtrans.com/snap/v2/vtweb/$snap_token");
          controller.launchInBrowserView(link);
        }
        // Define action when the tile is tapped
        // For example, navigate to a transaction details page
      },
    );
  }
}
