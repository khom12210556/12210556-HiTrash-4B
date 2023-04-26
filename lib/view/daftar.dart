import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hitrash/widget/buttondaftar.dart';
import 'package:hitrash/widget/textformglobal.dart';

class DaftarView extends StatefulWidget {
  @override
  _DaftarViewState createState() => _DaftarViewState();
}

class _DaftarViewState extends State<DaftarView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();

  bool isPenjemput = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/logocolor.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create Your Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //input nama lengkap
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormGlobal(
                  controller: nameController,
                  text: 'Full Name',
                  textInputType: TextInputType.name,
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormGlobal(
                  controller: nohpController,
                  text: 'Nomor HandPhone',
                  textInputType: TextInputType.phone,
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormGlobal(
                  controller: alamatController,
                  text: 'Alamat',
                  textInputType: TextInputType.text,
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormGlobal(
                  controller: kotaController,
                  text: 'Kota',
                  textInputType: TextInputType.text,
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(
                  height: 20,
                  //disini adalah opsi untuk memilih user sebagai apa
                  //baik sebagai penjemput atau costumer
                ),
                //penjemput
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Penjemput');
                          setState(() {
                            isPenjemput = true;
                          });
                        },
                        child: Penjemput(isPenjemput: isPenjemput),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      // Costumer
                      GestureDetector(
                        onTap: () {
                          print("Costumer");
                          setState(() {
                            isPenjemput = false;
                          });
                        },
                        child: Costumer(isPenjemput: isPenjemput),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const buttonDaftar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Costumer extends StatelessWidget {
  const Costumer({
    super.key,
    required this.isPenjemput,
  });

  final bool isPenjemput;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: isPenjemput
                ? Colors.transparent
                : Color.fromRGBO(0, 121, 191, 1),
            border: Border.all(
              width: 1,
              color: isPenjemput
                  ? Colors.black.withOpacity(0.3)
                  : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15),
            ],
          ),
          child: Icon(
            MaterialCommunityIcons.account_outline,
            color: isPenjemput ? Colors.black.withOpacity(0.3) : Colors.white,
          ),
        ),
        Text(
          'Costumer',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 17,
          ),
        )
      ],
    );
  }
}

class Penjemput extends StatelessWidget {
  const Penjemput({
    super.key,
    required this.isPenjemput,
  });

  final bool isPenjemput;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: isPenjemput
                ? Color.fromRGBO(0, 121, 191, 1)
                : Colors.transparent,
            border: Border.all(
              width: 1,
              color: isPenjemput
                  ? Colors.transparent
                  : Colors.black.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15),
            ],
          ),
          child: Icon(
            MaterialCommunityIcons.account_outline,
            color: isPenjemput ? Colors.white : Colors.black.withOpacity(0.3),
          ),
        ),
        Text(
          'Penjemput',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 17,
          ),
        )
      ],
    );
  }
}
