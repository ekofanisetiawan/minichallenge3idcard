import 'package:flutter/material.dart';

class IDCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // menggunakan MediaQuery untuk mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // mengembalikan scaffold yang membungkus OrientationBuilder
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (context, orientation) {
          // periksa orientasi dan metentukan tampilan yang sesuai
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(screenWidth, screenHeight,
                  context) // tambahkan context sebagai parameter
              : _buildLandscapeLayout(screenWidth, screenHeight,
                  context); // tambahkan context sebagai parameter
        },
      ),
    );
  }

  // widget tampilan portrait serta fungsi yang membangun tampilan portrait
  Widget _buildPortraitLayout(
      double screenWidth, double screenHeight, BuildContext context) {
    final backgroundHeight = screenWidth * 0.5;

// stack untuk mungkin widget ditumpuk
    return Stack(
      children: <Widget>[
        // container untuk background di bagian atas
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: backgroundHeight, // tinggi container
            color: Colors.grey[300], // warna container
          ),
        ),
        // positioned untuk menempatkan isi di bawah background
        Positioned(
          top: backgroundHeight - 90.0, // jarak dari atas ke isi yang lain
          left: 0,
          right: 0,
          // column untuk menata elemen secara vertikal
          child: Column(
            children: <Widget>[
              SizedBox(height: 2),
              CircleAvatar(
                backgroundImage: AssetImage('assets/man1.jpg'),
                radius: 90.0,
              ),
              SizedBox(height: 15),
              Text(
                'Ganesa Max Welbar',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                'Sales Manager',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              _buildInfoColumn('ID No.', '1223334444', context),
              _buildLine(screenWidth, context),
              _buildInfoColumn('E-mail', 'ganesamaxwelbar1@gmail.com', context),
              _buildLine(screenWidth, context),
              _buildInfoColumn('Phone', '+24929374192', context),
              _buildLine(screenWidth, context),
              SizedBox(height: 40),
              Image.asset('assets/ttd2.png', scale: 2.0),
              SizedBox(height: 16),
              Image.asset('assets/barcode2.png', scale: 2.0),
            ],
          ),
        ),
      ],
    );
  }

  // widget tampilan landscape serta fungsi yang membangun tampilan landscape
  Widget _buildLandscapeLayout(
      double screenWidth, double screenHeight, BuildContext context) {
    double avatarSize = screenWidth * 0.10; // ukuran avatar yang disesuaikan
    double imageSize = screenWidth *
        0.20; // Ukuran gambar tanda tangan dan barcode yang disesuaikan
    // tinggi container yang ingin di set
    double backgroundHeight = screenHeight * 0.5; // setengah dari tinggi layar

// SingleChildScrollView memungkinkan isi scrollable jika lebih besar dari layar
    return SingleChildScrollView(
      child: Stack(
        // menggunakan Stack untuk overlay widgets
        children: <Widget>[
          // container abu-abu yang berada di belakang avatar
          Positioned(
            top: 0, // atur jarak dari atas
            left: 0,
            right: 0,
            child: Container(
              height: backgroundHeight, // setengah dari tinggi layar
              color: Colors.grey[300], // warna abu-abu
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05), // padding kiri untuk seluruh Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: backgroundHeight /
                            2), // setengah dari container abu-abu
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/man1.jpg'),
                      radius: avatarSize,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ganesa Max Welbar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.030,
                      ),
                    ),
                    Text(
                      'Sales Manager',
                      style: TextStyle(
                        fontSize: screenWidth * 0.030,
                      ),
                    ),
                    SizedBox(height: 5),
                    Image.asset('assets/ttd2.png', width: imageSize),
                    SizedBox(height: 10),
                    Image.asset('assets/barcode2.png', width: imageSize),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05), // jarak antar elemen
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.05,
                        top: backgroundHeight / 2 +
                            98), // Top padding disetengahkan dari container abu-abu
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildInfoColumn('ID No.', '1223334444', context),
                        _buildLine(screenWidth, context),
                        _buildInfoColumn(
                            'E-mail', 'ganesamaxwelbar1@gmail.com', context),
                        _buildLine(screenWidth, context),
                        _buildInfoColumn('Phone', '+24929374192', context),
                        _buildLine(screenWidth, context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// widget garis pemisah
  Widget _buildLine(double screenWidth, BuildContext context,
      {double widthFactor = 0.7}) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

// container untuk garis pemisah
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: isPortrait ? screenWidth * widthFactor : screenWidth,
      height: 1,
      color: Color.fromARGB(255, 167, 167, 167),
    );
  }

// widget kolom informasi
  Widget _buildInfoColumn(String label, String value, BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    double fontSize =
        isPortrait ? 12 : 15; // Mengatur ukuran font berdasarkan orientasi

// padding widget kolom informasi
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment:
            isPortrait ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: fontSize, // variabel fontSize digunakan di sini
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: fontSize, // dan juga di sini
            ),
          ),
        ],
      ),
    );
  }
}
