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
    var initialSize = Size(480, 400); // Eski boyutu burada belirleyin
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
  double fontSize = 13.5;

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
        width: 830,
        height: 485,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10 ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: 35, // Yükseklik sınırlaması eklendi
                            width: 190,
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color:  Colors.black54,width: 0.5),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 8),
                                Expanded(
                                  child: PopupMenuButton<String>(
                                    icon: null,
                                    onSelected: (String value) {
                                      setState(() {
                                        seciliVeriTabani = value;
                                      });
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return veriTabanlari.map((String value) {
                                        return PopupMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList();
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            seciliVeriTabani ?? 'Veri Tabanı Seçiniz',
                                            style: TextStyle(fontSize: 14),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Icon(Icons.arrow_drop_down),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 35,
                          child: ElevatedButton(
                            onPressed: (){  },
                            child: Text("LİSTELE",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  side: BorderSide(color: Colors.black26, width: 1),
                                )),),
                        ),SizedBox(width: 25,),
                        Row(
                          children: [
                            Text("Yazı Boyutu",style: TextStyle(fontSize: 15),),
                            IconButton(onPressed: (){
                              setState(() {
                                fontSize++;
                              });
                            }, icon: Icon(Icons.add)),
                            IconButton(onPressed: (){
                              setState(() {
                                if(fontSize>1){
                                  fontSize--;
                                }
                              });
                            }, icon: Icon( Icons.remove,)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: 800,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black54)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                        builder: (BuildContext context) {
                          final textScaleFactor = MediaQuery.of(context).textScaleFactor;
                          return Text(
                            "Boş denemeeee",
                            style: TextStyle(fontSize: fontSize * textScaleFactor),
                          );
                        },
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
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
              ],
            ),
          ),
        ),

      ),

    );
  }
}
