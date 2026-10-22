import 'package:flutter/material.dart';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dados')),
      body: const SafeArea(child: Center(child: Text('Página de dados'))),
    );
  }
}
