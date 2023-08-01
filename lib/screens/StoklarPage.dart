import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:dream/screens/YardimPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoklarPage extends StatefulWidget {
  final Size initialSize;
  const StoklarPage({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<StoklarPage> createState() => _StoklarPageState();

  void onEnterPage() {
    var newSize = Size(780, 505); // Yeni boyutu belirleyin
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
  }

  void eskiBoyutaDon() {
    var initialSize = Size(480, 400); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _StoklarPageState extends State<StoklarPage> {

  void initState() {
    super.initState();
    var newSize = widget.initialSize; // Parametre olarak aldığınız boyutu kullanın
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
  }

  List<String> veriTabanlari = [
    'Veri Tabanı 1',
    'Veri Tabanı 2',
    'Veri Tabanı 3',
    'Veri Tabanı 4',
    'Veri Tabanı 5',
  ];
  String? seciliVeriTabani;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: 780,
        height: 485,
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Container(
                       width: 200,
                       height: 100,
                       decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey.shade300,width: 1),
                           borderRadius: BorderRadius.circular(3)
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 15),
                             child: Align(
                               alignment: Alignment.centerLeft,
                               child: Text("AKTİF VERİTABANI", style: TextStyle(fontSize: 12,),),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Align(
                               alignment: Alignment.topLeft,
                               child: Container(
                                 height: 25, // Yükseklik sınırlaması eklendi
                                 width: 180,
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
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Container(
                                   height: 30,
                                   width: 80,
                                   decoration: BoxDecoration(
                                     color: Colors.grey.shade200,
                                     borderRadius: BorderRadius.circular(4),
                                     border: Border.all(color: Colors.black, width: 0.2),
                                   ),
                                   child: Center(child: Text("GÜNCELLE",style: TextStyle(fontSize: 12),)),
                                 ),
                                 SizedBox(width: 20,),
                                 Row(
                                   children: [
                                     Container(
                                       height: 30,
                                       width: 80,
                                       decoration: BoxDecoration(
                                         color: Colors.grey.shade200,
                                         borderRadius: BorderRadius.circular(4),
                                         border: Border.all(color: Colors.black, width: 0.2),
                                       ),
                                       child: Center(child: Text("SEÇ",style: TextStyle(fontSize: 12),)),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                   ),
                     SizedBox(width: 2,),
                     Container(
                       decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey, width: 0.2),
                         borderRadius: BorderRadius.circular(4)
                       ),
                       child: Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 1),
                             child: Container(
                               width: 190,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 15),
                                     child: Align(
                                       alignment: Alignment.centerLeft,
                                       child: Text("FİLTRE", style: TextStyle(fontSize: 12,),),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 35),
                                     child: Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text("Ana Grup",style: TextStyle(fontSize: 11),)),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10),
                                     child: Align(
                                       alignment: Alignment.topLeft,
                                       child: Row(
                                         children: [
                                           GestureDetector(
                                             onTap: (){
                                               Navigator.push(context, MaterialPageRoute(builder: (context) => YardimPage(initialSize: Size(410, 400)),),);
                                             },
                                             child: Container(
                                               decoration: BoxDecoration(
                                                 color: Colors.grey.shade200,
                                                 border: Border.all(color: Colors.black54,width: 0.5),
                                                 borderRadius: BorderRadius.circular(3),
                                               ),
                                               width: 18,
                                               height: 22,
                                               child: Center(child: Text("...")),
                                             ),
                                           ),
                                           SizedBox(width: 6,),
                                           Expanded(
                                             child: Container(
                                               height: 22,
                                               decoration: BoxDecoration(
                                                 border: Border.all(color:  Colors.black54,width: 0.5),
                                                 borderRadius: BorderRadius.circular(3),
                                               ),
                                               child: TextFormField(
                                                 decoration: InputDecoration(border: InputBorder.none),
                                               ),
                                             ),
                                           ),
                                           SizedBox(width: 10,)
                                         ],
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 35),
                                     child: Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text("Alt Grup",style: TextStyle(fontSize: 11),)),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10),
                                     child: Align(
                                       alignment: Alignment.topLeft,
                                       child: Row(
                                         children: [
                                           Container(
                                             decoration: BoxDecoration(
                                               color: Colors.grey.shade200,
                                               border: Border.all(color:  Colors.black54,width: 0.5),
                                               borderRadius: BorderRadius.circular(3),
                                             ),
                                             width: 18,
                                             height: 22,
                                             child: Center(child: Text("...")),
                                           ),
                                           SizedBox(width: 6,),
                                           Expanded(
                                             child: Container(
                                               height: 22,
                                               decoration: BoxDecoration(
                                                 border: Border.all(color:  Colors.black54,width: 0.5),
                                                 borderRadius: BorderRadius.circular(3),
                                               ),
                                               child: TextFormField(
                                                 decoration: InputDecoration(
                                                     border: InputBorder.none
                                                 ),
                                               ),
                                             ),
                                           ),
                                           SizedBox(width: 10,)
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Container(
                             width: 190,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(vertical: 8),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 35),
                                     child: Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text("Marka",style: TextStyle(fontSize: 11),)),
                                   ),
                                   SizedBox(height: 5,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10),
                                     child: Align(
                                       alignment: Alignment.topLeft,
                                       child: Row(
                                         children: [
                                           Container(
                                             decoration: BoxDecoration(
                                               color: Colors.grey.shade200,
                                               border: Border.all(color: Colors.black54,width: 0.5),
                                               borderRadius: BorderRadius.circular(3),
                                             ),
                                             width: 18,
                                             height: 22,
                                             child: Center(child: Text("...")),
                                           ),
                                           SizedBox(width: 6,),
                                           Expanded(
                                             child: Container(
                                               height: 22,
                                               decoration: BoxDecoration(
                                                 border: Border.all(color:  Colors.black54,width: 0.5),
                                                 borderRadius: BorderRadius.circular(3),
                                               ),
                                               child: TextFormField(
                                                 decoration: InputDecoration( border: InputBorder.none ),
                                               ),
                                             ),
                                           ),
                                           SizedBox(width: 10,)
                                         ],
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: 4,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 35),
                                     child: Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text("Reyon",style: TextStyle(fontSize: 11),)),
                                   ),
                                   SizedBox(height: 2,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10),
                                     child: Align(
                                       alignment: Alignment.topLeft,
                                       child: Row(
                                         children: [
                                           Container(
                                             decoration: BoxDecoration(
                                               color: Colors.grey.shade200,
                                               border: Border.all(color:  Colors.black54,width: 0.5),
                                               borderRadius: BorderRadius.circular(3),
                                             ),
                                             width: 18,
                                             height: 22,
                                             child: Center(child: Text("...")),
                                           ),
                                           SizedBox(width: 6,),
                                           Expanded(
                                             child: Container(
                                               height: 22,
                                               decoration: BoxDecoration(
                                                 border: Border.all(color:  Colors.black54,width: 0.5),
                                                 borderRadius: BorderRadius.circular(3),
                                               ),
                                               child: TextFormField(
                                                 decoration: InputDecoration(border: InputBorder.none),
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 15),
                             child: Container(
                               width: 150,
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 3),
                                 child: Column(
                                   children: [
                                     Align(
                                         alignment: Alignment.centerLeft,
                                         child: Text("Stok Adı veya Kodu ile ara",style: TextStyle(fontSize: 11),)),
                                     SizedBox(height: 5,),
                                     Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                             height: 22,
                                             decoration: BoxDecoration(
                                               border: Border.all(color:  Colors.black54,width: 0.5),
                                               borderRadius: BorderRadius.circular(3),
                                             ),
                                             child: TextFormField(
                                               decoration: InputDecoration(border: InputBorder.none ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(width: 10,)
                                       ],
                                     ),
                                     SizedBox(height: 4,),
                                     Text("SDS'ler Arası Satışları Gösterme",style: TextStyle(fontSize: 10),),
                                     SizedBox(height: 4,),
                                     Align(
                                       alignment: Alignment.topLeft,
                                       child: Row(
                                         children: [
                                           Expanded(
                                             child: Container(
                                               decoration: BoxDecoration(
                                                 border: Border.all(color:  Colors.black54,width: 0.5),
                                                 borderRadius: BorderRadius.circular(2),
                                               ),
                                               child: ElevatedButton(
                                                 onPressed: (){}, child: Text("LİSTELE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 13),),
                                                 style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200),
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                     )
                       ],
                     ),
               ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 800,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 810,
                        height: 30,
                        color: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text("Gruplandırmak için bir sütun başlığını buraya sürükleyin.",style: TextStyle(color: Colors.grey.shade500,fontSize: 9),),
                        ),
                      ),
                      Container(
                        width: 810,
                        height: 30,
                        color: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                           ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Text("       KİMLERE"+"\n      SATILMIŞ?",style: TextStyle(fontSize: 10),),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("SİPARİŞ FÖYÜ",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text(" STOK HAREKET"+"\n       FÖYÜ",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("SATIŞ FİYATLARI",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("ALTERNATİF"+"\n ÜRÜNLER",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("KAR ORANI",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("[ ]",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("X",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("EXCEL'E AKTAR",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("EMAİL İLE GÖNDER",style: TextStyle(fontSize: 10),)),
                      ),
                      SizedBox(width: 5,),

                      Container(
                        height: 30,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              var eskiboyut=Stack(
                                  children:[
                                    Center(child: Positioned(
                                        top: 400,
                                        left: screenSize.width / 2,
                                        child: HomePage()))
                                  ]);
                              return eskiboyut;
                            }),
                            );
                            widget.eskiBoyutaDon();
                          }, icon: Icon(Icons.close,size: 17,),
                        )
                      ),
                    ]
                  ),
                ),
              )
                 ],
               ),
        ),
           )
        );
  }
}

