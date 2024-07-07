import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/presentation/model%20views/username_cubit/user_name_cubit.dart';
import 'package:jobsque/features/search/presentation/views/search_view.dart';

class HomeIntroduction extends StatelessWidget {
  const HomeIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserNameCubit, UserNameState>(
              builder: (context, state) {
                if (state is UserNameLoaded) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchView(),
                          ));
                    },
                    child: Text("Hi, ${state.username}👋",
                        style: AppStyles.mediumFont24),
                  );
                } else {
                  return const Text(
                    "Hi khalid 👋",
                    style: AppStyles.mediumFont24,
                  );
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
        ),
        SvgPicture.asset(Assets.imagesNotificationContainer)
      ],
    );
  }
}
