import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/home_screen.dart';

import 'home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.downToUp,
      //transitionDuration: const Duration(milliseconds: 250),
      locale: const Locale('en'),
       home: HomeMainScreen(),
    ),
  );
}

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({Key key}) : super(key: key);

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      initState: (state) async {
      },
      builder: (con) {
        return Scaffold(
          body:  Container(
              child: _widgetOptions.elementAt(con.selectedIndex.value),
            ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home,color:Colors.red),
                  icon: Icon(Icons.home,color: Colors.white,),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.search,color:Colors.red),
                  icon: Icon(Icons.search,color: Colors.white,),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite,color:Colors.red),
                  icon: Icon(Icons.favorite_border,color: Colors.white,),
                  label: ""),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.person_outline_outlined,color:Colors.red),
                icon: Icon(Icons.person,color: Colors.white,),
                label: "",
              ),
            ],
            currentIndex: con.selectedIndex.value,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            onTap: (index) {
              con.onItemTapped(index);
            },
          ),
        );
      },
    );
  }
}

