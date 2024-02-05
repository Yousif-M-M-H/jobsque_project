import 'package:go_router/go_router.dart';
import 'package:jobsque/features/home/presentation/views/home_view.dart';
import 'package:jobsque/features/login/presentation/views/login_view.dart';
import 'package:jobsque/features/signup/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const kloginView = '/loginView';
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/loginView',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
