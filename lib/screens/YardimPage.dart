import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:dream/screens/StoklarPage.dart';
import 'package:flutter/material.dart';

class YardimPage extends StatefulWidget {
  final Size initialSize;
  const YardimPage({Key? key, required this.initialSize}) : super(key: key);


  @override
  State<YardimPage> createState() => _YardimPageState();

}

class _YardimPageState extends State<YardimPage> {

  void initState() {
    super.initState();
    var newSize = widget.initialSize; // Parametre olarak aldığınız boyutu kullanın
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
  }
  List<List<String>> tableData = [
    ["Sds Ortak Makine", "Sds Ortak Makine"],
    ["Makine", "Makine"],
    ["Display", "Display"],
    ["Levha", "Levha"],
    ["Ticari Ürünler", "Ticari Ürünler"],
    ["Promosyon", "Promosyon"],
    ["Sds Ortak", "Sds Ortak"],
    ["Grafik", "Grafik"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                        child: Text("Arama"),
                      ),
                    ),
                    Container(
                      height: 22,
                      width:150,
                      decoration: BoxDecoration(
                        border: Border.all(color:  Colors.black54,width: 0.5),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(border: InputBorder.none ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                        height:20,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: Colors.black, width: 0.2),
                        ),
                        child: Center(child: Text("LİSTEDE ARA",style: TextStyle(fontSize: 11),))
                    ),
                  ],
                ),
                Container(
                  width: 350,
                  height: 260,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade900,width: 0.3)
                  ),
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: DataTable(
                        dataRowHeight: 20,
                        columnSpacing: 10,
                        columns: [
                          DataColumn(label: Text("Kod",style: TextStyle(fontSize: 10),)),
                          DataColumn(label: Text("AnaGrup",style: TextStyle(fontSize: 10),)),
                        ],
                        rows: tableData.map((row) {
                          return DataRow(
                            cells: row.map((cellText) {
                              return DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cellText),
                                ],
                              ));
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
               ),
                SizedBox(height: 8,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Container(
                   height:30,
                   width: 80,
                   decoration: BoxDecoration(
                     color: Colors.grey.shade300,
                     borderRadius: BorderRadius.circular(4),
                     border: Border.all(color: Colors.black, width: 0.2),
                   ),
                   child: TextButton(
                       onPressed: () {
                         Navigator.pop(context);
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return StoklarPage(initialSize: Size(780,505)); // Önceki boyutlu olan HomePage sayfasına geri dön
                         }));
                       },
                       child: Center(child: Text("VAZGEÇ",style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w400),)))
               ),
               Container(
                   height:30,
                   width: 80,
                   decoration: BoxDecoration(
                     color: Colors.grey.shade300,
                     borderRadius: BorderRadius.circular(4),
                     border: Border.all(color: Colors.black, width: 0.2),
                   ),
                   child: Center(child: Text("SEÇ",style: TextStyle(fontSize: 11),))
               ),
             ],
           ),
         )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
