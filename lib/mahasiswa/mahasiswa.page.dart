import 'package:flutter/material.dart';
import 'package:flutter_muhamad_app_siakad/pages/profile/profile_page.dart';

import '../common/constants/colors.dart';
import '../common/constants/icons.dart';
import 'dashboard_page.dart';


class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//ini yang di tambah start nya
  final List<Widget> _pages = [
    const DashboardPage(),
    const Center(
      child: Text('Schedule'),
    ),
    const ProfilePage(
      role: 'Mahasiswa',
    ),
  ];
//ini end add nya
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex], ///////////// dan ini tambahnya
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ColorName.primary,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.chart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.profile),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
