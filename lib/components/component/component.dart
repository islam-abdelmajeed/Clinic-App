import 'package:clinic_app/style/colors.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 3.0,
  bool isUpperCase = true,
  @required Function function,
  @required String text,
  double height = 40.0,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)
        ),
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget viewItems({
  @required String image,
  @required String title,
  @required String text,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.pink[50],
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(image),
            fit: BoxFit.fitWidth,
            height: 300,
            width: double.infinity,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
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

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChanged,
  Function onTap,
  Function validate,
  @required String label,
  @required IconData prefix,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      enabled: isClickable,
      validator: validate,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0,),
          ),),
    );

Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase(),
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        height: 2,
      ),
      ),
    );

Widget drawerItems({
  @required IconData icon,
  @required Function function,
  @required String text,
  Color color = Colors.black,
}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    width: double.infinity,
    child: Column(
      children: [
        ListTile(
          onTap: function,
          leading: Icon(icon , color: defaultColor,size: 35,),
          title: Text(text,style: TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.bold,
        ), ),
        ),
      ],
    ),
    // child: Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children:[
    //     Icon(icon,color: color,),
    //     SizedBox(
    //       width: 8,
    //     ),
    //     MaterialButton(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20.0),
    //       ),
    //       onPressed: function,
    //       child:Text(
    //         text,
    //       style: TextStyle(
    //         fontSize: 15,
    //         fontWeight: FontWeight.bold,
    //         fontFamily: 'Ubuntu',
    //       ),
    //       ),
    //     ),
    //   ],
    // ),
  );
}
icons({
  @required String image,
  @required double radius,
  @required Function function,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(60.0),
    child: TextButton(
      onPressed: function,
      child: CircleAvatar(
        backgroundImage: AssetImage(
          image,
        ),
        radius: radius,
      ),
    ),
  );
}

Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      // navigateTo(context, OnBoardScreen());
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myDivider() => Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 35) ,
      child: Container(
        height: 0.2,
        color: Colors.black,
      ),
    );

Widget articlesBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length != 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

Card infoCard({
   IconData icon,
  @required String text,
})
{
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    color: defaultColor.shade100,
    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
    child: ListTile(
      leading:  Icon(icon, color: defaultColor, size: 40,),
      title: Text(text ,style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),),
    ),
  );
}

void showToast({@required String text , @required Color color , @required Toast time}) => Fluttertoast.showToast(
  msg: text,
  toastLength: time,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 5,
  backgroundColor: color,
  textColor: Colors.white,
  fontSize: 40.0,
);

Widget homeBox(BuildContext context, {
  @required Function function,
  @required String image,
  @required String title,
}) {
  var height =MediaQuery.of(context).size.height*0.27 ;
  var heigh =MediaQuery.of(context).size.height*0.001 ;
  var heighd =MediaQuery.of(context).size.height*0.004 ;
  return Expanded(
    child: Container(
      height:height,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        ) ,
        splashColor: defaultColor,
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: heigh,),
              Image(image: AssetImage(image)),
              SizedBox(height: heighd,),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

