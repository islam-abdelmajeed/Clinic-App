import 'package:bloc/bloc.dart';
import 'package:clinic_app/models/user_model.dart';
import 'package:clinic_app/modules/home/appointment_screen/appointment_cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentStates> {
  AppointmentCubit() : super(AppointmentInitialState());

  static AppointmentCubit get(context) => BlocProvider.of(context);


  void userCreate({
    @required String name,
    @required String email,
    @required String phone,
    @required String city,
    @required String date,
    @required String time,
    @required String comment,

  }) {
    emit(CreateUserLoadingState());

    UserModel model = UserModel(
      name: name,
      phone: phone,
      date: date,
      time: time,
      city: city,
      email: email,
      comment: comment,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc()
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }
}
