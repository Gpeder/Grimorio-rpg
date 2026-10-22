import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do personagem')),
      body: const SafeArea(
        child: Center(child: Text('Página de detalhes do personagem')),
      ),
    );
  }
}
