import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../history/presentation/history_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../permissions/presentation/access_request_screen.dart';
import '../../permissions/presentation/permissions_screen.dart';
import '../../profile/presentation/profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        onHistory: () => setState(() => selectedIndex = 1),
        onReviewAccess: () => setState(() => selectedIndex = 3),
      ),
      const HistoryScreen(),
      const PermissionsScreen(),
      const AccessRequestScreen(),
      const ProfileScreen(),
    ];
    const items = [
      (Icons.home_outlined, Icons.home, 'Inicio'),
      (Icons.history, Icons.history, 'Historial'),
      (Icons.verified_user_outlined, Icons.verified_user, 'Permisos'),
      (Icons.lock_outline, Icons.lock, 'Accesos'),
      (Icons.person_outline, Icons.person, 'Perfil'),
    ];

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        height: 66,
        backgroundColor: Colors.white,
        indicatorColor: AppPalette.softBlue,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          for (final item in items)
            NavigationDestination(
              icon: Icon(item.$1, size: 20),
              selectedIcon: Icon(item.$2, size: 20),
              label: item.$3,
            ),
        ],
      ),
    );
  }
}
