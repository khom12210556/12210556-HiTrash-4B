import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:hitrash/view/permintaanpenjemputan.dart';
import 'package:hitrash/widget/menubutton.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background1.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 80, left: 20),
                color: Color.fromRGBO(0, 121, 191, 1).withOpacity(.50),
                //
                // Disini Bio Pengguna
                //
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hallo,',
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow,
                        ),
                        children: [
                          TextSpan(
                            text: ' Muhammad Ronaldo',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.transparent)),
                          child: Icon(
                            MaterialCommunityIcons.email_outline,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'ronaldofixgoal@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.transparent)),
                          child: Icon(
                            MaterialCommunityIcons.account_outline,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Penjemput',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.transparent)),
                          child: Icon(
                            MaterialCommunityIcons.map_marker_outline,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Pontianak',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              letterSpacing: 1),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(0, 230, 0, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //
                    // Widget Menu
                    //
                    Expanded(
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PesananView()),
                              );
                            },
                            child: WidgetMenu(
                              logonya: 'assets/truck.png',
                              NamaMenu: 'Permintaan Penjemputan',
                              Subtitle: 'Periksa Permintaan Penjemputan Anda',
                            ),
                          ),
                          WidgetMenu(
                            logonya: 'assets/tipper.png',
                            NamaMenu: 'Permintaan Penjemputan',
                            Subtitle: 'Periksa Permintaan Penjemputan Anda',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
