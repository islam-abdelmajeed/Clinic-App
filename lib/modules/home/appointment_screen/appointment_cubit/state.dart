
abstract class AppointmentStates{}

class AppointmentInitialState extends AppointmentStates{}

class AppointmentLoadingState extends AppointmentStates{}

class AppointmentSuccessState extends AppointmentStates{}

class AppointmentErrorState extends AppointmentStates{

  final String error;

  AppointmentErrorState(this.error);
}

class CreateUserLoadingState extends AppointmentStates{}

class CreateUserSuccessState extends AppointmentStates{}

class CreateUserErrorState extends AppointmentStates{

  final String error;

  CreateUserErrorState(this.error);
}


