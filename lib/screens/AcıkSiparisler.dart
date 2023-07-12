import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcikSiparisler extends StatefulWidget {
  final Size initialSize;
  const AcikSiparisler({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<AcikSiparisler> createState() => _AcikSiparislerState();

  void eskiBoyutaDon() {
    var initialSize = Size(480, 350); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _AcikSiparislerState extends State<AcikSiparisler> {

  List<String> veriTabanlari = [
    'Veri Tabanı 1',
    'Veri Tabanı 2',
    'Veri Tabanı 3',
    'Veri Tabanı 4',
    'Veri Tabanı 5',
  ];
  String? seciliVeriTabani;

  void initState() {
    super.initState();
    var newSize = widget.initialSize; // Parametre olarak aldığınız boyutu kullanın
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 780,
        height: 485,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(left: 11),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 90,
              height: 30,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    var eskiboyut=HomePage();
                    return eskiboyut;
                  }));
                  widget.eskiBoyutaDon();
                },
                child: Text("KAPAT",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(color: Colors.black26, width: 1),
                    )),),
            ),
          ),
        ),

      ),

    );
  }
}
