import 'package:flutter/material.dart';

class SubclassesPage extends StatelessWidget {
  const SubclassesPage({required this.classId, super.key});
  final String classId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subclasses')),
      body: const SafeArea(child: Center(child: Text('Página de subclasses'))),
    );
  }
}
