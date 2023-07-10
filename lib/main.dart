import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  await initializeDateFormatting('tr_TR', '');
  runApp(const MyApp());
  doWhenWindowReady((){
    //appWindow.size=Size(600,450);
    var initialSize=Size(480,350);
    appWindow.size=initialSize;
    appWindow.minSize=initialSize;
    appWindow.maxSize=initialSize;
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        menuTheme: MenuThemeData(
          style: MenuStyle(
            padding:
            MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0.0,horizontal: 0)),
          ),
        ),
      ),
        home: HomePage(),
     );
  }
}