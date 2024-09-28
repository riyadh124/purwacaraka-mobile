import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:purwacaraka/app/data/service_provider.dart';
import 'package:purwacaraka/app/widgets/button.dart';
import 'package:purwacaraka/app/widgets/text.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
                SizedBox(
                  height: 48,
                ),
                CText(
                  "Nama Lengkap",
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: registerController.nameController,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person),
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                CText(
                  "Email",
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: registerController.emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                CText(
                  "Password",
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextField(
                    controller: registerController.passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => registerController.isPassword.value =
                            !registerController.isPassword.value,
                        icon: registerController.isPassword.value
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.visibility_off),
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                      ),
                    ),
                    obscureText: registerController.isPassword.value,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                CText(
                  "Jenis Kelamin",
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: registerController.selectedGender.value.isEmpty
                        ? null
                        : registerController.selectedGender.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFE9E9E9)),
                      ),
                    ),
                    hint: Text('Select Gender'),
                    onChanged: (newValue) {
                      registerController.selectedGender.value = newValue!;
                    },
                    items: ['male', 'female'].map((gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(
                  height: 48,
                ),
                PrimaryButton(
                  text: "Daftar",
                  onTap: () {
                    ServiceProvider().register(
                        context,
                        registerController.nameController.text,
                        registerController.emailController.text,
                        registerController.passwordController.text,
                        registerController.selectedGender.value);
                  },
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     CText(
                //       "Belum punya akun?",
                //     ),
                //     CText(
                //       " Hubungi Admin",
                //       fontWeight: FontWeight.bold,
                //       color: primaryColor,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}
