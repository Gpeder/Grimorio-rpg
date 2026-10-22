import 'package:flutter/material.dart';

class CharacterCreatePage extends StatelessWidget {
  const CharacterCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar personagem')),
      body: const SafeArea(
        child: Center(child: Text('Página de criação de personagem')),
      ),
    );
  }
}
