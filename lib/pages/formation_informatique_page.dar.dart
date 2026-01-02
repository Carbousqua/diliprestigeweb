import 'package:flutter/material.dart';

class FormationInformatiquePage extends StatelessWidget {
  const FormationInformatiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formation Informatique')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          '''
• Bureautique (Word, Excel, PowerPoint)
• Programmation (Python, Flutter)
• Informatique générale
• Design graphique

Durée flexible – Certificat inclus
          ''',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
