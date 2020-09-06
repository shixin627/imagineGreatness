import 'package:flutter/material.dart';
import 'package:hello_world/locator.dart';
import 'package:hello_world/pages/column_row.dart';
import 'package:hello_world/pages/random_word_screen.dart';
import 'package:hello_world/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Classroom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyRandomWords(),
      // MyColumnRow(
      //   title: "My Home",
      // ),
      navigatorKey: locator<NavigationService>()
          .navigatorKey, // 使用GlobalKey<NavigatorState>
      onGenerateRoute:
          doGenerateRoute, // 以當前的RouteSettings來決定現在的頁面Route<dynamic>
    );
  }
}
