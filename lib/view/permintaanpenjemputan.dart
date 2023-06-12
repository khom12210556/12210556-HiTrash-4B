import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitrash/view/dashboardPenjemput.dart';
import 'package:hitrash/view/ubahstatus.dart';
import 'package:hitrash/widget/pesanan.dart';

class PesananView extends StatelessWidget {
  const PesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0079BF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo dan icon
              //
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 2, 2, 2).withOpacity(0.1)),
                    child: InkWell(
                      onTap: () {
                        print('Back');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardView()),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  Image.asset(
                    'assets/loggo.png',
                    width: 200,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Permintaan Penjemputan',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        print('ubahstatus');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ubahStatus()));
                      },
                      child: PesananWidget(
                          tanggal: DateTime(2023, 5, 1),
                          jam: TimeOfDay(hour: 10, minute: 30),
                          alamat: 'jl. Karet Pontianak',
                          status: 'Baru',
                          nama: "Messi"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    PesananWidget(
                        tanggal: DateTime(2023, 5, 10),
                        jam: TimeOfDay(hour: 10, minute: 30),
                        alamat: 'jl. Karet Pontianak',
                        status: 'selesai',
                        nama: "Messi"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
