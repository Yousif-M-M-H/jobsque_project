import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/success_application_page.dart';
import 'package:jobsque/features/forget/presentation/views/pages/forget_password_view.dart';
import 'package:jobsque/features/home/presentation/views/home_view.dart';
import 'package:jobsque/features/login/presentation/views/login_view.dart';
import 'package:jobsque/features/navbar/nav_bar_view.dart';
import 'package:jobsque/features/search/presentation/views/search_view.dart';
import 'package:jobsque/features/signup/presentation/views/choose_location_page/widgets/choose_location_view_body.dart';
import 'package:jobsque/features/signup/presentation/views/choose_work_page/choose_work_view.dart';
import 'package:jobsque/features/signup/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const kloginView = '/loginView';
  static const kHomeView = '/homeView';
  static const ksearchView = '/searchView';
  static const knavbarView = '/navbarview';
  static const ksuccessapplicationpageView = '/successpageView';
  static const kforgotPassword = '/forgotPassword';
  static const kchooseWorkType = '/kchooseWorkType';
  static const kSignUpLocationScreen = '/kchooseWorkType';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kloginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: ksearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: knavbarView,
        builder: (context, state) => const NavBarView(),
      ),
      GoRoute(
        path: ksuccessapplicationpageView,
        builder: (context, state) => const SuccessApplicationView(),
      ),
      GoRoute(
        path: kforgotPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kchooseWorkType,
        builder: (context, state) => const ChooseWorkView(),
      ),
      GoRoute(
        path: kSignUpLocationScreen,
        builder: (context, state) => const SignUpLocationScreen(),
      ),
    ],
  );
  static void pageNavigator(BuildContext context, String pageRoute, {extra}) {
    GoRouter.of(context).push(pageRoute, extra: extra);
  }
}
