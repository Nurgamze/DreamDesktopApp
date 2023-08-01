import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class YeniKullanici extends StatefulWidget {
  final Size initialSize;
  const YeniKullanici({Key? key, required this.initialSize}) : super(key: key);

  @override
  State<YeniKullanici> createState() => _YeniKullaniciState();

  void eskiBoyutaDon() {
    var initialSize = Size(480, 400); // Eski boyutu burada belirleyin
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
  }
}

class _YeniKullaniciState extends State<YeniKullanici> {

  TextStyle buildTextStyle() =>  TextStyle(fontWeight: FontWeight.normal,fontSize: 11);

  bool isChecked1=false;
  bool isChecked2=false;
  bool isChecked3=false;
  bool isChecked4=false;
  bool isChecked5=false;
  bool isChecked6=false;
  bool isChecked7=false;
  bool isChecked8=false;
  bool isChecked9=false;
  bool isChecked10=false;
  bool isChecked11=false;
  bool isChecked12=false;
  bool isChecked13=false;
  bool isChecked14=false;
  bool isChecked15=false;



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
              width: 595,
              height: 435,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("                                                id",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 130,
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
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("                                              Ad",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 290,
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
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("                                         Soyad",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 290,
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
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("                                 Mail Adresi",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 290,
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
                      ],
                    ),SizedBox(height: 3,),

                    Row(
                      children: [
                        Text("                    LdapUser(User Kod",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 290,
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
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("                                            Şifre",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 4,),
                        Container(
                          height: 20,
                          width: 290,
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
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("                    Mikro User Kod(ID)",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 290,
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
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("    Mikro Personel Kod(TAM AD)",style: TextStyle(fontSize: 12),),
                        SizedBox(width: 5,),
                        Container(
                          height: 20,
                          width: 290,
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
                      ],
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height:10,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked1=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Özellik Ekranı (Yetkili)", style: buildTextStyle(),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked2=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Stok Açma Ekranı", style: buildTextStyle(),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height:10,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked3,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked3=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Farika Fiyatlarını Gör", style: buildTextStyle(),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height:25,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked4,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked4=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Is Ldap", style: buildTextStyle(),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height:25,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked5,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked5=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Aktif", style: buildTextStyle(),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height:25,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked6,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked6=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Süper Kullanıcı", style: buildTextStyle(),),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(width: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height:10,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked7,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked7=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Excel ve Mail", style: buildTextStyle(),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height:20,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked8,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked8=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Mimaki", style: buildTextStyle(),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height:20,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked9,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked9=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Fatura Kilitlerini Açabilir", style: buildTextStyle(),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height:20,
                                  child: Transform.scale(
                                    scale: 0.7,
                                    child: Checkbox(
                                      value: isChecked10,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked10=value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text("Extre Gönderimi Yapabilir", style: buildTextStyle(),),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top:45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(height: 75,),
                              Container(
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
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height:20,
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Checkbox(
                                        value: isChecked11,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked11=value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text("Bütçe Gerçekleşen Raporu", style: buildTextStyle(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:20,
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Checkbox(
                                        value: isChecked12,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked12=value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text("Kritik Kullanıcı (Özel Raporlara Tam Yetkili)", style: buildTextStyle(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:20,
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Checkbox(
                                        value: isChecked13,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked13=value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text("Ciro Raporu", style: buildTextStyle(),),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:20,
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Checkbox(
                                        value: isChecked14,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked14=value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text("Portföydeki Çekler Raporu", style: buildTextStyle()),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height:20,
                                    child: Transform.scale(
                                      scale: 0.7,
                                      child: Checkbox(
                                        value: isChecked15,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked15=value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text("Stok Satış Karlılık Raporu", style:buildTextStyle(),),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(height: 25,),
                              Container(
                                width: 100,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: (){ },
                                  child: Text("Firma Yetkileri",style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w400)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade100,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        side: BorderSide(color: Colors.black26, width: 1),
                                      )),),
                              ),
                              SizedBox(height: 8,),
                              Container(
                                width: 100,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: (){
                                   /*
                                   Navigator.push(context, MaterialPageRoute(builder: (context){
                                      var eskiboyut=HomePage();
                                      return eskiboyut;
                                    }));
                                    widget.eskiBoyutaDon();
                                    */
                                  },
                                  child: Text("KAYDET",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
