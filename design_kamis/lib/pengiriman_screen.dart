import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PengirimanScreen extends StatefulWidget {
  const PengirimanScreen({Key? key}) : super(key: key);

  @override
  _PengirimanScreenState createState() => _PengirimanScreenState();
}

class _PengirimanScreenState extends State<PengirimanScreen> {
  late String _hour, _minute, _time, _dateDb;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  var dateCtrl = TextEditingController();
  var timeCtrl = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1945),
        lastDate: DateTime(3000));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateDb = DateFormat('yyyy-MM-dd').format(selectedDate);
        dateCtrl.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ':' + _minute + ':' + '00';
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
          'Pengiriman',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: const Icon(
                                      Icons.maps_home_work_rounded,
                                      size: 50,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Tanggal Pengiriman',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            'Status Pengiriman',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'No Reservasi',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Nama Pabrik',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Jumlah Tonasi' + " kg",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Visibility(
                                              visible: true,
                                              replacement: SizedBox(
                                                width: 100,
                                              ),
                                              child: IconButton(
                                                  onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (_) => _openDialogQR(
                                                          context: context,
                                                          noRsv:
                                                              'Contoh No Reservasi')),
                                                  icon: Icon(
                                                    Icons.rocket_launch,
                                                    size: 48,
                                                    color: Colors.orange[700],
                                                  ))),
                                          Visibility(
                                              visible: true,
                                              replacement: SizedBox(
                                                width: 100,
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0))),
                                                    contentPadding:
                                                        EdgeInsets.only(),
                                                    content: Container(
                                                      width: 500.0,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10,
                                                                    right: 10,
                                                                    bottom:
                                                                        10.0,
                                                                    top: 10),
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20.0)),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Text(
                                                                  "Reschedule Pengiriman BTS",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                IconButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .close,
                                                                      size: 36,
                                                                      color: Colors
                                                                          .white,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    30),
                                                            child: Center(
                                                                child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    'Tanggal'),
                                                                TextFormField(
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          20),
                                                                  onTap: () =>
                                                                      _selectDate(
                                                                          context),
                                                                  controller:
                                                                      dateCtrl,
                                                                  readOnly:
                                                                      true,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    suffixIcon: IconButton(
                                                                        onPressed: () =>
                                                                            dateCtrl
                                                                                .clear(),
                                                                        icon: Icon(
                                                                            Icons.close)),
                                                                    hintText:
                                                                        '00/00/0000',
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(40))),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(
                                                                                40)),
                                                                        borderSide:
                                                                            BorderSide(color: Colors.grey)),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                const Text(
                                                                    'Jam'),
                                                                TextFormField(
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          20),
                                                                  onTap: () =>
                                                                      _selectTime(
                                                                          context),
                                                                  controller:
                                                                      timeCtrl,
                                                                  readOnly:
                                                                      true,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    suffixIcon: IconButton(
                                                                        onPressed: () =>
                                                                            timeCtrl
                                                                                .clear(),
                                                                        icon: Icon(
                                                                            Icons.close)),
                                                                    hintText:
                                                                        '00:00:00',
                                                                    border: const OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(40))),
                                                                    focusedBorder: const OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(
                                                                                40)),
                                                                        borderSide:
                                                                            BorderSide(color: Colors.grey)),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 16,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.orange,
                                                                          shape:
                                                                              new RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                new BorderRadius.circular(30.0),
                                                                          ),
                                                                        ),
                                                                        child: Text(
                                                                            'Tidak, Ubah')),
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          // var dateDB = _dateDb.toString() +
                                                                          //     " " +
                                                                          //     timeCtrl.text.toString();
                                                                          // viewModel.editJadwal(
                                                                          //     pengirimanIndex.noReservasi.toString(),
                                                                          //     dateDB.toString(),
                                                                          //     context);
                                                                          // print(dateDB);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.orange,
                                                                          shape:
                                                                              new RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                new BorderRadius.circular(30.0),
                                                                          ),
                                                                        ),
                                                                        child: Text(
                                                                            'Ya, Benar')),
                                                                  ],
                                                                ),
                                                              ],
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                child: Text('Jadwal Ulang'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.orange[700],
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(30.0),
                                                  ),
                                                ),
                                              )),
                                          Visibility(
                                            visible: false,
                                            replacement: SizedBox(
                                              width: 100,
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.green[700],
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(30.0),
                                                  ),
                                                ),
                                                child: Text('Kirim BTS')),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _showDialogJadwalUlang(
    {required BuildContext context,
    required Future<Null> selectDate,
    required Future<Null> selectTime,
    required String timeCtrl,
    required String dateCtrl}) {
  var dateCtrlr = TextEditingController();
  dateCtrlr.text = dateCtrl.toString();

  var timeCtrlr = TextEditingController();
  timeCtrlr.text = timeCtrl.toString();

  return AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    contentPadding: EdgeInsets.only(),
    content: Container(
      width: 500.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: 10, right: 10, bottom: 10.0, top: 10),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Reschedule Pengiriman BTS",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 36,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tanggal'),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  onTap: () => selectDate,
                  controller: dateCtrlr,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => dateCtrlr.clear(),
                        icon: Icon(Icons.close)),
                    hintText: '00/00/0000',
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
                const Text('Jam'),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  onTap: () => selectTime,
                  controller: timeCtrlr,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => timeCtrlr.clear(),
                        icon: Icon(Icons.close)),
                    hintText: '00:00:00',
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        child: Text('Tidak, Ubah')),
                    ElevatedButton(
                        onPressed: () {
                          // var dateDB = _dateDb.toString() +
                          //     " " +
                          //     timeCtrl.text.toString();
                          // viewModel.editJadwal(
                          //     pengirimanIndex.noReservasi.toString(),
                          //     dateDB.toString(),
                          //     context);
                          // print(dateDB);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text('Ya, Benar')),
                  ],
                ),
              ],
            )),
          ),
        ],
      ),
    ),
  );
}

Widget _openDialogQR({required BuildContext context, required String noRsv}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    contentPadding: EdgeInsets.only(),
    content: Container(
      width: 500.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: 10, right: 10, bottom: 10.0, top: 10),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Lihat QR",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 36,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Center(
                child: Column(
              children: [
                QrImage(
                  data: noRsv,
                  size: 200.0,
                ),
                Text(
                  noRsv,
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.orange),
                  child: Center(
                      child: InkWell(
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () => Navigator.pop(context),
                  )),
                ),
              ],
            )),
          ),
        ],
      ),
    ),
  );
}
