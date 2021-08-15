import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/main.dart';
import 'package:clinic_app/modules/home/appointment_screen/appointment_screen.dart';
import 'package:clinic_app/modules/onboarding_screen/onboarding_screen.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_doctor/about_doctor.dart';

// ignore: must_be_immutable
class DrawerScreen extends StatelessWidget {

  List<String> url =[
    "tel://+201093921300",
    "https://www.facebook.com/%D8%B9%D9%8A%D8%A7%D8%AF%D9%87-%D8%AF%D8%A7%D9%8A%D9%85%D8%A7%D9%86-%D8%B9%D8%A8%D8%AF-%D8%A7%D9%84%D9%85%D8%AC%D9%8A%D8%AF-302528976892792",
    "whatsapp://send?phone= +201093921300",
    "https://www.instagram.com/dr_eman_clinic"
  ];

  @override
  Widget build(BuildContext context) {
        return Drawer(
          child: Container(
            width: double.infinity,
            color: Colors.pink[50],
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/ahla.jpg'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${getLang(context, 'Ahla Al-Hoor Clinic')}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: defaultColor,
                    ),
                  ),
                  Divider(
                    height: 30,
                    color: Colors.black,
                    endIndent: 30.0,
                    indent: 30.0,
                  ),
                  drawerItems(icon: Icons.account_box_outlined, function: () {navigateTo(context, AboutDoctor());}, text: '${getLang(context, 'About Dr.Eman Abdelmajeed')}',),
                  myDivider(),
                  drawerItems(icon: Icons.timer, function: ()=>navigateTo(context, AppointmentScreen()), text: '${getLang(context, 'Make an appointment')}',),
                  myDivider(),
                  drawerItems(icon: Icons.language_outlined, function: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        title: Text('${getLang(context, 'changeLang')}'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultButton(function: (){
                              MyApp.of(context).setLocale(Locale('ar'));
                              Navigator.pop(context);
                            }, text: 'اللغة العربية',height: 50,radius: 30,background: defaultColor),
                            SizedBox(height: 20,),
                            defaultButton(function: (){
                              MyApp.of(context).setLocale(Locale('en'));
                              Navigator.pop(context);
                            }, text: 'English Language',height: 50,radius: 30,background: defaultColor , isUpperCase: false),
                            SizedBox(height: 30,),
                            TextButton(onPressed: (){Navigator.pop(context);}, child: Text('${getLang(context, 'cancel')}'),),
                          ],
                        ),
                      );
                    });
                  }, text: '${getLang(context, 'changeLang')}'),
                  myDivider(),
                  drawerItems(icon: Icons.code, function: (){navigateAndFinish(context, OnBoardingScreen(),);}, text: '${getLang(context, 'make your app')}',),
                  myDivider(),
                  drawerItems(icon: Icons.exit_to_app, function: (){SystemNavigator.pop();}, text: '${getLang(context, 'Exit')}'),
                  myDivider(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      icons(
                        image: 'assets/images/call.jpg',
                        radius: 25,
                        function:()async {
                          if(url != null)
                            await launch(url[0]);
                          else
                            throw 'could not launch';
                        },
                      ),
                      icons(
                        image: 'assets/images/fb.png',
                        radius: 25,
                        function: ()async {
                          if(url != null)
                            await launch(url[1]);
                          else
                            throw 'could not launch';
                        },
                      ),
                      icons(
                        image: 'assets/images/wtsapp.jpg',
                        radius: 25,
                        function: ()async {
                          if(url != null)
                            await launch(url[2]);
                          else
                            throw 'could not launch';
                        },
                      ),
                      icons(
                        image: 'assets/images/insta.png',
                        radius: 25,
                        function: ()async {
                          if(url != null)
                            await launch(url[3]);
                          else
                            throw 'could not launch';
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
