import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/home_layout/home_layout.dart';
import 'package:clinic_app/modules/home/appointment_screen/appointment_cubit/cubit.dart';
import 'package:clinic_app/modules/home/appointment_screen/appointment_cubit/state.dart';
import 'package:clinic_app/modules/home/worktime/worktime.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AppointmentScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppointmentCubit(),
      child: BlocConsumer<AppointmentCubit, AppointmentStates>(
        listener: (BuildContext context, state) {
          if (state is CreateUserLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "${getLang(context, 'Please wait ...')}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Cairo'),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.amber,
            ));
          } else if (state is CreateUserSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "${getLang(context, 'Successfully booked')}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Cairo'),
              ),
              duration: Duration(seconds: 7),
              backgroundColor: Colors.green,
            ));
            navigateAndFinish(context, HomeLayout());
          } else if (state is CreateUserErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${getLang(context, 'Please, try again')}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Cairo'),
              ),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                '${getLang(context, 'Make an appointment')}',
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                              image: AssetImage('./assets/images/women.jpg'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '${getLang(context, 'Enter your name, please.')}';
                            }
                          },
                          label: '${getLang(context, 'Your Name')}',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '${getLang(context, 'Enter your phone number, please.')}';
                            }
                          },
                          label: '${getLang(context, 'Phone number')}',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: cityController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '${getLang(context, 'Enter your city, please.')}';
                            }
                          },
                          label: '${getLang(context, 'Where are you from?')}',
                          prefix: Icons.place,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: defaultFormField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    List<int> _availableHours = [
                                      12,
                                      13,
                                      14,
                                      15,
                                      16,
                                      17,
                                      18
                                    ];
                                    List<int> _availableMinutes = [
                                      0,
                                      10,
                                      20,
                                      30,
                                      40,
                                      50
                                    ];
                                    showCustomTimePicker(
                                        context: context,
                                        // It is a must if you provide selectableTimePredicate
                                        onFailValidation: (context) =>
                                            ('Unavailable selection.'),
                                        initialTime: TimeOfDay(
                                            hour: _availableHours.first,
                                            minute: _availableMinutes.first),
                                        selectableTimePredicate: (time) =>
                                            _availableHours
                                                    .indexOf(time.hour) !=
                                                -1 &&
                                            _availableMinutes
                                                    .indexOf(time.minute) !=
                                                -1).then((value) {
                                      timeController.text =
                                          value.format(context).toString();
                                    });
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return '${getLang(context, 'Enter the time, please.')}';
                                    }
                                  },
                                  label: '${getLang(context, 'Time')}',
                                  prefix: Icons.watch_later_outlined,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                child: defaultFormField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (
                                          BuildContext context,
                                        ) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            title: TextButton(
                                              onPressed: () {
                                                navigateTo(
                                                    context, WorkTimeScreen());
                                              },
                                              child: Text(
                                                  '${getLang(context, 'Worktime')}',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w900,

                                                ),
                                              ),
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('${getLang(context, 'sat')}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25
                                                ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text('${getLang(context, 'mon')}',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25
                                                  ),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text('${getLang(context, 'wed')}',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25
                                                  ),),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                defaultButton(
                                                  function: () {
                                                    Navigator.pop(context);
                                                    showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(2121),
                                                    ).then((value) {
                                                      dateController.text =
                                                          DateFormat.yMMMd()
                                                              .format(value);
                                                    });

                                                  },
                                                  text: '${getLang(context, 'ok')}',
                                                  height: 60,
                                                  width: 350,
                                                  radius: 20.0,
                                                  background: defaultColor,
                                                  isUpperCase: true,
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return '${getLang(context, 'Enter the date, please.')}';
                                    }
                                  },
                                  label: '${getLang(context, 'Date')}',
                                  prefix: Icons.calendar_today_outlined,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label:
                                "${getLang(context, "Your email 'Optional'")}",
                            prefix: Icons.mail_outline),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: commentController,
                            type: TextInputType.text,
                            label:
                                "${getLang(context, "Any comment 'Optional'")}",
                            prefix: Icons.comment),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! CreateUserLoadingState,
                          builder: (BuildContext context) => defaultButton(
                            function: () {
                              if (_formKey.currentState.validate()) {
                                AppointmentCubit.get(context).userCreate(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  city: cityController.text,
                                  time: timeController.text,
                                  date: dateController.text,
                                  email: emailController.text,
                                  comment: commentController.text,
                                );
                              }
                            },
                            text: '${getLang(context, 'Book Appointment')}',
                            height: 60,
                            width: 350,
                            radius: 20.0,
                            background: defaultColor,
                            isUpperCase: true,
                          ),
                          fallback: (BuildContext context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
