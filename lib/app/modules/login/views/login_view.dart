import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:purwacaraka/app/data/service_provider.dart';
import 'package:purwacaraka/app/env/colors.dart';
import 'package:purwacaraka/app/modules/register/views/register_view.dart';
import 'package:purwacaraka/app/widgets/button.dart';
import 'package:purwacaraka/app/widgets/text.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
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
              "Email",
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: loginController.emailController,
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
                controller: loginController.passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => loginController.isPassword.value =
                        !loginController.isPassword.value,
                    icon: loginController.isPassword.value
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
                obscureText: loginController.isPassword.value,
              ),
            ),

            SizedBox(
              height: 48,
            ),
            PrimaryButton(
              text: "Masuk",
              onTap: () {
                ServiceProvider().login(
                    context,
                    loginController.emailController.text,
                    loginController.passwordController.text);
              },
            ),

            SecondaryButton(
              text: "Daftar",
              onTap: () {
                Get.to(RegisterView());
                // authService().login(context, loginController.idController.text,
                //     loginController.passwordController.text);
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
