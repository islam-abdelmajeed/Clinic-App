import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/modules/drawer/drawer.dart';
import 'package:clinic_app/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${getLang(context, 'Dr.Eman Abdel-Majeed')}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
      ),
      body:HomeScreen(),

      drawer: DrawerScreen(),
      drawerScrimColor: Colors.pink.withOpacity(0.2),
    );
  }
}
