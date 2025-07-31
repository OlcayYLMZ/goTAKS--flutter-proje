import 'package:flutter/material.dart';
import 'package:uber/anasayfa.dart';
import 'package:uber/kay%C4%B1t.dart';
import 'package:uber/sifre_unuttum.dart';
import 'package:flutter/services.dart'; // Asset dosyası okumak için
import 'dart:convert'; // JSON string'i objeye çevirmek için

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var ad=TextEditingController();
  var sifre=TextEditingController();
  
  Future<Map<String, dynamic>?> giriskontrol(String ad, String sifre) async {
    try {
      var okunanVeri=await rootBundle.loadString("json/kisiler.json"); // JSON dosyasını oku
      var jsonveri=jsonDecode(okunanVeri); // okunan veriyi jsona çevirdik

      var kisiler=jsonveri["kisiler"]; // "kisiler" listesini al

      for (var kisi in kisiler)
{
        if (kisi["ad"]== ad && kisi["Şifre"] == sifre) {
          return kisi; // Kullanıcı adı ve şifre eşleşirse kullanıcı bilgilerini döner
        }
      }
      return null;
    } catch (e) {
      print("Hata: $e");
    }
    return null; // Kullanıcı adı ve şifre eşleşmezse null döner
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: const Text('GoTAKSİ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "serif"),),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo resmi eklendi
            Image.asset(
              'images/uber.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text("Oturum Aç", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
            const SizedBox(height: 40),
            Card(
  elevation: 8,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  child: TextField(
    controller: ad,
    decoration: InputDecoration(
      hintText: 'Kullanıcı Adı',
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(16),
    ),
  ),
),
            const SizedBox(height: 20),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: sifre,
                decoration: InputDecoration(
                  hintText: 'Şifre',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              
            ),
          
            const SizedBox(height: 20),
            // Giriş yap butonu
            ElevatedButton(
  onPressed: ()async{// Boş alan kontrolü
if (ad.text.isEmpty || sifre.text.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Lütfen tüm alanları doldurun!')),
  );
  return; // Durur, devam etmez
}
  // JSON'dan kontrol et
    Map<String, dynamic>? kullaniciVeri = await giriskontrol(ad.text, sifre.text);
   if (kullaniciVeri != null) {
  // Kullanıcı bilgilerini çıkar
  String userName = kullaniciVeri["ad"];
  String userSurname = kullaniciVeri["soyad"];
  String userImage = kullaniciVeri["resim"];
  
  // Başarılı giriş - Anasayfaya git
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => Anasayfa(userName: userName, userSurname: userSurname, userImage: userImage)
  ));
} else {
  // Başarısız giriş - Hata mesajı göster
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Bilgileriniz yanlıştır'),
      backgroundColor: Colors.red,
    ),
  );
}
    
  },
  child: Text("Giriş Yap"),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,      // Arka plan rengi
    foregroundColor: Colors.white,     // Yazı rengi
    elevation: 10,                     // Gölge yüksekliği
    shadowColor: Colors.grey,          // Gölge rengi
    shape: RoundedRectangleBorder(     // Şekil
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(     // İç boşluk
      horizontal: 50, 
      vertical: 15
    ),
  ),
),
            const SizedBox(height: 20),

            //kayıt ol butonu
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Kayit()));
            }, child: Text("Kayıt Ol"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,      // Arka plan rengi
                foregroundColor: Colors.white,     // Yazı rengi
                elevation: 10,                     // Gölge yüksekliği
                shadowColor: Colors.grey,          // Gölge rengi
                shape: RoundedRectangleBorder(     // Şekil
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(     // İç boşluk
                  horizontal: 50, 
                  vertical: 15
                ),
              ),
            ),

            const SizedBox(height: 20,),
            // Şifremi unuttum butonu
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SifreUnuttum()),
                );
              },
              child: Text("Şifremi Unuttum?", style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}

