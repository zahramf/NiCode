import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:nicode/screen/homeScreen.dart';

class VerifyController extends GetxController {
  late TextEditingController verifyPhoneEditingController,
      verifyCodeEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    verifyPhoneEditingController = TextEditingController();
    verifyCodeEditingController = TextEditingController();

    super.onInit();
  }

  verify(phoneNumber, code) async {
    var url = Uri.parse('http://nikotest.nicode.org/v1/signin/verify');
    Map<String, String> header = {"Content-Type": "application/json; v=1.0"};

    Map<String, String> body = {"phoneNumber": "$phoneNumber", "code": "$code"};

    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      Get.off(() => HomeScreen(), arguments: jsonResponse['message']);
      print('jsonResponse: $jsonResponse.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
