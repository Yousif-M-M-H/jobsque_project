import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/features/applied_jobs/presentations/views/applied_jobs_view.dart';
import 'package:jobsque/features/favorites/presentation/views/fav_job_view.dart';
import 'package:jobsque/features/home/presentation/views/home_view.dart';
import 'package:jobsque/features/notifications/notification_view.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:jobsque/features/profile_completion/views/widgets/profile_com_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavBarViewState createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _selectedIndex = 0;
  bool _profileCompleted = false;

  @override
  void initState() {
    super.initState();
    _checkProfileCompletion();
  }

  Future<void> _checkProfileCompletion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = await TokenStorage()
        .getUserId(); // Assuming this method exists and is async
    final String completionStatusString =
        prefs.getString('completionStatus_$userId') ?? '[]';
    final List<bool> completionStatus =
        List<bool>.from(json.decode(completionStatusString));
    final int completedCount =
        completionStatus.where((status) => status).length;
    final double completionPercent = completionStatus.isEmpty
        ? 0.0
        : completedCount / completionStatus.length;
    setState(() {
      _profileCompleted = completionPercent == 1.0;
    });
  }

  void refreshProfileCompletion() {
    _checkProfileCompletion();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = _getBody(_selectedIndex);
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF3366FF),
        unselectedItemColor: const Color(0xFF9CA3AF),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    if (index == 4) {
      return _profileCompleted
          ? const ProfileViewBody()
          : ProfileCompletionViewBody(
              onProfileCompleted: refreshProfileCompletion); // Changed here
    } else {
      switch (index) {
        case 0:
          return const HomeView();
        case 1:
          return const NotificationsView();
        case 2:
          return const AppliedJobsView();
        case 3:
          return const FavJobView();
        default:
          return Container(); // Fallback for an unrecognized tab
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
