import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';

class AboutCovidScreen extends StatelessWidget {

  Widget covidIsItems({
    @required String image,
    @required String title,
    @required String text,
  }) {
    return Container(
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
              image: 'assets/images/corona.jpg',
              title: '${getLang(context, 'What is Coronavirus (Covid-19)?')}',
              text: '${getLang(context, 'What is Coronavirus (Covid-19)? body')}',
            ),
            SizedBox(height: 20,),
            covidIsItems(
                image: 'assets/images/30.jpg',
                title: '${getLang(context, 'How does the disease spread?')}',
                text: '${getLang(context, 'How does the disease spread? body')}'),
            SizedBox(height: 20,),
            covidIsItems(image:'assets/images/2.jpg' ,
                title:'${getLang(context, 'What are the symptoms of the disease?')}',
                text: '${getLang(context, 'What are the symptoms of the disease? body')}'),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

