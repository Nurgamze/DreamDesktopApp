import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'YeniKullanici.dart';


class KullaniciYonetimiPage extends StatefulWidget {
  final Size initialSize;
  const KullaniciYonetimiPage({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<KullaniciYonetimiPage> createState() => _KullaniciYonetimiPageState();

  void eskiBoyutaDon() {
    var initialSize = Size(480, 350); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _KullaniciYonetimiPageState extends State<KullaniciYonetimiPage> {


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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              width: 995,
              height: 565,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("  Arama",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          SizedBox(width: 10,),
                          Container(
                            height: 26,
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54, width: 0.5),
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: " ",
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 100,
                            height: 21,
                            child: ElevatedButton(
                              onPressed: (){ },
                              child: Text("LİSTEDE ARA",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w400)),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: BorderSide(color: Colors.black12, width: 1),
                                  )),),
                          ),
                          SizedBox(width: 10,),
                          Container(
                              width: 450,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 790,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.grey)
                    ),
                  ),
                  SizedBox(height: 4,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
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
                              child: Text("KAPAT",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700)),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: BorderSide(color: Colors.black26, width: 1),
                                  )),),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                var eskiboyut=YeniKullanici(initialSize: Size(500,470));
                                return eskiboyut;
                              }));
                            },
                            child: Text("YENİ KULLANICI",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700)),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  side: BorderSide(color: Colors.black26, width: 1),
                                )),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
