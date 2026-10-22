import 'package:go_router/go_router.dart';

import '../../core/widgets/app_shell.dart';
import '../../features/campaigns/presentation/views/campaigns_page.dart';
import 'app_routes.dart';
import '../../features/home/presentation/views/home_page.dart';
import '../../features/characters/presentation/views/characters_page.dart';
import '../../features/characters/presentation/views/character_create_page.dart';
import '../../features/characters/presentation/views/character_details_page.dart';
import '../../features/compendium/presentation/views/compendium_page.dart';
import '../../features/compendium/presentation/views/classes_page.dart';
import '../../features/compendium/presentation/views/subclasses_page.dart';
import '../../features/compendium/presentation/views/spells_page.dart';
import '../../features/compendium/presentation/views/bestiary_page.dart';
import '../../features/inventory/presentation/views/inventory_page.dart';
import '../../features/dice/presentation/views/dice_page.dart';
import '../../features/settings/presentation/views/settings_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.root, redirect: (context, state) => AppRoutes.home),
    ShellRoute(
      builder: (context, state, child) =>
          AppShell(location: state.uri.path, child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.homeName,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.characters,
          name: AppRoutes.charactersName,
          builder: (context, state) => const CharactersPage(),
        ),
        GoRoute(
          path: AppRoutes.compendium,
          name: AppRoutes.compendiumName,
          builder: (context, state) => const CompendiumPage(),
        ),
        GoRoute(
          path: AppRoutes.campaigns,
          name: AppRoutes.campaignsName,
          builder: (context, state) => const CampaignsPage(),
        ),
        GoRoute(
          path: AppRoutes.dice,
          name: AppRoutes.diceName,
          builder: (context, state) => const DicePage(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.characterCreate,
      name: AppRoutes.characterCreateName,
      builder: (context, state) => const CharacterCreatePage(),
    ),
    GoRoute(
      path: AppRoutes.characterDetails,
      name: AppRoutes.characterDetailsName,
      builder: (context, state) =>
          CharacterDetailsPage(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: AppRoutes.classes,
      name: AppRoutes.classesName,
      builder: (context, state) => const ClassesPage(),
    ),
    GoRoute(
      path: AppRoutes.subclasses,
      name: AppRoutes.subclassesName,
      builder: (context, state) =>
          SubclassesPage(classId: state.pathParameters['classId']!),
    ),
    GoRoute(
      path: AppRoutes.spells,
      name: AppRoutes.spellsName,
      builder: (context, state) => const SpellsPage(),
    ),
    GoRoute(
      path: AppRoutes.bestiary,
      name: AppRoutes.bestiaryName,
      builder: (context, state) => const BestiaryPage(),
    ),
    GoRoute(
      path: AppRoutes.inventory,
      name: AppRoutes.inventoryName,
      builder: (context, state) => const InventoryPage(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      name: AppRoutes.settingsName,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
