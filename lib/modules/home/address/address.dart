import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AddressScreen extends StatelessWidget {
  var url = 'https://www.google.com/maps/place/%D8%AF%D9%83%D8%AA%D9%88%D8%B1%D8%A9+%D8%A7%D9%8A%D9%85%D8%A7%D9%86+%D8%B9%D8%A8%D8%AF%D8%A7%D9%84%D9%85%D8%AC%D9%8A%D8%AF+,+%D8%AC%D9%84%D8%AF%D9%8A%D8%A9%E2%80%AD/@31.1967203,31.5208995,19z/data=!4m8!1m2!2m1!1z2KfZhNiv2YPYqtmI2LHYqSDYp9mK2YXYp9mGINi52KjYr9in2YTZhdis2YrYryA!3m4!1s0x14f77b64239b6b57:0x5444a6d5ae5c2791!8m2!3d31.196768!4d31.5208814?hl=ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Text('${getLang(context, 'Address')}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
      ),
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15.0),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('./assets/images/map.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(height: 30.0,),
            infoCard(icon: Icons.place_outlined,
                text: '${getLang(context, 'sherbin, Al-Mamoon tour')}'),
            SizedBox(height: 20.0,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              height: 60,
              color: defaultColor,
              onPressed: () async {
                if (url != null)
                  await launch(url);
                else
                  throw 'could not launch';
              },
              child: Text('${getLang(context, 'location')}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Ubuntu',
                  color: Colors.white,
                ),),
            )
          ],
        ),
      ),
    );
  }
}
