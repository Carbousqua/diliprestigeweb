import 'package:flutter/material.dart';

class FormationAnglaisPage extends StatelessWidget {
  const FormationAnglaisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.indigo.shade800,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Formation Anglais', style: TextStyle(fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade900, Colors.indigo.shade400],
                  ),
                ),
                child: Icon(Icons.translate_rounded, size: 100, color: Colors.white.withOpacity(0.2)),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionTitle('Parlez Anglais avec Assurance'),
                const SizedBox(height: 20),
                _buildOptionCard('Anglais Débutant', 'Les bases essentielles pour commencer à communiquer rapidement.', Icons.star_border),
                _buildOptionCard('Anglais Intermédiaire', 'Renforcez votre grammaire et enrichissez votre vocabulaire.', Icons.star_half),
                _buildOptionCard('Anglais Professionnel', 'Maîtrisez le jargon des affaires et les présentations.', Icons.business_center),
                _buildOptionCard('Conversation Pratique', 'Séances intensives de discussion avec des formateurs qualifiés.', Icons.forum),
                const SizedBox(height: 40),
                _buildMethodBox(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
    );
  }

  Widget _buildOptionCard(String title, String desc, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.indigo.shade50, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.indigo.shade800),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(desc, style: TextStyle(color: Colors.grey.shade600)),
        ),
      ),
    );
  }

  Widget _buildMethodBox() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.indigo.shade800, Colors.blue.shade700]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.indigo.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: const [
          Icon(Icons.auto_awesome, color: Colors.amber, size: 40),
          SizedBox(height: 16),
          Text(
            'Méthode Immersive',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Apprenez par la pratique avec des mises en situation réelles et des outils interactifs.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
