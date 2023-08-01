import 'dart:convert';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/personelModel.dart';
import 'package:http/http.dart' as http;


class PersonelYonetimiPage extends StatefulWidget {
  final Size initialSize;
  const PersonelYonetimiPage({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<PersonelYonetimiPage> createState() => _PersonelYonetimiPageState();

  void eskiBoyutaDon() {
    var initialSize = Size(480, 400); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _PersonelYonetimiPageState extends State<PersonelYonetimiPage> {

  PersonelAdlariModel? personelModel;
  List<Personel?> personelList=[];

  String? NtUserName;
  TextEditingController adController=TextEditingController();
  String arama = '';



  void initState() {
    super.initState();
    var newSize = widget.initialSize; // Parametre olarak aldığınız boyutu kullanın
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
    yetkiliPersonel();
  }



  Future<void> yetkiliPersonel() async {
    final response=await http.get(Uri.parse("http://localhost:1000/api/personeladi"));
    if(response.statusCode==200){
      print("${response.body}");
       setState(() {
         personelModel=PersonelAdlariModel.fromJson(jsonDecode(response.body));
         personelList=personelModel!.data!;
       });
      print("personel listesi  $personelList");
    }
  }


  Future<void> deletePersonel(int id) async {
    final response = await http.delete(
        Uri.parse("http://localhost:1000/api/personelsil/$id"));
    if (response.statusCode == 201) {
      setState(() {
        personelList.removeWhere((personel) => personel?.id == id);
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Personel Silindi!",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Tamam"),
              )
            ],
          );
        },
      );
    }
  }

  Future<void> personelEkle() async{
    final response=await http.post(Uri.parse("http://localhost:1000/api/personelekle"),
      body: {
        "NtUserName":adController.text,
        },
    );
    if(response.statusCode==201){
       print("Yetkili eklendi");

       setState(() {
         personelList.add(Personel(ntUserName: adController.text)); // Yeni kişiyi listenin sonuna ekle
       });

    }else{
      print("yetkili eklenirken hata olustu");
    }
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
              height: 455,
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
                                      hintText: "Kullanıcı adı",
                                      hintStyle: TextStyle(fontSize: 13.50,),
                                      contentPadding:EdgeInsets.only(bottom: 20,left: 3),
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                    onChanged: (value){
                                      setState(() {
                                        arama=value;
                                      });
                                    },
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
                          ),
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
                    child: ListView(
                      children: [
                        DataTable(
                          dataRowHeight: 27,
                            columns: [
                              DataColumn(label: Text("YETKİLİ PERSONEL ADLARI "))
                            ],
                            rows: personelList.where((personel) => personel?.ntUserName?.toLowerCase().contains(arama.toLowerCase()) ?? false)  //arama kısmı
                                .map((personel){

                              int? id=personel?.id;

                              bool isGray = personelList.indexOf(personel) % 2 == 0;
                              Color rowColor = isGray ? Colors.grey.shade200 : Colors.white;

                              return DataRow(
                                color: MaterialStateProperty.all(rowColor),
                                  cells: [
                                    DataCell(
                                      Container(

                                          child: Text("${personel?.ntUserName}")),
                                      onDoubleTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Personel Silinecektir!",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                                              actions: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          deletePersonel(personel?.id ?? 0);
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text("Tamam"),
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.grey.shade400,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text("İptal"),
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.grey.shade400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    )
                                  ]
                              );
                            }).toList(),
                        )
                      ],
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
                               showDialog(context: context, builder: (BuildContext context)=>
                                  AlertDialog(
                                    title: Text("Yetkili Personel Adı",style: TextStyle(fontSize: 17),),
                                    content: TextFormField(
                                      controller: adController,
                                      decoration: InputDecoration(
                                        labelText: "Ad giriniz",
                                        hintText: "SDS\\isim.soyisim",
                                        border: OutlineInputBorder(
                                        )
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(onPressed: (){
                                        if(adController.text.isEmpty){
                                          showDialog(context: context, builder: (BuildContext context){
                                            return AlertDialog(
                                              title: Text("Hata"),
                                              content: Text("Lütfen bir isim giriniz"),
                                              actions: [
                                                TextButton(onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text("Tamam"))
                                              ],
                                            );
                                          });
                                        }else{
                                          setState(() {
                                            personelEkle();
                                            Navigator.pop(context);
                                          });
                                        }
                                      },
                                        child: Text("Tamam",style: TextStyle(color: Colors.black54),),
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200),
                                      )
                                    ],
                                 )
                               );
                            },
                            child: Text("YETKİLİ EKLE",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700)),
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
