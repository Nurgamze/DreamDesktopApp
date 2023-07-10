import 'package:dream/screens/AdayCariler.dart';
import 'package:dream/screens/CarilerPage.dart';
import 'package:dream/screens/LojistikY%C3%B6netimi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_bar/menu_bar.dart';
import 'SatisPazarlamaPage.dart';
import 'StoklarPage.dart';
import 'CiroTablosuPage.dart';
import 'EkstreGonderimPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<BarButton> _menuBarButtons() {
    return [
      BarButton(
        text:  Text('Dosya', style: fontStyle(),),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () => print('Yönetim'),
              text:  Text('Yönetim', style: fontStyle(),),
              //shortcutText: 'Ctrl+S',
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Şifre Değiştir', style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Kişisel Tanımlar', style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Çıkış', style: fontStyle(),),
            ),
          ],
        ),
      ),
      BarButton(
        text:  Text('Modüller', style: fontStyle(),),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () {},
              text:  Text('Stok ve Siparişler',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Cariler',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Aday Cariler',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Satış Pazarlama',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Mimaki Cari Aktarım',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('İrsaliye Ftura Kilit Açma',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Zenit Üretim Takip',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Akbank Test',style: fontStyle(),),
            ),
            MenuButton(
              text:  Text('Zenit Stoklar Modülü',style: fontStyle(),),
              submenu: SubMenu(
                menuItems: [
                  MenuButton(
                    onTap: () {},
                    text:  Text('Stok Oluşturma ve Güncelleme',style: fontStyle(),),
                  ),
                  MenuButton(
                    onTap: () {},
                    text:  Text('Stok Grupları Tanımlama',style: fontStyle(),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      BarButton(
        text:  Text(' "Hesabım" Yönetimi',style: fontStyle(),),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () {},
              text:  Text('Müşteri Başvuruları',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Müşteri Hesapları',style: fontStyle(),),
            ),
          ],
        ),
      ),
      BarButton(
        text:  Text(' Yağız Çiftliği',style: fontStyle(),),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () {},
              text:  Text('Yağız Tartım İzleme',style: fontStyle(),),
            ),
            MenuButton(
              onTap: () {},
              text:  Text('Hayvan Tanımları',style: fontStyle(),),
            ),
          ],
        ),
      ),
    ];
  }

  TextStyle fontStyle() => TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 10);

  bool isExpanded = false;
  List<int> years = [2017, 2018, 2019, 2020, 2021, 2022, 2023];
  int selectedYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return MenuBarWidget(
        barButtons: _menuBarButtons(),
        barButtonStyle: const ButtonStyle(
          padding:
          MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8.0)),
          minimumSize: MaterialStatePropertyAll(Size(0.0, 30.0)),
        ),
        menuButtonStyle: const ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size.fromHeight(15.0)),
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0)),
        ),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ss.png'),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Row(
                    children: [
                      Text("MALİ YIL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      SizedBox(width: 25,),
                      //yıl seçme dropu yap
                      PopupMenuButton<int>(
                        onSelected: (int selected) {
                          setState(() {
                            selectedYear = selected;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return years.map((int year) {
                            return PopupMenuItem<int>(
                              value: year,
                              child: Container(
                                height: 20,
                                alignment: Alignment.center,
                                child: Text( year.toString(),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(2)
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("$selectedYear"),
                                SizedBox(width: 18,),
                                Icon(Icons.arrow_drop_down, color: Colors.grey.shade800),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 2.0,

                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StoklarPage(initialSize: Size(780,505))));
                                },
                                child: Container(
                                  width: 100,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Center(child: Text("STOKLAR",style: TextStyle(fontWeight: FontWeight.w500),)),
                                ),
                              ),
                              SizedBox(width: 7,),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CarilerPage(initialSize: Size(780,505))));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Center(child: Text("CARİLER",style: TextStyle(fontWeight: FontWeight.w500),)),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdayCarilerPage(initialSize: Size(780,505))));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Center(child: Text("  ADAY"+"\nCARİLER",style: TextStyle(fontWeight: FontWeight.w500),)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 7,),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SatisPazarlamaPage(initialSize: Size(780,505))));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Center(child: Text("      SATIŞ"+"\n PAZARLAMA",style: TextStyle(fontWeight: FontWeight.w500),)),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LojistikYonetimiPage(initialSize: Size(780,505))));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Center(child: Text("  LOJİSTİK"+"\nYÖNETİMİ",style: TextStyle(fontWeight: FontWeight.w500),)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 7,),
                              GestureDetector(
                                onTap:(){
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>FinansYonetimPage()));
                                },
                                child: Container(
                                  width: 100,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Center(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 7,),
                                          Text("  FİNANS"+"\nYÖNETİM"+"\nTABLOSU",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                          SizedBox(height: 10,),
                                          Text("(NAT)",style: TextStyle(fontWeight: FontWeight.bold),),
                                        ],
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text(" İŞ ZEKASI"+"\nRAPORLARI",style: TextStyle(fontWeight: FontWeight.w500),)),
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text("KULLANICI"+"\nYÖNETİMİ",style: TextStyle(fontWeight: FontWeight.w500),)),
                                  )
                                ],
                              ),
                              SizedBox(width: 7,),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CiroTablosuPage(initialSize: Size(605,395))));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(child: Text("   CİRO"+"\nTABLOSU",style: TextStyle(fontWeight: FontWeight.w500),)),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  GestureDetector(
                                    onTap: (){
                                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>EkstreGonderimPage(initialSize: Size(1005,605))));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(child: Text("  DÖVİZ"+"\nKURLARI",style: TextStyle(fontWeight: FontWeight.w500),)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 7,),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EkstreGonderimPage(initialSize: Size(950,590))));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(child: Text("    EKSTRE"+"\nGÖNDERİM",style: TextStyle(fontWeight: FontWeight.w800,fontStyle: FontStyle.italic),)),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text("     AÇIK"+"\nSİPARİŞLER",style: TextStyle(fontWeight: FontWeight.w500),)),
                                  )
                                ],
                              ),
                              SizedBox(width: 5,),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Center(child: Text("   ZİYARET"+"\nPLANLAMA",style: TextStyle(fontSize:8,fontWeight: FontWeight.w500),)),
                                      ),
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 55,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Center(child: Text("   SATIŞ"+"\nŞARTLARI",style: TextStyle(fontSize:8,fontWeight: FontWeight.w500),)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 114,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/vLogokopya.png'),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}