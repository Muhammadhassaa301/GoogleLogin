import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlelogin/controllers/googlecontroller.dart';

class googleLogin extends StatelessWidget {
  googleLogin({super.key});
  final controller = Get.put(googleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null)
            return buildButton();
          else
            return buildView();
        }),
      ),
    );
  }

  FloatingActionButton buildButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      icon: Icon(Icons.security),
      label: Text('Sign in with Google'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  Column buildView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline3,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1,
        )
      ],
    );
  }
}
