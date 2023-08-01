import 'dart:convert';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/jobModel.dart';
import '../models/mailModellll.dart';
import '../models/subeModel.dart';
import 'HomePage.dart';

class MailAlicilari2 extends StatefulWidget {
  final Size initialSize;
  const MailAlicilari2({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<MailAlicilari2> createState() => _MailAlicilari2State();

  void eskiBoyutaDon() {
    var initialSize = Size(480, 400); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _MailAlicilari2State extends State<MailAlicilari2> {
  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  final ScrollController horizontalScroll2 = ScrollController();
  final ScrollController verticalScroll2= ScrollController();

  final double width = 15;
  final double height = 20;


  JobModel? jobModel;
  List<Data?> jobList=[];
  SubeModel? subeModel;
  List<Sube?> subeList=[];
  MailModel? mailModel;
  List<Mail?> mailList=[];


  TextEditingController jobKoduController=TextEditingController();
  TextEditingController subeKoduController=TextEditingController();
  TextEditingController mailCont=TextEditingController();
  TextEditingController yedekCont=TextEditingController();

  String? seciliMail,selectedJobKod,selectedSubeKod,job_kodu,sube_kodu,guncelMail,guncelYedek;
  int? selectedId;
  String? seciliJobKodu;
  String? seciliSubeKodu;
  String? originalMail,originalYedekMail,tempSelectedSubeKod,selectedOrginalMail,selectedOrginalYedek;


  ScrollController _verticalController = ScrollController();
  ScrollController _horizontalController = ScrollController();

  void initState() {
    super.initState();
    var newSize = widget.initialSize; // Parametre olarak aldığınız boyutu kullanın
    appWindow.size = newSize;
    appWindow.minSize = newSize;
    appWindow.maxSize = newSize;
    jobKod();
    subeKod();
    getMail();
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  Future<void> updateMail(int? id) async {
    // Job kodu ve sube kodu seçmeyle alakalı burası
    if (jobKoduController.text.isEmpty || subeKoduController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Hata"),
          content: Text("Lütfen tüm alanları seçiniz"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tamam"),
            ),
          ],
        ),
      );
      return;
    }

    if (selectedOrginalMail == guncelMail && selectedOrginalYedek == guncelYedek) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Mail başarıyla Güncellendi"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tamam"),
            ),
          ],
        ),
      );
    } else {
      final response = await http.post(
        Uri.parse("http://localhost:1000/api/editmail/$id"),
        body: {
          "mail_listesi": guncelMail ?? selectedOrginalMail,
          "yedek": guncelYedek ?? selectedOrginalYedek
        },
      );
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Mail başarıyla Güncellendi"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Tamam"),
              ),
            ],
          ),
        );
        print(response.body);
      } else {
        print("Hata var");
      }
      guncelMail=originalMail;
      guncelYedek=originalYedekMail;
      //originalMail = guncelMail.toString();
      //originalYedekMail = guncelYedek.toString();
    }
  }



  Future<void> jobKod() async {
    final response = await http.get(Uri.parse("http://localhost:1000/api/jobkod"),);
    if(response.statusCode==200){
      print(response.body);

      setState(() {
        jobModel=JobModel.fromJson(jsonDecode(response.body));
        jobList=jobModel!.data!;

      });
      print("jobKod listesi  $jobList");
    }
  }

  Future<void> subeKod() async {

    final response = await http.post(
      Uri.parse("http://localhost:1000/api/subekod"),
      body: {'job_kodu': selectedJobKod},
    );
    if (response.statusCode == 200) {
      print(response.body);
      tempSelectedSubeKod = selectedSubeKod;
      setState(() {
        subeModel = SubeModel.fromJson(jsonDecode(response.body));
        subeList = subeModel!.data!;
      });
      if (subeList.any((sube) => sube?.subeKodu == tempSelectedSubeKod)) {
        setState(() {
          selectedSubeKod = tempSelectedSubeKod;
          print("dnsfb $tempSelectedSubeKod");
        });
      }
      print("subekod listesi  $subeList");
    } else {
      print("Sube kodlari alinamadi. Status Code: ${response.statusCode}");
    }
  }


  void getMail() async{
    if(jobKoduController.text.isEmpty || subeKoduController.text.isEmpty){
      showDialog(context: context, builder: (BuildContext context)=>
          AlertDialog(
            title: Text("Hata"),
            content: Text("Lütfen tüm alanları doldurun"),
            actions: [
              ElevatedButton(onPressed: ()=>Navigator.pop(context),
                  child: Text("Tamam")
              )
            ],
          )
      );
      return;
    }
    job_kodu=jobKoduController.text;
    sube_kodu=subeKoduController.text;

    print("$job_kodu ,$sube_kodu");
    final response =await http.post(Uri.parse("http://localhost:1000/api/mail"),
        body:{
          "job_kodu":job_kodu,
          "sube_kodu":sube_kodu,
        });

    if(response.statusCode==200){
      print(response.body);

      setState(() {
        mailModel=MailModel.fromJson(jsonDecode(response.body));
        mailList=mailModel!.data!;

        print("mail listesiiiiiiiiiiiii: $mailList");
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric( vertical:2,horizontal:8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Job Kodu   "),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 22,
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
                                          value: selectedJobKod,
                                          onChanged: (selectedJob) {
                                            setState(() {
                                              selectedJobKod = selectedJob.toString();
                                              jobKoduController.text = selectedJobKod.toString();
                                              selectedSubeKod = null;
                                              subeKod();
                                            });
                                          },
                                          items: jobList?.map((mail) {
                                            return DropdownMenuItem(
                                              child: Text(mail!.jobKodu.toString()),
                                              value: mail.jobKodu,
                                            );
                                          }).toList() ?? [],
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("Şube Kodu "),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 22,
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
                                          hint: Text("Sube Kodu Seçiniz"),
                                          underline: Container(),
                                          value: selectedSubeKod,
                                          onChanged: (yeniMail) {
                                            setState(() {
                                              selectedSubeKod = yeniMail.toString();
                                              subeKoduController.text = selectedSubeKod.toString();
                                            });
                                          },
                                          items: subeList?.map((mail) {
                                            return DropdownMenuItem(
                                              child: Text("${mail!.subeKodu.toString()}"),
                                              value: mail.subeKodu,
                                            );
                                          }).toList() ?? [],
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Container(
                            height: 22,
                            child: ElevatedButton(onPressed: (){
                              getMail();
                            },child: Text("GETİR",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 14)),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300,)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Mail Listesi")),
              Container(
                height: 150,
                child: AdaptiveScrollbar(
                    controller: verticalScroll,
                    width: width,
                    scrollToClickDelta: 75,
                    // scrollToClickFirstDelay: 200,
                    scrollToClickOtherDelay: 50,
                    sliderDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    sliderActiveDecoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    underColor: Colors.transparent,

                    child: AdaptiveScrollbar(
                        underSpacing: EdgeInsets.only(bottom: width),//alttan scrool boşlugu
                        controller: horizontalScroll,
                        width: width,
                        position: ScrollbarPosition.bottom,
                        sliderDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(12.0))),//üzerine gelmeden önceki renk
                        sliderActiveDecoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.all(Radius.circular(12.0))),//hover olduktan soraki renk
                        underColor: Colors.transparent,//çubugun arkaplan rengi

                        child: SingleChildScrollView(
                            controller: horizontalScroll,
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black45
                                    ),
                                    color: Colors.white
                                ),width: 3000,
                                child: Scaffold(
                                  body: Container(
                                    color: Colors.white,
                                    child: ListView(
                                      padding: EdgeInsets.only(bottom: width),
                                      controller: verticalScroll,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: DataTable(
                                            columnSpacing: 0,
                                            dataRowHeight: 28,
                                            columns: [
                                              DataColumn(label: Padding(
                                                padding: const EdgeInsets.only(right:18.0),
                                                child: Text("ID"),
                                              )),
                                              DataColumn(label: Padding(
                                                padding: const EdgeInsets.only(right:236),
                                                child: Text("Trig Adı "),
                                              )),
                                              DataColumn(label: Text("Mailler")),

                                            ],rows: mailList.map((mail) {

                                            int? id = mail?.id;
                                            String? trigAdi = mail?.trig_adi;
                                            originalMail = mail?.mailListesi;
                                            //  print("originalMail: $originalMail");
                                            bool isSelected = selectedId == id;
                                            if(isSelected){
                                              print("originalMail son : $originalMail");
                                              selectedOrginalMail=originalMail;
                                              print("secili orjinal mail son: $selectedOrginalMail");
                                            }


                                            bool isGray=mailList.indexOf(mail) % 2 == 0;
                                            Color rowColor= isGray ? Colors.grey.shade200 :Colors.white;

                                            TextEditingController mailController = TextEditingController(text: "${mail?.mailListesi}");
                                            return DataRow(
                                              color: MaterialStateProperty.all(rowColor),
                                              cells: [
                                                DataCell(
                                                  Transform.scale(
                                                    scale:0.6,
                                                    child: Checkbox(
                                                      value: isSelected,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          isSelected = value ?? false;
                                                          if (isSelected) {
                                                            selectedId = id;
                                                            print("Seçilen id: $selectedId");
                                                          } else {
                                                            selectedId = null;
                                                            print("Seçim kaldırıldı");
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                DataCell(Container(width:290,child: Text(trigAdi ?? '',style: TextStyle(fontSize: 13.5),))),
                                                DataCell(
                                                  TextFormField(
                                                    controller: mailController,
                                                    onChanged: (yeniMail) {
                                                      mail?.mailListesi = yeniMail;
                                                      guncelMail = yeniMail;
                                                      print("guncel mail hali : $guncelMail");
                                                    },
                                                    style: TextStyle(fontSize: 13.5),
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        contentPadding: EdgeInsets.only(bottom: 20)
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),),
                                        ),
                                      ],
                                    ),),
                                ))))),
              ),
              SizedBox(height: 8,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text("Yedek Listesi")),
              Container(
                height: 150,
                child: AdaptiveScrollbar(
                    controller: verticalScroll2,
                    width: width,
                    scrollToClickDelta: 75,
                    // scrollToClickFirstDelay: 200,
                    scrollToClickOtherDelay: 50,
                    sliderDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    sliderActiveDecoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    underColor: Colors.transparent,

                    child: AdaptiveScrollbar(
                        underSpacing: EdgeInsets.only(bottom: width),//alttan scrool boşlugu
                        controller: horizontalScroll2,
                        width: width,
                        position: ScrollbarPosition.bottom,
                        sliderDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(12.0))),//üzerine gelmeden önceki renk
                        sliderActiveDecoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.all(Radius.circular(12.0))),//hover olduktan soraki renk
                        underColor: Colors.transparent,//çubugun arkaplan rengi


                        child: SingleChildScrollView(
                            controller: horizontalScroll2,
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                width: 3000,
                                child: Scaffold(
                                  body: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black45
                                          ),
                                          color: Colors.white
                                      ),
                                      child: ListView(
                                        padding: EdgeInsets.only(bottom: width),
                                        controller: verticalScroll2,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: DataTable(
                                              columnSpacing: 0,
                                              dataRowHeight: 28,
                                              columns: [
                                                DataColumn(label: Padding(
                                                  padding: const EdgeInsets.only(right:18.0),
                                                  child: Text("ID"),
                                                )),
                                                DataColumn(label: Padding(
                                                  padding: const EdgeInsets.only(right:236),
                                                  child: Text("Trig Adı "),
                                                )),
                                                DataColumn(label: Text("Yedek Mailler")),
                                              ],
                                              rows: mailList.map((mail) {
                                                int? id = mail?.id;
                                                String? trigAdi = mail?.trig_adi;
                                                originalYedekMail = mail?.yedek;
                                                //print("orjinal yedek: $originalYedekMail");
                                                bool isSelected = selectedId == id;

                                                if(isSelected){

                                                  print("orjinal yedekson: $originalYedekMail");
                                                  selectedOrginalYedek=originalYedekMail;
                                                  print("secili orjinal yedekson: $selectedOrginalYedek");

                                                }

                                                bool isGray=mailList.indexOf(mail) % 2 == 0;
                                                Color rowColor= isGray ? Colors.grey.shade200 :Colors.white;

                                                TextEditingController yedekController = TextEditingController(text: "${mail?.yedek}",);

                                                return DataRow(
                                                  color: MaterialStateProperty.all(rowColor),
                                                  cells: [
                                                    DataCell(
                                                      Transform.scale(
                                                        scale:0.6,
                                                        child: Checkbox(
                                                          value: isSelected,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              isSelected = value ?? false;
                                                              if (isSelected) {
                                                                selectedId = id;
                                                                print("Seçilen id: $selectedId");
                                                              } else {
                                                                selectedId = null;
                                                                print("Seçim kaldırıldı");
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(Container(width:290,child: Text(trigAdi ?? '',style: TextStyle(fontSize: 13.5),))),
                                                    DataCell(
                                                      TextField(
                                                        controller: yedekController,
                                                        onChanged: (yeniYedek) {
                                                          mail?.yedek = yeniYedek;
                                                          guncelYedek = yeniYedek;
                                                          print("guncelYedek hali : $guncelYedek");
                                                        },
                                                        style: TextStyle(fontSize: 13.5),
                                                        decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            contentPadding: EdgeInsets.only(bottom: 20)
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      )),
                                ))))),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: (){
                        if(selectedId==null){
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              title: Text("Uyarı"),
                              content: Text(" ID seçmeden güncelleme yapamazsınız"),
                              actions: [
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Tamam"))
                              ],
                            );
                          });
                        }else{
                          updateMail(selectedId,);
                          print(" seçili idddd  $selectedId ${guncelMail} ${guncelYedek} ");
                        }
                      },
                      child: Text("GÜNCELLE",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}