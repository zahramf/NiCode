import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nicode/controller/sinInController.dart';
import 'package:nicode/controller/verifyController.dart';
import 'package:nicode/widgets/buttonWidget.dart';
import 'package:nicode/widgets/textFieldWidget.dart';

class VerifyPhone extends StatelessWidget {
  VerifyController verifyController = Get.put(VerifyController());
  SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${Get.arguments}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
              child: TextField(
                controller: verifyController.verifyCodeEditingController,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: '...کد را وارد کنید',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 167, 37, 1.0),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await verifyController.verify(
                    signInController.phoneEditingController.text,
                    verifyController.verifyCodeEditingController.text);

                // print(signInController.phoneEditingController.text);
                print(verifyController.verifyCodeEditingController.text);
              },
              child: Container(
                height: 50,
                width: 180,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(251, 140, 0, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "تایید",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
