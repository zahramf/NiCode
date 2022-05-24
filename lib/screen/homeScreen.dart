import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nicode/widgets/itemCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Icon(Icons.search),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemCard(
                  image: 'assets/images/chocolateD.jpg',
                  title: 'دونات شکلاتی',
                  press: () {
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
                                  onConfirm: () {},
                                  onCancel: () {},
                                  cancelTextColor: Colors.red,
                                  confirmTextColor: Colors.white,
                                  barrierDismissible: false,
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue),
                              ),
                            ),
                            RaisedButton(
                              child: Text(
                                "آره مطمئنم",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Get.back();

                                Get.defaultDialog(
                                  title: "!برای بار آخر میپرسم پشیمون نشی بعدا",
                                  middleText: "",
                                  titleStyle: TextStyle(
                                    color: Colors.brown[500],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  radius: 8,
                                  textConfirm: "همین و میخوام",
                                  textCancel: "!نمیدونم",
                                  onConfirm: () {},
                                  onCancel: () {},
                                  cancelTextColor: Colors.red,
                                  confirmTextColor: Colors.white,
                                  barrierDismissible: false,
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                            ),
                          ],
                          cancelTextColor: Colors.red,
                          confirmTextColor: Colors.white,
                          barrierDismissible: false,
                        );
                      },
                      cancelTextColor: Colors.red,
                      confirmTextColor: Colors.white,
                      barrierDismissible: false,
                    );
                  },
                ),
                ItemCard(
                  image: 'assets/images/whiteD.jpg',
                  title: 'دونات شیری',
                  press: () {},
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
