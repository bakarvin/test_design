import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({Key? key}) : super(key: key);

  @override
  _TransaksiScreenState createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  //ini data
  // double hargaDb = 1234;

  //ini format
  // final formarCurrency = NumberFormat.currency(locale: 'ID', decimalDigits: 3);

  //set data ke format
  // var hargaUi = formarCurrency.format(hargaDb);

  //dijadiin 1
  final harga =
      NumberFormat.currency(locale: 'ID', decimalDigits: 3).format(12340000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Daftar PKs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Icon(
                                            Icons.maps_home_work_rounded,
                                            size: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'kuota ',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'kuota dari DB',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  ' kg',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              harga,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'kuota terisi ',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Kuota terisi DB',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  ' / ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'Kuota DB',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  ' kg',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            'Nama Pabrik DB',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        KirimPersediaanScreen(
                                                            pabrikId:
                                                                'Pabrik Id',
                                                            pabrikNama:
                                                                'Pabrik Nama'))),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.orange[700],
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0),
                                              ),
                                            ),
                                            child: Text('Kirim BTS'))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class KirimPersediaanScreen extends StatefulWidget {
  final pabrikId;
  final pabrikNama;
  const KirimPersediaanScreen({Key? key, this.pabrikId, this.pabrikNama})
      : super(key: key);

  @override
  _KirimPersediaanScreenState createState() => _KirimPersediaanScreenState();
}

class _KirimPersediaanScreenState extends State<KirimPersediaanScreen> {
  late String _hour, _minute, _time, _dateDb, _timeDB;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  var dateCtrl = TextEditingController();
  var tonasiCtrl = TextEditingController();
  var timeCtrl = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1945),
        lastDate: DateTime(9999));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        //ini buat masukin ke database
        //manggil DateFormat dengan custom format 'yyyy-MM-dd' yang di format itu selectedDate
        _timeDB = DateFormat('yyyy-MM-dd').format(selectedDate);
        // buat di tampilan
        //manggil dateformat dengan format ymd yang di format itu selectedDate
        dateCtrl.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        //dipake buat nampillin jam yang kita dipilih
        _hour = selectedTime.hour.toString();
        //dipake buat nampilin menit yang kita piih
        _minute = selectedTime.minute.toString();
        //time berguna untuk menyatukan jam dan menit yang dipili
        _time = _hour + ':' + _minute + ':' + '00';
        //menampilkan time kedalam textformfield
        timeCtrl.text = _time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Nama Pabrik',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama PKS',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    initialValue: 'Nama Pabrik',
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tanggal Pengiriman',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' *',
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              style: TextStyle(fontSize: 20),
                              onTap: () => _selectDate(context),
                              controller: dateCtrl,
                              readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.black,
                                ),
                                hintText: 'DD/MM/YYYY',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Jam Pengiriman',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' *',
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              style: TextStyle(fontSize: 20),
                              onTap: () => _selectTime(context),
                              controller: timeCtrl,
                              readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.expand_more,
                                  color: Colors.black,
                                ),
                                hintText: 'HH:MM',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Estimasi Tonasi TBS (/Kg)',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    controller: tonasiCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('Batal')),
                  ElevatedButton(
                      onPressed: () {
                        var dateDB = _dateDb + " " + timeCtrl.text;
                        // viewModel.kirimPersediaan(
                        //   widget.pabrikId.toString(),
                        //   dateDB.toString(),
                        //   tonasiCtrl.text.toString(),
                        // );

                        print(tonasiCtrl.text +
                            " " +
                            " " +
                            'Pabrik Id' +
                            " " +
                            " " +
                            dateDB);
                        // viewModel.kirimPersediaan(tonasiCtrl.text, widget.pabrikId, tglPengiriman)
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('Kirim')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
