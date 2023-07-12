import 'dart:convert';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/models/MailModel.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MailAlicilari extends StatefulWidget {
  final Size initialSize;
  const MailAlicilari({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<MailAlicilari> createState() => _MailAlicilariState();

  void eskiBoyutaDon() {
    var initialSize = Size(480, 350); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _MailAlicilariState extends State<MailAlicilari> {

  MailModel? mailModel;
  List<Mail?> mailList=[];

  TextEditingController jobKoduController=TextEditingController();
  TextEditingController subeKoduController=TextEditingController();

  String? seciliMail;

  void initState() {
    super.initState();
    var newSize = widget.initialSize; // Parametre olarak aldığınız boyutu kullanın
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
    mailListesi();
  }

  
  Future<void> mailListesi() async {
    final response = await http.get(Uri.parse("http://localhost:1000/api/mail"));
    if(response.statusCode==200){
      print(response.body);

      setState(() {
        mailModel=MailModel.fromJson(jsonDecode(response.body));
        mailList=mailModel!.data!;
      });
      print("mail listesi  $mailList");
    }
  }


  List<String> subeKodlari = [
    '00001',
    '00002',
    '00003',
    '00004',
    '00005',
  ];

  String? seciliJobKodu;
  String? seciliSubeKodu;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 700,
              height: 456,
              color: Colors.grey.shade100,
              child:Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Job Kodu   "),
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
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text("Job Kodu Seçiniz"),
                                        underline: Container(),
                                      value: seciliMail,
                                      onChanged: (yeniMail){
                                        setState(() {
                                          seciliMail=yeniMail.toString();
                                          jobKoduController.text=seciliJobKodu.toString();
                                        });
                                      }, items: mailList?.map((mail) =>
                                            DropdownMenuItem(child: Text(mail!.jobKodu.toString()),
                                              value: mail.id,
                                    )).toList()
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text("Şube Kodu "),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 25,
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
                                      child: DropdownButton(
                                          isExpanded: true,
                                          hint: Text("Şube Kodu Seçiniz"),
                                          value: seciliMail,
                                          underline: Container(),
                                          onChanged: (yeniMail){
                                            setState(() {
                                              seciliMail=yeniMail.toString();
                                              subeKoduController.text=seciliJobKodu.toString();
                                            });
                                          }, items: mailList?.map((mail) =>
                                          DropdownMenuItem(child: Text(mail!.subeKodu.toString()),
                                            value: mail.id,
                                          )).toList()
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Align(
                      alignment: Alignment.topLeft,
                        child: Text("Mail Listesi")
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                           color: Colors.white,
                         border: Border.all(
                           color: Colors.black45
                        )
                      ),
                    ),
                    SizedBox(height: 15,),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Yedekler")
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black45
                          )
                      ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
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
                        Container(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: (){

                              /*Navigator.push(context, MaterialPageRoute(builder: (context){
                                var eskiboyut=HomePage();
                                return eskiboyut;
                              }));
                              widget.eskiBoyutaDon();*/

                            },
                            child: Text("GÜNCELLE",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  side: BorderSide(color: Colors.black26, width: 1),
                                )),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
