import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';

class PopularSearchResults extends StatelessWidget {
  const PopularSearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.search),
      title: const Text("UI/UX Designer"),
      trailing: SvgPicture.asset(Assets.imagesArrowRight),
    );
  }
}
