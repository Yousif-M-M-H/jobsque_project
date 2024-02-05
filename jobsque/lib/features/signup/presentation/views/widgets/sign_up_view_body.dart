import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/presentation/model%20views/username_cubit/user_name_cubit.dart';
import 'package:jobsque/features/signup/presentation/view_models/register_user_cubit/register_user_cubit.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/already_have_account.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/create_account_button.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/email_text_field.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/intro_sign_up.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/password_text_field.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/username_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    TextEditingController userController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignUpIntroduction(screenHeight: screenHeight),
          UserNameTextField(
            userController: userController,
            onChange: (newusername) {
              final userCubit = BlocProvider.of<UserNameCubit>(context);
              userCubit.updateUser(newusername);
            },
          ),
          SizedBox(height: screenHeight * 0.02),
          EmailTextfield(
            emailController: emailController,
          ),
          SizedBox(height: screenHeight * 0.02),
          PasswordTextField(
            passwordController: passwordController,
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            'Password must be at least 8 characters',
            style:
                AppStyles.normalFont16.copyWith(color: const Color(0xFF9CA3AF)),
          ),
          const Expanded(child: SizedBox()),
          const Center(child: AlreadyHaveAnAccWidget()),
          SizedBox(height: screenHeight * 0.02),
          CreateAccountButton(
            onPressed: () {
              context.read<RegisterUserCubit>().registerUser(
                    name: userController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
          ),
          // SizedBox(height: screenHeight * 0.025),
          // const RowDivderWidget(),
          // SizedBox(height: screenHeight * 0.03),
          // SignInWithGoogleNFaceRow(screenWidth: screenWidth),
          // SizedBox(height: screenHeight * 0.05),
          BlocListener<RegisterUserCubit, RegisterUserState>(
            listener: (context, state) {
              if (state is RegisterUserFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errMessage),
                  ),
                );
              } else if (state is RegisterUserSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User successfully registered'),
                  ),
                );

                Navigator.pushReplacementNamed(context, '/home');
              }
            },
            child:
                Container(), // This widget is only used for listening to state changes
          ),
        ],
      ),
    );
  }
}
