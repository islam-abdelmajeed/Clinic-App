import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home_layout/home_layout.dart';

// ignore: must_be_immutable
class MainSplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SplashScreen(
        seconds: 2,
        title: Text('${getLang(context, 'Dr.Eman Abdel-Majeed')}',
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: defaultColor),
        ),
        navigateAfterSeconds:HomeLayout(),
        photoSize: 150.0,
        useLoader: false,
        loadingText:Text('     ${getLang(context, 'Dermatologist')}\n ${getLang(context, 'Ahla Al-Hoor Clinic')}',
        style: TextStyle(
          color: defaultColor,
          fontSize: 25,
        ),
        ),
        image: Image(
          image: AssetImage('assets/images/ahla.jpg',),
        ),
        backgroundColor: Colors.pink[50],
      )
    );
  }
}
