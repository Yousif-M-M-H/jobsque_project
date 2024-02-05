import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/presentation/model%20views/username_cubit/user_name_cubit.dart';

class HomeIntroduction extends StatelessWidget {
  const HomeIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<UserNameCubit, UserNameState>(
          builder: (context, state) {
            if (state is UserNameLoaded) {
              return Text("Hi, ${state.username}👋",
                  style: AppStyles.mediumFont24);
            } else {
              return const Text("Hi");
            }
          },
        ),
        SizedBox(height: screenSize.height * 0.01),
        Text(
          "Create a better future for yourself here",
          style: AppStyles.normalFont14.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}
