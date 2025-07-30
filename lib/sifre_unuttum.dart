import 'dart:math';

import 'package:flutter/material.dart';

class SifreUnuttum extends StatefulWidget {
  const SifreUnuttum({super.key});

  @override
  State<SifreUnuttum> createState() => _SifreUnuttumState();
}

class _SifreUnuttumState extends State<SifreUnuttum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şifre Sıfırlama', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "serif"),),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Şifrenizi Sıfırlamak İçin E-posta Adresinizi Girin.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                
                decoration: InputDecoration(
                  hintText: 'E-posta Adresi',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Şifre sıfırlama işlemi
              },
              child: const Text('Şifre Sıfırla'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}