import 'package:clinic_app/components/component/applocale.dart';
import 'package:clinic_app/components/component/component.dart';
import 'package:clinic_app/home_layout/home_layout.dart';
import 'package:clinic_app/shared/network/local/cache_helper.dart';
import 'package:clinic_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  TextButton contact;

  BoardingModel(
      {@required this.image,
      @required this.title,
      @required this.body,
      this.contact});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  var boardingController = PageController();

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
        image: 'assets/images/lifeeasy.jpg',
        title:
            '${getLang(context, 'onboardingFirstScreenTitle')}'.toUpperCase(),
        body: '${getLang(context, 'onboardingFirstScreenBody')}',
      ),
      BoardingModel(
        image: 'assets/images/majeedcompany.jpg',
        title:
            '${getLang(context, 'onboardingSecondScreenTitle')}'.toUpperCase(),
        body: '${getLang(context, 'onboardingSecondScreenBody')}',
      ),
      BoardingModel(
        image: 'assets/images/makeyourapp.jpg',
        title:
            '${getLang(context, 'onboardingThirdScreenTitle')}'.toUpperCase(),
        body: '${getLang(context, 'onboardingThirdScreenBody')}',
      ),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardingController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildOnBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    spacing: 7.0,
                    expansionFactor: 4.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () async {
                    if (isLast) {
                      CacheHelper.saveData(key: 'onBoarding', value: true,).then((value){
                        if(value){
                          navigateAndFinish(context, HomeLayout());
                        }
                      });

                    } else {
                      boardingController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          isLast
              ? Center(
                  child: TextButton(
                    onPressed: () async {
                      await launch('whatsapp://send?phone= +201032949476');
                    },
                    child: Text(
                      '${getLang(context, 'contact')}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
}
