import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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