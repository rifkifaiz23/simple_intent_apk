import 'package:flutter/material.dart'; // Mengimpor library Material Design untuk Flutter

class HasilKalkulasi extends StatelessWidget { // Mendefinisikan StatelessWidget bernama FormDetail
  final String nama; // Deklarasi variabel nama
  final String tglLahir; // Deklarasi variabel tanggal lahir
  final String umur; // Deklarasi variabel umur

  const HasilKalkulasi({Key? key, required this.nama, required this.tglLahir, required this.umur})
      : super(key: key); // Konstruktor untuk FormDetail dengan parameter nama, tanggal lahir, dan umur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Kalkulasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16), // Memberikan padding sebesar 16 di semua sisi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama : $nama",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Tanggal Lahir : $tglLahir",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Umur : $umur",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
