import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:nicode/screen/verifyPhone.dart';

class SignInController extends GetxController {
  late TextEditingController phoneEditingController;

  @override
  void onInit() {
    // TODO: implement onInit

    phoneEditingController = TextEditingController();
    super.onInit();
  }

  signIn(phoneNumber) async {
    var url = Uri.parse('http://nikotest.nicode.org/v1/signin');
    Map<String, String> header = {"Content-Type": "application/json; v=1.0"};

    Map<String, String> body = {"phoneNumber": "$phoneNumber"};

    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      Get.off(() => VerifyPhone(), arguments: jsonResponse['message']);
      print('jsonResponse: $jsonResponse.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
