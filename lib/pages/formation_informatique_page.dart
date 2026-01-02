import 'package:flutter/material.dart';

class FormationInformatiquePage extends StatelessWidget {
  const FormationInformatiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Informatique', style: TextStyle(fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade800, Colors.blue.shade500],
                  ),
                ),
                child: Icon(Icons.computer, size: 100, color: Colors.white.withOpacity(0.3)),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionTitle('Nos Modules de Formation'),
                const SizedBox(height: 20),
                _buildModuleCard('Bureautique', 'Maîtrisez Word, Excel et PowerPoint pour une productivité accrue.', Icons.description),
                _buildModuleCard('Programmation', 'Apprenez Python et Flutter pour créer des applications modernes.', Icons.code),
                _buildModuleCard('Design Graphique', 'Conception visuelle, logos et supports de communication.', Icons.brush),
                _buildModuleCard('Maintenance', 'Installation de systèmes et dépannage informatique.', Icons.settings_suggest),
                const SizedBox(height: 40),
                _buildInfoBox(),
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

  Widget _buildModuleCard(String title, String desc, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue.shade800),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(desc, style: TextStyle(color: Colors.grey.shade600)),
        ),
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Column(
        children: const [
          Icon(Icons.verified, color: Colors.amber, size: 40),
          SizedBox(height: 16),
          Text(
            'Certificat de fin de formation inclus',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Des sessions flexibles adaptées à votre emploi du temps.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
