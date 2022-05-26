import 'package:flutter/material.dart';
import 'package:nicode/controller/sinInController.dart';
import 'package:nicode/widgets/buttonWidget.dart';
import 'package:nicode/widgets/header.dart';
import 'package:nicode/widgets/textFieldWidget.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              //  Colors.cyan[500]
              Color.fromRGBO(255, 167, 37, 1.0),
              Color.fromRGBO(255, 183, 77, 1.0),
              Color.fromRGBO(255, 224, 178, 1.0),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Header(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 200, left: 15, right: 15, bottom: 40),
                      child: TextFieldWidget(
                          controller: signInController.phoneEditingController,
                          hintText: "phone number",
                          prefixIconData: Icons.phone,
                          obscureText: false),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await signInController.signIn(
                            signInController.phoneEditingController.text);
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.orange[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "ورود",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    // Button()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
