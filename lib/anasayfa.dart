import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  final String userName;
  final String userSurname;
  final String userImage;
  
  const Anasayfa({super.key, required this.userName, required this.userSurname, required this.userImage});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          leading: Icon(Icons.arrow_forward, color: Colors.green),
          title: Text('Çıkış Yap'),
          onTap: () {},
        ),
      ),
    ],
  ),
),
      appBar: AppBar(
        title: Text('Anasayfa', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "serif"),),      
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,        
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}