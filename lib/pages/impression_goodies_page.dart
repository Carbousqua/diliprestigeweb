import 'package:flutter/material.dart';

class ImpressionGoodiesPage extends StatelessWidget {
  const ImpressionGoodiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.teal.shade800,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Impression & Goodies', style: TextStyle(fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade900, Colors.teal.shade400],
                  ),
                ),
                child: Icon(Icons.print_rounded, size: 100, color: Colors.white.withOpacity(0.2)),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionTitle('Donnez vie à vos idées'),
                const SizedBox(height: 20),
                _buildProductGrid(),
                const SizedBox(height: 40),
                _buildQualityBanner(),
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
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF004D40)),
    );
  }

  Widget _buildProductGrid() {
    final products = [
      {'name': 'T-shirts', 'icon': Icons.checkroom},
      {'name': 'Mugs & Bols', 'icon': Icons.coffee},
      {'name': 'Flyers & Affiches', 'icon': Icons.layers},
      {'name': 'Stickers', 'icon': Icons.label},
      {'name': 'Calendriers', 'icon': Icons.calendar_month},
      {'name': 'Goodies Event', 'icon': Icons.celebration},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            border: Border.all(color: Colors.teal.shade50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(products[index]['icon'] as IconData, color: Colors.teal, size: 30),
              const SizedBox(height: 8),
              Text(
                products[index]['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQualityBanner() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          Icon(Icons.high_quality, color: Colors.amber, size: 40),
          SizedBox(height: 16),
          Text(
            'Haute Qualité d\'Impression',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Nous utilisons les meilleures technologies pour un rendu professionnel et durable sur tous vos supports.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
  }
}
