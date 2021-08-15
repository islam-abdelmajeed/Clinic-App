import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/modules/home/service/service.dart';
import 'package:clinic_app/modules/home/worktime/worktime.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'address/address.dart';
import 'appointment_screen/appointment_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List imgList = [
    'assets/images/a1.jpg',
    'assets/images/a2.jpg',
  ];

  List<String> url =[
    "tel://+201093921300",
    "https://www.facebook.com/%D8%B9%D9%8A%D8%A7%D8%AF%D9%87-%D8%AF%D8%A7%D9%8A%D9%85%D8%A7%D9%86-%D8%B9%D8%A8%D8%AF-%D8%A7%D9%84%D9%85%D8%AC%D9%8A%D8%AF-302528976892792",
    "whatsapp://send?phone= +201093921300",
    "https://www.instagram.com/dr_eman_clinic"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                itemCount: imgList.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(imgList[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlayAnimationDuration: Duration(milliseconds: 300),
                  height: 160,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        homeBox(context,function: () {navigateTo(context, AppointmentScreen());}, image: 'assets/images/planner.png', title: '${getLang(context, 'Appointment')}',),
                        SizedBox(width: 15.0,),
                        homeBox(context,function: () {navigateTo(context, WorkTimeScreen());}, image: 'assets/images/time-span.png', title: '${getLang(context, 'Worktime')}',),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    Row(
                      children: [
                        homeBox(context,function: () {navigateTo(context, AddressScreen());}, image: 'assets/images/address (2).png', title: '${getLang(context, 'Address')}',),
                        SizedBox(width: 15.0,),
                        homeBox(context,function: () {navigateTo(context, ServiceScreen());}, image: 'assets/images/service.png', title: '${getLang(context, 'Service')}',),
                      ],
                    ),
                  ],
                ),
              ),
              myDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  icons(
                      image: 'assets/images/call.jpg',
                      radius: 28,
                      function:()async {
                        if(url != null)
                          await launch(url[0]);
                        else
                          throw 'could not launch';
                      },
                      ),
                  icons(
                    image: 'assets/images/fb.png',
                    radius: 28,
                    function: ()async {
                      if(url != null)
                        await launch(url[1]);
                      else
                        throw 'could not launch';
                    },
                  ),
                  icons(
                    image: 'assets/images/wtsapp.jpg',
                    radius: 28,
                    function: ()async {
                      if(url != null)
                        await launch(url[2]);
                      else
                        throw 'could not launch';
                    },
                  ),
                  icons(
                    image: 'assets/images/insta.png',
                    radius: 28,
                    function: ()async {
                      if(url != null)
                        await launch(url[3]);
                      else
                        throw 'could not launch';
                    },
                  ),
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
