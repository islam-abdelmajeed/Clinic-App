class UserModel{
  String name;
  String city;
  String phone;
  String time;
  String email;
  String date;
  String comment;
  String uId;

  UserModel({
    this.name,
    this.city,
    this.phone,
    this.time,
    this.email,
    this.date,
    this.comment,

});

  UserModel.formJson(Map<String,dynamic> json){
    name =json['name'];
    city =json['city'];
    phone =json['phone'];
    email =json['email'];
    date =json['date'];
    time =json['time'];
    comment =json['comment'];

  }

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      'date':date,
      'phone':phone,
      'time':time,
      'city':city,
      'comment':comment,
    };
  }

}