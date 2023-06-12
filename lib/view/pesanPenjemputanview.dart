import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitrash/view/mapview.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PesanView extends StatefulWidget {
  final LatLng? selectedLocation;
  PesanView({Key? key, this.selectedLocation}) : super(key: key);

  @override
  State<PesanView> createState() => _PesanViewState();
}

class _PesanViewState extends State<PesanView> {
  TextEditingController lokasiAndaController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController datetimeinput = TextEditingController();
  String _pilihJam = DateFormat("hh:mm a").format(DateTime.now()).toString();
  @override
  void initState() {
    // TODO: implement initState
    datetimeinput.text = "";

    super.initState();
    if (widget.selectedLocation != null) {
      updateLokasiAnda(widget.selectedLocation!);

    }
  }

  void updateLokasiAnda(LatLng location) {
  setState(() {
    String latitude = location.latitude.toString();
    String longitude = location.longitude.toString();
    String lokasiAnda = "$latitude, $longitude";
    lokasiAndaController.text = lokasiAnda;
  });
}


  Future<String?> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        _pilihJam = selectedTime.format(context);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _Logo(),
              const SizedBox(
                height: 60,
              ),
              _TextJudul(),
              SizedBox(
                height: 20,
              ),
              _tittleWaktu(),
              _FormWaktu(context),
              SizedBox(
                height: 0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20, left: 10),
                  child: Text(
                    'Alamat Penjemputan',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 330,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Alamat",
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          hintStyle: const TextStyle(
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Pindah ke halaman baru saat container diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapView(
                            onLocationSelected: (location) {
                              updateLokasiAnda(location);
                            },
                          ),
                        ),
                      ).then((value) {});
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.map,
                              color: Color.fromARGB(255, 14, 202, 0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Pilih Lokasi",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 0, bottom: 5),
                      child: TextFormField(
                        controller: lokasiAndaController,
                        decoration: InputDecoration(
                          hintText: "Lokasi anda",
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          hintStyle: const TextStyle(
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  Row _FormWaktu(BuildContext context) {
    return Row(
      children: [
        Container(
// disini isinya untuk input tanggal
//
//disini isinya untuk input tanggal
          height: 55,
          width: 170,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
            child: TextFormField(
              controller: datetimeinput,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: "Pilih Tanggal",
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0),
                hintStyle: const TextStyle(
                  height: 1,
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  String formatDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  setState(() {
                    datetimeinput.text = formatDate;
                    print(formatDate);
                  });
                } else {
                  print('Tanggal Tidak Dipilih');
                  datetimeinput.text = '';
                }
              },
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
//disini isinya untuk input jam
//
//disini isinya untuk input jam
        Container(
          height: 55,
          width: 150,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
              )
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
              child: TextFormField(
                controller: TextEditingController(text: _pilihJam),
                decoration: InputDecoration(
                  icon: Icon(Icons.access_time),
                  hintText: "Pilih Waktu",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: const TextStyle(
                    height: 1,
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (pickedTime != null) {
                    String formatTime = pickedTime.format(context);
                    setState(() {
                      _pilihJam = formatTime;
                      print(formatTime);
                    });
                  } else {
                    print('Jam tidak Dipilih');
                    _pilihJam = '';
                  }
                  ;
                },
              )),
        ),
      ],
    );
  }

  Align _TextJudul() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Isi Data Penjemputan',
        style: TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }

  Image _Logo() {
    return Image.asset(
      'assets/logocolor.png',
      width: 200,
    );
  }
}

class _tittleWaktu extends StatelessWidget {
  const _tittleWaktu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 20, left: 10),
        child: Text(
          'Waktu Penjemputan',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
