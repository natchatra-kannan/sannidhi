import 'package:flutter/material.dart';

import '../../features/awards/pages/awards_25_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/jeevakaavi/pages/jeevakaavi_page.dart';
import '../../features/makkal/pages/makkal_page.dart';
import '../../features/meeting_room/pages/meeting_room_booking_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../features/teams/pages/teams_page.dart';
import 'app_top_bar.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
      const JeevakaaviPage(),
      const MakkalPage(),
      const MeetingRoomBookingPage(),
      const Awards25Page(),
      const ProfilePage(),
    ];
  }

  void _navigateTo(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<void> _signOut() async {
    // Sign out logic will be handled by redirects in auth state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        selectedIndex: currentIndex < 5 ? currentIndex : 0,
        onItemSelected: _navigateTo,
        onViewProfile: () {
          _navigateTo(5); // Navigate to ProfilePage at index 5
        },
        onSignOut: _signOut,
      ),
      body: pages[currentIndex],
    );
  }
}