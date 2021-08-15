import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';

class OurDevices extends StatelessWidget {

  Widget covidIsItems({
    @required String image,
    @required String title,
    @required String text,
  }) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(image),
                fit: BoxFit.fitHeight,
                height: 300,
                width: double.infinity,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            covidIsItems(
              image: 'assets/images/device1.jpg',
              title: '${getLang(context, 'our device')}'+':',
              text: "1-Dermoscop.\n2-Ch peeling.\n3-Cold peeling.\n4-Mesotherapy.\n5-IPL.\n6-Dermapen.\n7-Crystal peeling.\n8-Plasma.\n9-Plasma gel.\n10-Filler.\n11-Botox.\n12-Hair therapy.\n13-Wood's light.",
            ),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}

