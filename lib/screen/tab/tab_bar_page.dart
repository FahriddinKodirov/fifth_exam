import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exam_five/bloc/connectivity/connectivity_cubit.dart';
import 'package:exam_five/bloc/connectivity/connectivity_state.dart';
import 'package:exam_five/screen/a/a.dart';
import 'package:exam_five/screen/b/b.dart';
import 'package:exam_five/screen/c/first_page.dart';
import 'package:exam_five/screen/d/d.dart';
import 'package:exam_five/screen/tab/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  _init() {
    print("internet yondi");
  }
  bool isTrue = true;

  int index = 0;
  final List _list = const [
    AaPage(),
    BbPage(),
    FirstPage(),
    AllUsersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoInternetPage(voidCallback: _init)));
        }
      },
      child: Scaffold(
        body: _list[index],
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(height: 1.6),
            selectedIconTheme: const IconThemeData(
                color: Color(0xFF53E88B),
                shadows: [Shadow(color: Colors.black, offset: Offset(4, 4))]),
            elevation: 8,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            fixedColor: Colors.black,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: 'Aaa'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.satellite_rounded,
                    size: 30,
                  ),
                  label: 'Bbb'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mail_lock_rounded,
                    size: 30,
                  ),
                  label: 'Ccc'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  label: 'Ddd'),
            ]),
      ),
    );
  }
}
