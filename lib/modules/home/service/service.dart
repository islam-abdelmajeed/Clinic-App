
import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/modules/home/service/devices.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${getLang(context, 'Service')}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                '${getLang(context, 'What we make')}',
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
                image: 'assets/images/skin.jpg',
                title: '${getLang(context, 'skin')}',
                text:
                '${getLang(context, 'skin body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/hair.jpg',
                title: '${getLang(context, 'hair')}',
                text:
                '${getLang(context, 'hair body')}',
              ),
              SizedBox(
                height: 25,
              ),
              viewItems(
                image: 'assets/images/beauty.jpg',
                title: '${getLang(context, 'beauty')}',
                text: '${getLang(context, 'beauty body')}',
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  navigateTo(context, OurDevices());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${getLang(context, 'our device')}'.toUpperCase(),
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
