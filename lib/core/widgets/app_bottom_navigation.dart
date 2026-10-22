import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../app/router/app_routes.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({required this.location, super.key});

  final String location;

  static const _destinations = [
    (path: AppRoutes.home, label: 'Home', icon: HugeIcons.strokeRoundedCastle),
    (
      path: AppRoutes.characters,
      label: 'Personagens',
      icon: HugeIcons.strokeRoundedShield01,
    ),
    (
      path: AppRoutes.compendium,
      label: 'Grimório',
      icon: HugeIcons.strokeRoundedBookOpen01,
    ),
    (
      path: AppRoutes.campaigns,
      label: 'Campanhas',
      icon: HugeIcons.strokeRoundedScroll,
    ),
    (path: AppRoutes.dice, label: 'Dados', icon: HugeIcons.strokeRoundedDice),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _destinations.indexWhere(
      (destination) =>
          location == destination.path ||
          location.startsWith('${destination.path}/'),
    );
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: NavigationBar(
        height: 64,
        animationDuration: const Duration(milliseconds: 200),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
        onDestinationSelected: (index) {
          if (index != selectedIndex) {
            context.go(_destinations[index].path);
          }
        },
        destinations: [
          for (final destination in _destinations)
            NavigationDestination(
              icon: HugeIcon(icon: destination.icon, size: 24),
              label: destination.label,
            ),
        ],
      ),
    );
  }
}
