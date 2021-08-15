import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/modules/covid/about_covid.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';

class CovidScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                '${getLang(context, 'To help prevent the spread of COVID-19')}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: defaultColor,
                  height: 2,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              viewItems(
                image: 'assets/images/8.jpg',
                title: '${getLang(context, 'Wash your hands')}',
                text:
                    '${getLang(context, 'Wash your hands body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/19.jpg',
                title: '${getLang(context, 'step away')}',
                text:
                    '${getLang(context, 'step away body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/7.jpg',
                title: '${getLang(context, 'Wear a mask')}',
                text: '${getLang(context, 'Wear a mask body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/25.jpg',
                title: '${getLang(context, 'Do not touch')}',
                text: '${getLang(context, 'Do not touch body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/6.jpg',
                title: '${getLang(context, 'cover your face')}',
                text:
                    '${getLang(context, 'cover your face body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/23.jpg',
                title: '${getLang(context, 'stay home')}',
                text: '${getLang(context, 'stay home body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/26.jpg',
                title: '${getLang(context, 'Ask for help')}',
                text:
                    '${getLang(context, 'Ask for help body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/27.jpg',
                title: '${getLang(context, 'Warning')}',
                text:
                    '${getLang(context, 'Warning body')}',
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  navigateTo(context, AboutCovidScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${getLang(context, 'about covid-19')}'.toUpperCase(),
                      style: TextStyle(
                        backgroundColor: Colors.pink[50],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
