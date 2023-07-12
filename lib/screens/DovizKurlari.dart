import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DovizKurlariPage extends StatefulWidget {
  final Size initialSize;
  const DovizKurlariPage({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<DovizKurlariPage> createState() => _DovizKurlariPageState();

  void eskiBoyutaDon() {
    var initialSize = Size(480, 350); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _DovizKurlariPageState extends State<DovizKurlariPage> {

  DateTime selectedDate=DateTime.now();


  void initState() {
    super.initState();
    var newSize = widget.initialSize; // Parametre olarak aldığınız boyutu kullanın
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Dialog temasını ayarlayın
          child: SizedBox(
            width: 300, // Dialog genişliğini ayarlayın
            height: 400, // Dialog yüksekliğini ayarlayın
            child: child,
          ),
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("dd/MM/yyyy").format(selectedDate);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              width: 595,
              height: 365,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 24,
                            width: 200,
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
                                      labelText: "  $formattedDate",
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _selectDate(context); // Takvimin açılmasını sağlayan metod
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.calendar_today, color: Colors.black45, size: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 90,
                            height: 21,
                            child: ElevatedButton(
                              onPressed: (){ },
                              child: Text("TARİH SEÇ",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w400)),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: BorderSide(color: Colors.black12, width: 1),
                                  )),),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 180,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 570,
                      height: 270,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1,color: Colors.grey)
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Padding(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
