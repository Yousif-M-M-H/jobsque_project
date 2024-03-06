import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/portfolio_page/add_file_container.dart';

class PortfolioViewBody extends StatelessWidget {
  const PortfolioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Portfolio",
          style: AppStyles.mediumFont20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddFileContainer(),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.imagesPdfIcon),
                title: const Text(
                  "UI/UX Designer",
                  style: AppStyles.mediumFont14,
                ),
                subtitle: Text(
                  "CV.pdf 300KB",
                  style: AppStyles.normalFont12.copyWith(
                    color: const Color(0xFF6B7280),
                  ),
                ),
                trailing: const Icon(
                  Icons.edit,
                  color: Color(0xff3366FF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
