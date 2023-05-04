import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PesananWidget extends StatelessWidget {
  final DateTime tanggal;
  final TimeOfDay jam;
  final String alamat;
  final String nama;
  final String status;
  const PesananWidget(
      {super.key,
      required this.tanggal,
      required this.jam,
      required this.alamat,
      required this.status,
      required this.nama});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMMM yyyy');
    final timeFormat = TimeOfDayFormat.HH_colon_mm;
    return Container(
      width: 250,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 15,
              offset: Offset(3, 7))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanggal : ${dateFormat.format(tanggal)}'),
            SizedBox(
              height: 10,
            ),
            Text('Jam Mulai : ${jam.format(context)}'),
            SizedBox(
              height: 10,
            ),
            Text('Alamat : $alamat'),
            SizedBox(
              height: 10,
            ),
            Text('Pemesan : $nama'),
            SizedBox(
              height: 10,
            ),
            Text('Status : $status')
          ],
        ),
      ),
    );
  }
}
