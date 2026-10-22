import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpg/app/router/app_router.dart';
import 'package:rpg/features/characters/presentation/views/character_details_page.dart';
import 'package:rpg/features/compendium/presentation/views/subclasses_page.dart';
import 'package:rpg/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Substitute only font assets so navigation tests do not depend on network.
    GoogleFonts.config.allowRuntimeFetching = false;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) async {
          final key = const StringCodec().decodeMessage(message);
          if (key == 'AssetManifest.bin') {
            return const StandardMessageCodec().encodeMessage({
              for (final family in ['Inter', 'Cinzel'])
                for (final weight in ['Regular', 'Medium'])
                  '$family-$weight.ttf': [
                    {'asset': '$family-$weight.ttf'},
                  ],
            });
          }
          if (key != null && key.startsWith('images/')) {
            final bytes = await File(Uri.decodeFull(key)).readAsBytes();
            return ByteData.sublistView(bytes);
          }
          if (key != null && key.endsWith('.ttf')) {
            return ByteData(0);
          }
          return null;
        });
  });

  testWidgets('Abre a Home e navega pelos cinco destinos', (tester) async {
    await tester.pumpWidget(const MyApp());
    appRouter.go('/');
    await tester.pumpAndSettle();

    expect(find.text('Bem-vindo de volta!'), findsOneWidget);
    expect(appRouter.routeInformationProvider.value.uri.path, '/home');

    final destinations = [
      ('Personagens', 'Página de personagens', '/characters', 1),
      ('Grimório', 'Página do compêndio', '/compendium', 2),
      ('Campanhas', '', '/campaigns', 3),
      ('Dados', 'Página de dados', '/dice', 4),
      ('Home', 'Bem-vindo de volta!', '/home', 0),
    ];
    for (final (label, message, path, index) in destinations) {
      await tester.tap(find.text(label).last);
      await tester.pumpAndSettle();
      if (message.isNotEmpty) expect(find.text(message), findsOneWidget);
      expect(appRouter.routeInformationProvider.value.uri.path, path);
      expect(
        tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
        index,
      );
      expect(find.byType(Scaffold), findsOneWidget);
      expect(
        find.byType(AppBar),
        path == '/campaigns' ? findsNothing : findsOneWidget,
      );
      if (message.isNotEmpty && path != '/home') {
        expect(
          find.ancestor(
            of: find.text(message),
            matching: find.byType(SafeArea),
          ),
          findsOneWidget,
        );
      }
    }
    await GoogleFonts.pendingFonts();
  });

  final secondaryRoutes = [
    (
      '/characters/create',
      'Criar personagem',
      'Página de criação de personagem',
    ),
    (
      '/characters/hero-42',
      'Detalhes do personagem',
      'Página de detalhes do personagem',
    ),
    ('/compendium/classes', 'Classes', 'Página de classes'),
    (
      '/compendium/classes/mage/subclasses',
      'Subclasses',
      'Página de subclasses',
    ),
    ('/compendium/spells', 'Magias', 'Página de magias'),
    ('/compendium/bestiary', 'Bestiário', 'Página do bestiário'),
    ('/inventory', 'Inventário', 'Página de inventário'),
    ('/settings', 'Configurações', 'Página de configurações'),
  ];

  for (final (path, title, message) in secondaryRoutes) {
    testWidgets('Acessa $path sem barra inferior', (tester) async {
      await tester.pumpWidget(const MyApp());
      appRouter.go(path);
      await tester.pumpAndSettle();
      expect(find.text(title), findsOneWidget);
      expect(find.text(message), findsOneWidget);
      expect(find.byType(NavigationBar), findsNothing);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(
        find.ancestor(of: find.text(message), matching: find.byType(SafeArea)),
        findsOneWidget,
      );
      if (path == '/characters/hero-42') {
        expect(
          tester
              .widget<CharacterDetailsPage>(find.byType(CharacterDetailsPage))
              .id,
          'hero-42',
        );
      }
      if (path == '/compendium/classes/mage/subclasses') {
        expect(
          tester.widget<SubclassesPage>(find.byType(SubclassesPage)).classId,
          'mage',
        );
      }
    });
  }

  testWidgets('Retorna de uma rota secundária para a aba anterior', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    appRouter.go('/characters');
    await tester.pumpAndSettle();
    final popped = appRouter.push<void>('/characters/create');
    await tester.pumpAndSettle();
    expect(find.byType(NavigationBar), findsNothing);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    await popped;
    expect(find.text('Página de personagens'), findsOneWidget);
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      1,
    );
  });

  testWidgets('Mantém destinos acessíveis em tela estreita com área segura', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(bottom: 24);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);
    await tester.pumpWidget(const MyApp());
    appRouter.go('/home');
    await tester.pumpAndSettle();

    for (final label in [
      'Home',
      'Personagens',
      'Grimório',
      'Campanhas',
      'Dados',
    ]) {
      final destination = find.widgetWithText(NavigationDestination, label);
      final size = tester.getSize(destination);
      expect(size.width, greaterThanOrEqualTo(48));
      expect(size.height, greaterThanOrEqualTo(48));
      expect(tester.getRect(destination).bottom, lessThanOrEqualTo(616));
      expect(find.text(label).hitTestable(), findsOneWidget);
    }
    expect(tester.takeException(), isNull);
  });

  for (final brightness in Brightness.values) {
    testWidgets('Aplica o tema do sistema: ${brightness.name}', (tester) async {
      tester.platformDispatcher.platformBrightnessTestValue = brightness;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
      await tester.pumpWidget(const MyApp());
      appRouter.go('/home');
      await tester.pumpAndSettle();
      final theme = Theme.of(tester.element(find.byType(Scaffold)));
      final bar = tester.widget<NavigationBar>(find.byType(NavigationBar));
      expect(bar.destinations, hasLength(5));
      final barTheme = NavigationBarTheme.of(
        tester.element(find.byType(NavigationBar)),
      );
      expect(barTheme.backgroundColor, theme.colorScheme.surface);
      expect(barTheme.elevation, 0);
      expect(theme.brightness, brightness);
      expect(theme.useMaterial3, isTrue);
      expect(
        theme.scaffoldBackgroundColor,
        brightness == Brightness.dark
            ? const Color(0xFF141218)
            : const Color(0xFFF7F3EC),
      );
      expect(theme.textTheme.bodyMedium!.fontFamily, startsWith('Inter'));
      expect(theme.textTheme.titleLarge!.fontFamily, startsWith('Cinzel'));
    });
  }
}
