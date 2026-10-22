import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventário')),
      body: const SafeArea(child: Center(child: Text('Página de inventário'))),
    );
  }
}
