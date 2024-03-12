import 'package:flutter/material.dart';
import 'kalkulator_umur.dart'; // Mengimpor kelas KalkulatorUmur dari file kalkulator_umur.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Umur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KalkulatorUmur(), // Menampilkan KalkulatorUmur sebagai halaman utama
    );
  }
}