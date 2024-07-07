import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/utils/app_router.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/widgets/custom_button.dart';
import 'package:jobsque/features/signup/presentation/views/choose_location_page/widgets/sign_up_country.dart';
import 'package:jobsque/features/signup/presentation/views/choose_work_page/widgets/custom_text_header.dart';

class SignUpLocationScreen extends StatefulWidget {
  static const String route = 'sign-up-loation';

  const SignUpLocationScreen({super.key});

  @override
  State<SignUpLocationScreen> createState() => _SignUpLocationScreenState();
}

class _SignUpLocationScreenState extends State<SignUpLocationScreen> {
  // ignore: prefer_final_fields
  List<Map> _countryData = [
    {
      'name': 'United State',
      'image': Assets.imagesDesinger,
    },
    {
      'name': 'Malaysia',
      'image': Assets.imagesDesinger,
    },
    {'name': 'Singapore', 'image': Assets.imagesDesinger},
    {'name': 'Indonesia', 'image': Assets.imagesDesinger},
    {'name': 'Philippines', 'image': Assets.imagesDesinger},
    {'name': 'Polandia', 'image': Assets.imagesDesinger},
    {'name': 'India', 'image': Assets.imagesDesinger},
    {'name': 'Vietnam', 'image': Assets.imagesDesinger},
    {'name': 'China', 'image': Assets.imagesDesinger},
    {'name': 'Canda', 'image': Assets.imagesDesinger},
    {'name': 'Saudi Arabia', 'image': Assets.imagesDesinger},
    {'name': 'Argentina', 'image': Assets.imagesDesinger},
    {'name': 'Brazil', 'image': Assets.imagesDesinger},
  ];
  int _countrySelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /***** Header Text ******/
          const CustomTextHeader(
              height: 170,
              title: 'where are you perefered Location ?',
              subtitle:
                  'Let us know, where is the work location you want at this time, so we can adjust it.'),
          /***** -END- Header Text ******/

          /***** Work From buttons ******/
          Container(
              height: 46,
              margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(244, 244, 245, 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Row(
                children: [
                  Expanded(
                      child: CustomStanderButton(
                    text: 'Work From Office',
                    margin: EdgeInsets.all(0),
                    color: Colors.transparent,
                    textColor: Color.fromRGBO(107, 114, 128, 1),
                  )),
                  Expanded(
                      child: CustomStanderButton(
                    text: 'Remote Work',
                    margin: EdgeInsets.all(0),
                  )),
                ],
              )),
          /***** -END- Work From buttons ******/

          /***** Select country header text ******/
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Select the country you want for your job',
                  style: TextStyle(fontSize: 16),
                )),
          ),
          /***** -END- Select country header text ******/

          /***** countries ******/
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: _countryList(),
                  ),
                ),
              )),
          /***** -END- countries ******/

          /***** Next Button *****/
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: CustomStanderButton(
                    text: 'Next',
                    onPress: () =>
                        GoRouter.of(context).go(AppRouter.knavbarView),
                  ),
                )
              ],
            ),
          )
          /***** -END- Next Button *****/
        ],
      ),
    );
  }

  /// create list of countries widgets
  List<Widget> _countryList() {
    List<Widget> countryList = [];
    for (var i = 0; i < _countryData.length; i++) {
      countryList.add(
        SignUpCountryBox(
          acticve: _countrySelected == i ? true : false,
          countryName: _countryData[i]['name'],
          flag: SvgPicture.asset(_countryData[i]['image']),
          onTap: () => setState(() {
            _countrySelected = i;
          }),
        ),
      );
    }
    return countryList;
  }
}
