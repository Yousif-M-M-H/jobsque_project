import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/display_job_container.dart';
import 'package:jobsque/features/favorites/presentation/views/model%20view/add_to_fav_cubit/add_to_fav_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/apply_now_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuggestedJobContainer extends StatefulWidget {
  final String jobName;
  final String salary;
  final String jobType;
  final int jobId;

  const SuggestedJobContainer({
    Key? key,
    required this.jobName,
    required this.salary,
    required this.jobType,
    required this.jobId,
  }) : super(key: key);

  @override
  State<SuggestedJobContainer> createState() => _SuggestedJobContainerState();
}

class _SuggestedJobContainerState extends State<SuggestedJobContainer> {
  bool _isFav = false;
  int? _userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final tokenStorage = TokenStorage();
    final userId = await tokenStorage.getUserId();
    if (userId != null) {
      _userId = userId;
      _loadFavState();
    }
  }

  Future<void> _loadFavState() async {
    final prefs = await SharedPreferences.getInstance();
    final isFav = prefs.getBool('fav_${widget.jobId}_user_$_userId') ?? false;
    setState(() {
      _isFav = isFav;
    });
  }

  Future<void> _toggleFav() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFav = !_isFav;
    });
    prefs.setBool('fav_${widget.jobId}_user_$_userId', _isFav);

    // Trigger the API call to add/remove the job from favorites
    context.read<AddToFavCubit>().addToFavCubitFunc(id: widget.jobId);

    // Log the action for debugging purposes
    print(
        "Toggled favorite status for job ID ${widget.jobId} by user $_userId to $_isFav");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: ShapeDecoration(
        color: const Color(0xFF091A7A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesZoom),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.jobName,
                        style: AppStyles.mediumFont18
                            .copyWith(color: Colors.white),
                      ),
                      const Text(
                        'Zoom • United States',
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 12,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: _toggleFav,
                child: SvgPicture.asset(
                  _isFav ? Assets.imagesSaveIconFilled : Assets.imagesSaveIcon,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SuggestedJobContainerChip(
                title: widget.jobType,
              ),
              const SizedBox(width: 8),
              const SuggestedJobContainerChip(
                title: "Onsite",
              ),
              const SizedBox(width: 8),
              const SuggestedJobContainerChip(
                title: "Senior",
              ),
            ],
          ),
          const SizedBox(height: 5),
          ApplyNowRow(
            salary: widget.salary,
          )
        ],
      ),
    );
  }
}
