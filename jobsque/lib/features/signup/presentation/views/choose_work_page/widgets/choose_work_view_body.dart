import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/utils/app_router.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/widgets/custom_button.dart';
import 'package:jobsque/core/widgets/custom_work_location_body.dart';
import 'package:jobsque/features/signup/presentation/views/choose_work_page/widgets/custom_text_header.dart';

class SignUpWorkTypeScreen extends StatefulWidget {
  static const String route = 'sign-up-work-type';

  const SignUpWorkTypeScreen({super.key});

  @override
  State<SignUpWorkTypeScreen> createState() => _SignUpWorkTypeScreenState();
}

class _SignUpWorkTypeScreenState extends State<SignUpWorkTypeScreen> {
  final List<Map> _workTypes = [
    {
      'title': 'UI/UX Designer',
      'icon': Assets.imagesDesinger,
      'active': false,
    },
    {
      'title': 'Ilustrator Designer',
      'icon': Assets.imagesIlustrator,
      'active': false
    },
    {
      'title': 'Developer',
      'icon': Assets.imagesManagmentJcon,
      'active': false,
    },
    {
      'title': 'Managment',
      'icon': Assets.imagesInfotech,
      'active': false,
    },
    {
      'title': 'Information tehnology',
      'icon': Assets.imagesInfotech,
      'active': false
    },
    {
      'title': 'Research and Analytics',
      'icon': Assets.imagesInfotech,
      'active': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          /***** Header Text *****/
          const CustomTextHeader(
            height: 150,
            title: 'What kind of work are you intersted in ?',
            subtitle:
                'Tell us what you\'re interested in so we can customise the app for your needs',
          ),
          /***** -END- Header Text *****/

          /***** Type of works grid *****/
          Expanded(
              flex: 6,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    childAspectRatio: 156 / 125),
                padding: const EdgeInsets.all(20),
                itemCount: _workTypes.length,
                itemBuilder: (context, index) {
                  return SignUpWorkTypeBox(
                    onTap: () {
                      _workTypes[index]['active'] =
                          !_workTypes[index]['active'];
                      setState(() {});
                    },
                    active: _workTypes[index]['active'],
                    icon: SvgPicture.asset(_workTypes[index]['icon']),
                    title: _workTypes[index]['title'],
                  );
                },
              )),
          /***** -END- Type of works grid *****/

          /***** Next button *****/
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: CustomStanderButton(
                    text: 'Next',
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    onPress: () => GoRouter.of(context).go(
                      AppRouter.knavbarView,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /***** Next button *****/
        ],
      ),
    );
  }
}
