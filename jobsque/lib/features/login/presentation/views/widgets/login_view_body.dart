import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/utils/app_router.dart';
import 'package:jobsque/features/login/presentation/model%20view/login_user_cubit/login_user_cubit.dart';
import 'package:jobsque/features/login/presentation/views/widgets/already_have_account_row.dart';
import 'package:jobsque/features/login/presentation/views/widgets/forgot_password.dart';
import 'package:jobsque/features/login/presentation/views/widgets/introduction_login_widget.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_button.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_footer.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_password_textfield.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_username_textfield.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginIntroduction(screenHeight: screenHeight),
                  LoginUserNameTextField(
                    emailController: emailController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  LoginPasswordTextField(
                    passwordController: passwordController,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  const ForgotPasswordRow(),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
        // Widgets that will stay at the bottom
        const Center(child: LoginAlreadyHaveAnAccWidget()),
        SizedBox(height: screenHeight * 0.02),
        LoginAccountButton(
          onPressed: () {
            context.read<LoginUserCubit>().loginUser(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
          },
        ),
        LoginFooter(screenWidth: screenWidth, screenHeight: screenHeight),
        BlocListener<LoginUserCubit, LoginUserState>(
          listener: (context, state) {
            if (state is LoginUserFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                ),
              );
            } else if (state is LoginUserSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('user logged in successfully'),
                ),
              );
              GoRouter.of(context).go(AppRouter.knavbarView);
            }
          },
          child: Container(),
        ),
      ],
    );
  }
}
