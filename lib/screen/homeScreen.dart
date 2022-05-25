import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nicode/widgets/boxes.dart';
import 'package:nicode/widgets/itemCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('path');

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, right: 50),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "${Get.arguments}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.orange)),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: [
                    ItemCard(
                      image: 'assets/images/chocolateD.jpg',
                      title: 'دونات شکلاتی',
                      press: () {
                        box.deleteAll(box.keys);
                        Get.defaultDialog(
                          title: "این دونات رو میخوای؟",
                          middleText: "",
                          titleStyle: TextStyle(
                            color: Colors.brown[500],
                            fontWeight: FontWeight.bold,
                          ),
                          radius: 8,
                          textConfirm: "بله",
                          textCancel: "!نمیدونم",
                          onConfirm: () {
                            // final box = Boxes.getPath();

                            box.put('value1', 'بله');
                            Get.back();
                            Get.defaultDialog(
                              title: "مطمئنی؟",
                              middleText: "",
                              titleStyle: TextStyle(
                                color: Colors.brown[500],
                                fontWeight: FontWeight.bold,
                              ),
                              radius: 8,
                              actions: [
                                RaisedButton(
                                  child: Text(
                                    "!نه",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    box.put('value2', '!نه');
                                    Get.back();
                                    Get.defaultDialog(
                                      title: "میخوای بقیه دونات ها رو ببینی؟",
                                      middleText: "",
                                      titleStyle: TextStyle(
                                        color: Colors.brown[500],
                                        fontWeight: FontWeight.bold,
                                      ),
                                      radius: 8,
                                      textConfirm: "بله",
                                      textCancel: "نه پشیمون شدم",
                                      onConfirm: () {
                                        box.put('value3', 'بله');
                                        Get.back();
                                      },
                                      onCancel: () {
                                        box.put('value4', 'نه پشیمون شدم');
                                      },
                                      cancelTextColor: Colors.red,
                                      confirmTextColor: Colors.white,
                                      barrierDismissible: false,
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                RaisedButton(
                                  child: Text(
                                    "آره مطمئنم",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    box.put('value5', 'آره مطمئنم');
                                    Get.back();

                                    Get.defaultDialog(
                                      title:
                                          "!برای بار آخر میپرسم پشیمون نشی بعدا",
                                      middleText: "",
                                      titleStyle: TextStyle(
                                        color: Colors.brown[500],
                                        fontWeight: FontWeight.bold,
                                      ),
                                      radius: 8,
                                      textConfirm: "همین و میخوام",
                                      textCancel: "!نمیدونم",
                                      onConfirm: () {
                                        box.put('value6', 'همین و میخوام');
                                      },
                                      onCancel: () {
                                        box.put('value7', '!نمیدونم');
                                      },
                                      cancelTextColor: Colors.red,
                                      confirmTextColor: Colors.white,
                                      barrierDismissible: false,
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                ),
                              ],
                              cancelTextColor: Colors.red,
                              confirmTextColor: Colors.white,
                              barrierDismissible: false,
                            );
                          },
                          onCancel: () {
                            box.put('value8', '!نمیدونم');
                          },
                          cancelTextColor: Colors.red,
                          confirmTextColor: Colors.white,
                          barrierDismissible: false,
                        );
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text(
                    "...چی انتخاب کردی",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // box.deleteFromDisk();
                    String? data1 = box.get("value1");
                    String? data2 = box.get("value2");
                    String? data3 = box.get("value3");
                    String? data4 = box.get("value4");
                    String? data5 = box.get("value5");
                    String? data6 = box.get("value6");
                    String? data7 = box.get("value7");
                    String? data8 = box.get("value8");

                    List<String?> intList = [
                      data1,
                      data2,
                      data3,
                      data4,
                      data5,
                      data6,
                      data7,
                      data8
                    ];
                    List<String> filteredList = filter(intList); // New list
                    Get.snackbar("title", filteredList.toString());
                  },
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> filter(List<String?> input) {
    input.removeWhere((e) => e == null);
    return List<String>.from(input);
  }
}
