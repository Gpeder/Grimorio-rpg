import 'package:flutter/material.dart';

class BestiaryPage extends StatelessWidget {
  const BestiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bestiário')),
      body: const SafeArea(child: Center(child: Text('Página do bestiário'))),
    );
  }
}
