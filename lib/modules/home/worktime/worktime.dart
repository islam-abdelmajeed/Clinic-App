import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/modules/home/appointment_screen/appointment_screen.dart';
import 'package:flutter/material.dart';

class WorkTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Text(
          '${getLang(context, 'Worktime')}',
          style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ), ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.all(15.0),
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('./assets/images/a2.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            infoCard(
              icon: Icons.calendar_today,
              text: '${getLang(context, 'days')}',
            ),
            SizedBox(
              height: 15.0,
            ),
            infoCard(
              icon: Icons.timer,
              text: '${getLang(context, 'time')}',
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.book_online_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      '${getLang(context, 'Appointment')}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    MaterialButton(
                      onPressed: ()=> navigateTo(context, AppointmentScreen()),
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                      color: Colors.pink[900],
                      child: Text('${getLang(context, 'BOOK')}',style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
