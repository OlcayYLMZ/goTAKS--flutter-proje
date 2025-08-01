import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Anasayfa extends StatefulWidget {
  final String userName;
  final String userSurname;
  final String userImage;
  
  const Anasayfa({super.key, required this.userName, required this.userSurname, required this.userImage});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _selectedIndex = 0;  
  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        return false; // Geri gitmeyi engelle
      },
      child: Scaffold(
        drawer: Drawer(
        child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(widget.userImage),
              ),
              SizedBox(height: 10),
              Text(
                '${widget.userName} ${widget.userSurname}',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.person, color: Colors.blue),
          title: Text('Profil'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.star, color: Colors.orange),
          title: Text('Premium'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.attach_money, color: Colors.green),
          title: Text('Gelir Elde Et'),
          onTap: () {},
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 400.0),
          child: ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Çıkış Yap'),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ),
        Divider(),
        Text("sürüm 1.0.0", style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
        ),
      ),
        appBar: AppBar(
          title: Text('GoTaksi',textAlign: TextAlign.center,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "serif"),),      
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,     
          centerTitle: true,   
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 8),
              CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    
                  ),
                  items: [
                    'images/slider1.png',
                    'images/slider2.jpg',
                    'images/slider3.png',
                    'images/slider4.png',
                  ].map((item) => Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    ),
                  )).toList(),
                ),
                SizedBox(height: 20),
                Text("ağam sen hoş gelmişsen"),
                
              ],
            ),
          ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa',),
            BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Yolculuklar'),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'QR Ödeme'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Cüzdan'),
          ],
        ),
      
      
      ),
    );
  }
}