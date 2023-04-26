import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class socialLogin extends StatelessWidget {
  const socialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '--Or Sign In With--',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            print('Google');
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 214, 214),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/google.png',
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
