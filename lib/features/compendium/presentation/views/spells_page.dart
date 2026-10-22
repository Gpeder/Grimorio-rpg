import 'package:flutter/material.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Magias')),
      body: const SafeArea(child: Center(child: Text('Página de magias'))),
    );
  }
}
