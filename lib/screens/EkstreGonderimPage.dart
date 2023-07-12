import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:dream/screens/YardimPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EkstreGonderimPage extends StatefulWidget {
  final Size initialSize;
  const EkstreGonderimPage({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<EkstreGonderimPage> createState() => _EkstreGonderimPageState();

  void onEnterPage() {
    var newSize = Size(780, 505); // Yeni boyutu belirleyin
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
  }

  void eskiBoyutaDon() {
    var initialSize = Size(480, 350); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _EkstreGonderimPageState extends State<EkstreGonderimPage> {

  int selectedOption = 0;
  bool isChecked1=false;
  bool isChecked2=false;
  bool isChecked3=false;

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
  DateTime selectedDate1=DateTime.now();
  DateTime selectedDate2=DateTime.now();

  void _selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1 ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: SizedBox(
            width: 300,
            height: 400,
            child: child,
          ),
        );
      },
    );

    if (picked != null && picked != selectedDate1) {
      setState(() {
        selectedDate1 = picked;
      });
    }
  }

  void _selectLastDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2 ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: SizedBox(
            width: 300,
            height: 400,
            child: child,
          ),
        );
      },
    );

    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
      });
    }
  }


  void handleOptionChange(int value) {
    setState(() {
      selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate1 = DateFormat("dd/MM/yyyy").format(selectedDate1);
    String formattedDate2 = DateFormat("dd/MM/yyyy").format(selectedDate2);


    return Scaffold(
        body: Container(
          width: 980,
          height: 555,
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
                        padding: const EdgeInsets.only(left: 80),
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
                                          child: Text("Temsilci",style: TextStyle(fontSize: 11),)),
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
                                                child: Center(child: Text("..")),
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
                                          child: Text("Bölge",style: TextStyle(fontSize: 11),)),
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
                                              child: Center(child: Text("..")),
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
                                          child: Text("Sektör",style: TextStyle(fontSize: 11),)),
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
                                              child: Center(child: Text("..")),
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
                                          child: Text("Grup",style: TextStyle(fontSize: 11),)),
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
                                              child: Center(child: Text("..")),
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
                                          child: Text("Arama",style: TextStyle(fontSize: 11),)),
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
                                      SizedBox(height: 2,),
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
                    width: 910,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 910,
                          height: 30,
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text("Gruplandırmak için bir sütun başlığını buraya sürükleyin.",style: TextStyle(color: Colors.grey.shade500,fontSize: 9),),
                          ),
                        ),
                        Divider(height: 1,color: Colors.black26,),
                        SizedBox(height: 185,),

                        Container(
                          width: 910,
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  handleOptionChange(0);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      selectedOption == 0 ? Icons.check_circle : Icons.radio_button_unchecked,
                                      color: selectedOption == 0 ? Colors.green : Colors.black,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Basit Ekstre Gönderimi        ", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  handleOptionChange(1);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      selectedOption == 1 ? Icons.check_circle : Icons.radio_button_unchecked,
                                      color: selectedOption == 1 ? Colors.green : Colors.black,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Ortalama Vade Hesaplamalı", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text("Ekstre Başlangıç Tarihi: ",style: TextStyle(fontSize: 11),),
                                  SizedBox(width: 8,),
                                  Container(
                                    height: 22,
                                    width: 110,
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
                                              labelText: "  $formattedDate1",
                                              labelStyle: TextStyle(color: Colors.black,fontSize: 11),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _selectFirstDate(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 5),
                                            child: Icon(Icons.calendar_today, color: Colors.black45, size: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3,),
                            Row(
                              children: [
                                Text("                    Son Tarihi:",style: TextStyle(fontSize: 11),),
                                SizedBox(width: 10,),
                                Container(
                                  height: 20,
                                  width: 110,
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
                                            labelText: "  $formattedDate2",
                                            labelStyle: TextStyle(color: Colors.black,fontSize: 11),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _selectLastDate(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 5),
                                          child: Icon(Icons.calendar_today, color: Colors.black45, size: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked1=value ?? false;
                                });
                              },
                            ),
                            Text(
                              "Kendime CC"+"\nGönder",
                              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2=value ?? false;
                                });
                              },
                            ),
                            Text(
                              "Çek İadeleri"+"\nDikkate Alınsın",
                              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked3=value ?? false;
                                });
                              },
                            ),
                            Text(
                              "Ekstreleri Yalnızca"+"\nKendime Gönder",
                              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 70,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black, width: 0.2),
                            ),
                            child: Center(child: Text("Seçilen"+"\nCarilere"+"\nEkstre"+"\nGönder",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        Container(
                            height: 40,
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
                                  var eskiboyut=HomePage();
                                  return eskiboyut;
                                }),
                                );
                                widget.eskiBoyutaDon();
                              }, icon: Icon(Icons.close,size: 17,),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


}

