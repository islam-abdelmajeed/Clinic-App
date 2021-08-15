import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';

class AboutDoctor extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image:AssetImage('assets/images/ahla.jpg'),
              width: 300,
                height: 300,
              ),
              SizedBox(height: 20,),
              Text('${getLang(context, 'Dr.Eman Abdel-Majeed')}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),
              ),
              SizedBox(height: 15.0,),
              Text('${getLang(context, 'Dermatologist')}'.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                color: defaultColor.shade200,
                letterSpacing: 4,
              ),
              ),
              SizedBox(height: 20.0,
              width: 150,
              child: Divider(
                color: Colors.red,
                thickness: 0.2,
              ),),
              infoCard(icon: Icons.phone, text: '01093921300',),
              infoCard(icon: Icons.contact_mail_outlined,  text: '${getLang(context, 'Master of Dermatology and Beauty')}',),
              infoCard(icon: Icons.add_location_alt_outlined, text: '${getLang(context, 'sherbin, Al-Mamoon tour')}',),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
