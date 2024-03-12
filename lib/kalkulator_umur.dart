import 'package:flutter/material.dart';
import 'package:intl/intl.dart';// Mengimpor library intl untuk memformat tanggal
import 'hasil_kalkulasi.dart';// Mengimpor kelas FormDetail dari file form_detail.dart


class KalkulatorUmur extends StatefulWidget {
  const KalkulatorUmur({Key? key}) : super(key: key);// Konstruktor untuk FormDiri

  @override
  State<KalkulatorUmur> createState() => _KalkulatorUmurState();// Membuat state untuk widget ini
}

class _KalkulatorUmurState extends State<KalkulatorUmur> {// Mendefinisikan kelas State private untuk FormDiri
  // Membuat controller untuk text field nama dan tanggal lahir
  TextEditingController _namaController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();

  // Menginisialisasi tanggal yang dipilih dengan tanggal saat ini
  DateTime selectedDate = DateTime.now();

  // Mendefinisikan fungsi untuk memilih tanggal menggunakan date picker
  void _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1945), // Mengatur tanggal minimum menjadi tahun 1945
      lastDate: DateTime.now(), // Mengatur tanggal maksimum menjadi tanggal saat ini
    );

    if (selected != null && selected != selectedDate) { // Memastikan user memilih tanggal && memilih tanggal yang berbeda dari sebelumnya
      setState(() {
        selectedDate = selected; // Memperbarui variabel selectedDate
        _tglLahirController.text = DateFormat('dd/MM/yyyy').format(selectedDate); // Mengupdate teks pada tanggal lahir dengan tanggal yang baru dipilih.
      });
    }
  }

  @override
  Widget build(BuildContext context) { // Membuild UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Umur'), // Mengatur judul app bar
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10), // Padding kiri dan kanan sebesar 10
        child: Column(
          children: [
            _textboxNama(), // Menampilkan text field nama
            _textboxTglLahir(context, selectedDate), // Menampilkan text field tanggal lahir
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 16), // Padding atas sebesar 16
                child: _textboxButton(), // Menampilkan tombol submit
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textboxNama() { // Mendefinisikan fungsi private untuk membuat text field nama
    return TextField(
      decoration: InputDecoration(labelText: 'Nama'), // Mengatur label teks
      controller: _namaController, // Memanggil controller nama
    );
  }

  Widget _textboxTglLahir(BuildContext context, DateTime selectedDate) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Tgl. Lahir',
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
      controller: _tglLahirController,
      readOnly: true, // Membuat text field hanya dapat dibaca
    );
  }

  Widget _textboxButton() { // Mendefinisikan fungsi private untuk membuat tombol submit
    return ElevatedButton(
      onPressed: () { // Mendefinisikan aksi yang akan dilakukan saat tombol ditekan
        String nama = _namaController.text; // Mendapatkan nama dari text field
        String tglLahir = _tglLahirController.text; // Mendapatkan tanggal lahir dari text field
        String umur = calculateAge(tglLahir); // Menghitung umur berdasarkan tanggal lahir

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HasilKalkulasi(nama: nama, tglLahir: tglLahir, umur: umur), // Berpindah ke layar FormDetail dan meneruskan nama, tanggal lahir, dan umur
          ),
        );
      },
      child: Text('Hitung'), // Mengatur teks tombol
    );
  }

  String calculateAge(String dob) { // Mendefinisikan fungsi untuk menghitung umur berdasarkan tanggal lahir
    DateTime birthDate = DateFormat('dd/MM/yyyy').parse(dob); // Mengubah string tanggal lahir menjadi objek DateTime
    DateTime today = DateTime.now(); // Mendapatkan tanggal saat ini
    Duration age = today.difference(birthDate); // Menghitung selisih antara tanggal saat ini dan tanggal lahir

    int years = age.inDays ~/ 365; // Menghitung jumlah tahun
    int months = (age.inDays % 365) ~/ 30; // Menghitung jumlah bulan
    int days = (age.inDays % 365) % 30; // Menghitung jumlah hari

    return '$years tahun, $months bulan, $days hari'; // Mengembalikan umur dalam bentuk string dengan format "tahun tahun, bulan bulan, hari hari"
  }
}
