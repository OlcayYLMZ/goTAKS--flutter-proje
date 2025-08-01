import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Anasayfa extends StatefulWidget {
  final String userName;
  final String userSurname;
  final String userImage;

  const Anasayfa({
    super.key,
    required this.userName,
    required this.userSurname,
    required this.userImage,
  });

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> locations = [
    {
      'name': 'Taksim Meydanı',
      'lat': 41.0369,
      'lng': 28.9847,
      'type': 'square',
      'driver': 'Mehmet Yılmaz',
      'time': '08:30',
    },
    {
      'name': 'Galata Kulesi',
      'lat': 41.0256,
      'lng': 28.9744,
      'type': 'tower',
      'driver': 'Ali Demir',
      'time': '09:15',
    },
    {
      'name': 'Sultanahmet',
      'lat': 41.0054,
      'lng': 28.9768,
      'type': 'mosque',
      'driver': 'Ahmet Kaya',
      'time': '10:45',
    },
    {
      'name': 'Kapalıçarşı',
      'lat': 41.0106,
      'lng': 28.9681,
      'type': 'market',
      'driver': 'Hasan Özkan',
      'time': '11:20',
    },
    {
      'name': 'Beyazıt Meydanı',
      'lat': 41.0101,
      'lng': 28.9638,
      'type': 'square',
      'driver': 'Mustafa Şen',
      'time': '12:00',
    },
    {
      'name': 'Çamlıca Tepesi',
      'lat': 41.0295,
      'lng': 29.0555,
      'type': 'hill',
      'driver': 'Okan Yıldız',
      'time': '13:30',
    },
    {
      'name': 'Kadıköy Çarşısı',
      'lat': 40.9915,
      'lng': 29.0272,
      'type': 'market',
      'driver': 'Serkan Avcı',
      'time': '14:15',
    },
    {
      'name': 'Moda Sahili',
      'lat': 40.9820,
      'lng': 29.0250,
      'type': 'beach',
      'driver': 'Kemal Arslan',
      'time': '15:00',
    },
    {
      'name': 'Ortaköy Camii',
      'lat': 41.0359,
      'lng': 29.0206,
      'type': 'mosque',
      'driver': 'Erkan Polat',
      'time': '16:20',
    },
    {
      'name': 'Emirgan Korusu',
      'lat': 41.1081,
      'lng': 29.0364,
      'type': 'park',
      'driver': 'Cem Öztürk',
      'time': '17:45',
    },
    {
      'name': 'Maiden\'s Tower',
      'lat': 41.0210,
      'lng': 29.0084,
      'type': 'tower',
      'driver': 'İbrahim Çelik',
      'time': '08:00',
    },
    {
      'name': 'Büyükada',
      'lat': 40.8552,
      'lng': 29.1206,
      'type': 'island',
      'driver': 'Murat Şahin',
      'time': '09:30',
    },
    {
      'name': 'Kız Kulesi',
      'lat': 41.0210,
      'lng': 29.0084,
      'type': 'tower',
      'driver': 'Fatih Koç',
      'time': '10:15',
    },
    {
      'name': 'Fenerbahçe Parkı',
      'lat': 40.9641,
      'lng': 29.0423,
      'type': 'park',
      'driver': 'Burak Yıldırım',
      'time': '11:45',
    },
    {
      'name': 'Yıldız Parkı',
      'lat': 41.0450,
      'lng': 29.0050,
      'type': 'park',
      'driver': 'Özkan Tekin',
      'time': '12:30',
    },
    {
      'name': 'Bebek Parkı',
      'lat': 41.0600,
      'lng': 29.0400,
      'type': 'park',
      'driver': 'Taner Yılmaz',
      'time': '13:00',
    },
    {
      'name': 'Sarıyer Sahili',
      'lat': 41.1625,
      'lng': 29.0500,
      'type': 'beach',
      'driver': 'Gökhan Aktaş',
      'time': '14:30',
    },
    {
      'name': 'Çengelköy',
      'lat': 41.0425,
      'lng': 29.0525,
      'type': 'neighborhood',
      'driver': 'Emre Bayram',
      'time': '15:15',
    },
    {
      'name': 'Bostancı Sahili',
      'lat': 40.9915,
      'lng': 29.0272,
      'type': 'beach',
      'driver': 'Selim Karaca',
      'time': '16:00',
    },
    {
      'name': 'Kuzguncuk',
      'lat': 41.0369,
      'lng': 29.0206,
      'type': 'neighborhood',
      'driver': 'Barış Turan',
      'time': '17:20',
    },
    {
      'name': 'Balat',
      'lat': 41.0256,
      'lng': 28.9744,
      'type': 'neighborhood',
      'driver': 'Volkan Aydın',
      'time': '08:45',
    },
    {
      'name': 'Eyüp Sultan Camii',
      'lat': 41.0419,
      'lng': 28.9368,
      'type': 'mosque',
      'driver': 'Ramazan Kurt',
      'time': '09:00',
    },
    {
      'name': 'Pierre Loti Tepesi',
      'lat': 41.0425,
      'lng': 28.9361,
      'type': 'hill',
      'driver': 'Yasin Güneş',
      'time': '10:30',
    },
    {
      'name': 'Kuzguncuk Çarşısı',
      'lat': 41.0369,
      'lng': 29.0206,
      'type': 'market',
      'driver': 'Caner Özer',
      'time': '11:15',
    },
    {
      'name': 'Moda Çay Bahçesi',
      'lat': 40.9820,
      'lng': 29.0250,
      'type': 'cafe',
      'driver': 'Deniz Kara',
      'time': '12:45',
    },
    {
      'name': 'Büyük Çamlıca Camii',
      'lat': 41.0295,
      'lng': 29.0555,
      'type': 'mosque',
      'driver': 'Halil Doğan',
      'time': '13:15',
    },
    {
      'name': 'Sultanahmet Meydanı',
      'lat': 41.0054,
      'lng': 28.9768,
      'type': 'square',
      'driver': 'Orhan Yavuz',
      'time': '14:00',
    },
    {
      'name': 'Taksim Gezi Parkı',
      'lat': 41.0369,
      'lng': 28.9847,
      'type': 'park',
      'driver': 'Kaan Erdoğan',
      'time': '15:30',
    },
    {
      'name': 'Karaköy',
      'lat': 41.0256,
      'lng': 28.9744,
      'type': 'neighborhood',
      'driver': 'Sinan Bulut',
      'time': '16:45',
    },
    {
      'name': 'Beyoğlu',
      'lat': 41.0369,
      'lng': 28.9847,
      'type': 'neighborhood',
      'driver': 'Uğur Çiftçi',
      'time': '17:00',
    },
    {
      'name': 'Beşiktaş Çarşısı',
      'lat': 41.0450,
      'lng': 29.0050,
      'type': 'market',
      'driver': 'Tolga Aslan',
      'time': '18:15',
    },
  ];

  void _showTaxiInfo(BuildContext context, Map<String, dynamic> location) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.local_taxi, color: Colors.orange, size: 28),
              SizedBox(width: 10),
              Text(
                'Taksi Bilgileri',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: Container(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(Icons.location_on, 'Konum', location['name']),
                SizedBox(height: 12),
                _buildInfoRow(Icons.access_time, 'Saat', location['time']),
                SizedBox(height: 12),
                _buildInfoRow(Icons.person, 'Şöför', location['driver']),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Kapat',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${location['driver']} ile bağlantı kuruluyor...',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Çağır', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        SizedBox(width: 10),
        Text(
          '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMarker(
    String type,
    Map<String, dynamic> location,
    BuildContext context,
  ) {
    IconData icon;
    Color color;

    switch (type) {
      case 'square':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.blue;
        break;
      case 'tower':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.purple;
        break;
      case 'mosque':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.green;
        break;
      case 'market':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.orange;
        break;
      case 'park':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.lightGreen;
        break;
      case 'beach':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.cyan;
        break;
      case 'hill':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.brown;
        break;
      case 'island':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.teal;
        break;
      case 'neighborhood':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.indigo;
        break;
      case 'cafe':
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.amber;
        break;
      default:
        icon = Icons.local_taxi; // Taksi ikonu
        color = Colors.red;
    }

    return GestureDetector(
      onTap: () {
        _showTaxiInfo(context, location);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }

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
                //sol taraf açılan menü. Listtile lar ise menü öğelerini temsil eder.
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Profil'),
                onTap: () {},
              ),
              Divider(), // Divider çizgisi ekler.
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
              Text(
                "sürüm 1.0.0",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            'GoTaksi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "serif",
            ),
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 8),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                items:
                    [
                          'images/slider1.png',
                          'images/slider2.jpg',
                          'images/slider3.png',
                          'images/slider4.png',
                        ]
                        .map(
                          (item) => Container(
                            margin: EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 1000.0,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
              SizedBox(height: 10),
              Text(
                "Hızlı ve Güvenli Ulaşım",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 214, 136, 19),
                ),
              ),
              SizedBox(height: 10),

              Container(
                //harita
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                        41.0082,
                        28.9784,
                      ), // İstanbul koordinatları
                      zoom: 13.0, // Zoom seviyesi
                      minZoom: 10.0, // Minimum zoom
                      maxZoom: 18.0, // Maximum zoom
                      // Dokunma ve zoom ayarları
                      enableMultiFingerGestureRace:
                          true, // Çoklu parmak desteği
                      enableScrollWheel: true, // Mouse scroll wheel desteği
                      scrollWheelVelocity: 0.005, // Scroll hassasiyeti
                      interactiveFlags:
                          InteractiveFlag.all, // Tüm etkileşimler aktif
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.uber',
                      ),
                      MarkerLayer(
                        markers:
                            locations
                                .map(
                                  (location) => Marker(
                                    point: LatLng(
                                      location['lat'],
                                      location['lng'],
                                    ),
                                    builder:
                                        (ctx) => _buildMarker(
                                          location['type'],
                                          location,
                                          context,
                                        ),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
              ),
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: 'Yolculuklar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'QR Ödeme',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Cüzdan',
            ),
          ],
        ),
      ),
    );
  }
}
