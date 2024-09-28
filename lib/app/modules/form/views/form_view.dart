import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:purwacaraka/app/data/service_provider.dart';
import 'package:purwacaraka/app/env/colors.dart';
import 'package:purwacaraka/app/widgets/button.dart';
import 'package:purwacaraka/app/widgets/text.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  FormView({Key? key}) : super(key: key);
  FormController formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CText(
          'Isi Formulir',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Data Sekolah Section
          Container(
            margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE3E5EB)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  "Data Siswa",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                SizedBox(height: 14),
                TextField(
                  controller: formController.nameTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Nama Lengkap Siswa',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Jenis Kelamin',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                  onChanged: (newValue) {
                    formController.genderTextEditingtController.text = newValue;
                  },
                  items:
                      formController.genderList.map<DropdownMenuItem>((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.tempatLahirTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Tempat Lahir',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: formController.tanggalLahirSelected,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null &&
                        picked != formController.tanggalLahirSelected) {
                      formController.tanggalLahirSelected = picked;
                      final formattedDate =
                          "${picked.day.toString().padLeft(2, '0')} "
                          "${controller.monthToString(picked.month)} "
                          "${picked.year}";
                      formController.tanggalLahirController.text =
                          formattedDate.toString();
                    }
                  },
                  controller: formController.tanggalLahirController,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Tanggal Lahir',
                    labelStyle: TextStyle(color: Colors.blue.shade900),
                  ),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.agamaTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Agama',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.addressTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Alamat',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.phoneNumberTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Nomor HP',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.emailTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
              ],
            ),
          ),
          // Data Siswa Section
          Container(
            margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE3E5EB)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  "Data Pendidikan",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                SizedBox(height: 14),
                TextField(
                  controller: formController.schoolTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Jenjang',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.schoolNameTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Nama Sekolah',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller:
                      formController.schoolAddressTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Alamat',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.schoolCityTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Kota',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          // Orang Tua Section
          Container(
            margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE3E5EB)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  "Orang Tua",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                SizedBox(height: 14),
                TextField(
                  controller: formController.nameAyahTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Nama Ayah',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller:
                      formController.phoneNumberAyahTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Nomor HP Ayah',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.emailAyahTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Email Ayah',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller:
                      formController.pekerjaanAyahTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Pekerjaan Ayah',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.nameIbuTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Nama Ibu',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller:
                      formController.phoneNumberIbuTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Nomor HP Ibu',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.emailIbuTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Email Ibu',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: formController.pekerjaanIbuTextEditingtController,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Pekerjaan Ibu',
                      labelStyle: TextStyle(color: Colors.blue.shade900)),
                ),
              ],
            ),
          ),
          // Kursus Musik Section
          Container(
            margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE3E5EB)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  "Kursus Musik yang Dipilih",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                SizedBox(height: 14),
                Obx(
                  () => SizedBox(
                      height: 150,
                      child: controller.isListInstrumentsExist.value
                          ? GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                              ),
                              itemCount: controller.instruments.length,
                              itemBuilder: (context, index) {
                                final instrument =
                                    controller.instruments[index];
                                return Obx(()=> RadioListTile<int>(
                                    title: Text(
                                      instrument['grade'] ?? 'No Name',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    subtitle: Text(
                                      "Rp. ${instrument['price'].toString()}" ??
                                          'No Name',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: instrument['id'],
                                    groupValue:
                                        controller.selectedInstrumentId.value,
                                    onChanged: (int? value) {
                                      controller.selectedInstrumentId.value =
                                          value!;
                                    },
                                  ),
                                );
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
                ),
              ],
            ),
          ),
          // Info Source Section
          Container(
            margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE3E5EB)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  "Mendapatkan info dari",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                SizedBox(height: 14),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.socmeds.length,
                    itemBuilder: (context, index) {
                      final socmed = controller.socmeds[index];
                      return Obx(() => RadioListTile<String>(
                            title: CText(
                              socmed['name'],
                              fontSize: 14,
                            ),
                            value: socmed['name'],
                            groupValue: controller.selectedSource.value,
                            onChanged: (String? value) {
                              controller.selectedSource.value = value!;
                            },
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
          // Terms and Conditions Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CText(
              '''Syarat - syarat Pendaftaran

• Bagi siswa baru, UANG PENDAFTARAN dan UANG KURSUS dilunasi sewaktu mendaftarkan diri.
• Untuk bulan berikutnya, UANG KURSUS dibayarkan selambat-lambatnya tanggal 15 setiap bulannya.
• UANG PENDAFTARAN dan UANG KURSUS tidak dapat diambil kembali.
• Bila dalam 1 (satu) bulan terdapat 5 (lima) minggu, maka pada minggu ke-5 (lima) tersebut tidak ada kegiatan belajar mengajar.
• Bagi siswa yang absen (tanpa keterangan) / terlambat datang atau hari libur umum tidak ada penggantian waktu belajar.
• Bila dalam 1 (satu) bulan siswa hanya hadir sebanyak 1 (satu) kali, maka siswa tersebut tetap diharuskan membayar penuh untuk 1 (satu) bulan.
• Jika siswa tidak aktif selama 3 (tiga) bulan berturut-turut, maka dianggap mengundurkan diri, dan harus mendaftar sebagai siswa baru jika ingin masuk kembali.
• Bagi siswa yang menunggak sampai dengan minggu ke-2 bulan berikutnya belum juga melunasi, maka pelajaran akan dihentikan.
• Siswa wajib mematuhi semua peraturan-peraturan yang dikeluarkan oleh sekolah dan guru, baik secara tertulis maupun lisan.''',
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: CText(
                'Saya sudah membaca dan menyetujui syarat pendaftaran.',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              value: controller.isTermsAccepted.value,
              onChanged: (newValue) {
                controller.isTermsAccepted.value = newValue!;
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: primaryColor,
              checkColor: Colors.white,
            ),
          ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButton(
              text: "Kirim",
              onTap: () {
                // Validate all fields and checkbox
                if (_validateForm()) {
                  // All fields are valid and checkbox is checked
                  // Proceed with form submission
                  // Add your submission logic here
                  ServiceProvider().submitForm(
                      context,
                      controller.nameTextEditingtController.text,
                      controller.genderTextEditingtController.text,
                      controller.tempatLahirTextEditingtController.text,
                      controller.tanggalLahirController.text,
                      controller.agamaTextEditingtController.text,
                      controller.addressTextEditingtController.text,
                      controller.phoneNumberTextEditingtController.text,
                      controller.emailTextEditingtController.text,
                      controller.selectedInstrumentId.value,
                      450000,
                      controller.schoolTextEditingtController.text,
                      controller.schoolNameTextEditingtController.text,
                      controller.schoolAddressTextEditingtController.text,
                      controller.schoolCityTextEditingtController.text,
                      controller.nameAyahTextEditingtController.text,
                      controller.phoneNumberAyahTextEditingtController.text,
                      controller.emailAyahTextEditingtController.text,
                      controller.pekerjaanAyahTextEditingtController.text,
                      controller.nameIbuTextEditingtController.text,
                      controller.phoneNumberIbuTextEditingtController.text,
                      controller.emailIbuTextEditingtController.text,
                      controller.pekerjaanIbuTextEditingtController.text,
                      controller.selectedSource.value);
                 
                } else {
                  // Show error message
                  Get.snackbar(
                    'Error',
                    'Please fill all the fields and accept the terms.',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _validateForm() {
    // Check if all text fields are filled
    if (formController.nameTextEditingtController.text.isEmpty ||
        formController.tempatLahirTextEditingtController.text.isEmpty ||
        formController.tanggalLahirController.text.isEmpty ||
        formController.agamaTextEditingtController.text.isEmpty ||
        formController.addressTextEditingtController.text.isEmpty ||
        formController.phoneNumberTextEditingtController.text.isEmpty ||
        formController.emailTextEditingtController.text.isEmpty ||
        formController.nameAyahTextEditingtController.text.isEmpty ||
        formController.phoneNumberAyahTextEditingtController.text.isEmpty ||
        formController.emailAyahTextEditingtController.text.isEmpty ||
        formController.pekerjaanAyahTextEditingtController.text.isEmpty ||
        formController.nameIbuTextEditingtController.text.isEmpty ||
        formController.phoneNumberIbuTextEditingtController.text.isEmpty ||
        formController.emailIbuTextEditingtController.text.isEmpty ||
        formController.pekerjaanIbuTextEditingtController.text.isEmpty) {
      return false;
    }

    // Check if terms are accepted
    if (!controller.isTermsAccepted.value) {
      return false;
    }

    return true;
  }
}
