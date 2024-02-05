import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/service_locator.dart';
import 'package:jobsque/features/home/data/repos/fetch_all_jobs_repo_impl.dart';
import 'package:jobsque/features/home/presentation/model%20views/all_jobs_cubit/all_jobs_cubit.dart';
import 'package:jobsque/features/home/presentation/model%20views/username_cubit/user_name_cubit.dart';
import 'package:jobsque/features/home/presentation/views/home_view.dart';
import 'package:jobsque/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:jobsque/features/login/data/repos/login_user_repo_impl.dart';
import 'package:jobsque/features/login/presentation/model%20view/login_user_cubit/login_user_cubit.dart';
import 'package:jobsque/features/login/presentation/views/login_view.dart';
import 'package:jobsque/features/search/data/repos/filter_job_repo_impl.dart';
import 'package:jobsque/features/search/presentation/model%20views/search_job_cubit/search_job_cubit.dart';
import 'package:jobsque/features/search/presentation/views/search_view.dart';
import 'package:jobsque/features/signup/presentation/data/repos/register_repo_impl.dart';
import 'package:jobsque/features/signup/presentation/view_models/register_user_cubit/register_user_cubit.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterUserCubit(
            getit.get<RegisterRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => LoginUserCubit(
            getit.get<LoginUserRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserNameCubit(),
        ),
        BlocProvider(
          create: (context) => AllJobsCubit(
            getit.get<AllJobsRepoImpl>(),
          )..getAllJobs(),
          child: const HomeViewBody(),
        ),
        BlocProvider(
          create: (context) => SearchJobCubit(
            getit.get<SearchJobRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Jobsque',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SearchView(),
          '/login': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
        },
      ),
    );
  }
}
