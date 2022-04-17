import 'package:design_kamis/kirim_persediaan_screen.dart';
import 'package:design_kamis/pengiriman_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedNavBar = 0;
  final List _widgetOption = [
    TransaksiScreen(),
    PengirimanScreen(),
  ];
  void _changeSelectedNavbar(int index) {
    setState(() {
      _selectedNavBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedNavBar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Transaksi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.child_friendly), label: 'Pengiriman'),
        ],
        currentIndex: _selectedNavBar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _changeSelectedNavbar,
      ),
    );
  }
}
