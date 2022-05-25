import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathprovider;
import 'package:nicode/screen/signIn.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final applicationDocumenter =
      await pathprovider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationDocumenter.path);
  // await Hive.initFlutter();
  // Hive.registerAdapter(PathAdapter());
  await Hive.openBox('path');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Hive.openBox("helpPath"),
        builder: (BuildContext context, AsyncSnapshot<Box<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return SignIn();
          } else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }
}
