import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpg/features/home/presentation/views/home_page.dart';

void main() {
  testWidgets(
    'Alinha a saudação abaixo da altura definida pela AppBar separada',
    (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      tester.view.padding = const FakeViewPadding(top: 24);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPadding);
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      final appBar = scaffold.appBar!;
      expect(appBar.preferredSize.height, 80);
      expect(scaffold.extendBodyBehindAppBar, isTrue);
      expect(tester.getSize(find.byType(AppBar)).height, 104);
      expect(
        tester.getTopLeft(find.text('Bem-vindo de volta!')).dy,
        greaterThanOrEqualTo(tester.getBottomLeft(find.byType(AppBar)).dy),
      );
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
