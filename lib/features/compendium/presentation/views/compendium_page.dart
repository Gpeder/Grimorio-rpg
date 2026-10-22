import 'package:flutter/material.dart';

class CompendiumPage extends StatelessWidget {
  const CompendiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compêndio')),
      body: const SafeArea(child: Center(child: Text('Página do compêndio'))),
    );
  }
}
