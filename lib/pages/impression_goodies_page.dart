import 'package:flutter/material.dart';

class ImpressionGoodiesPage extends StatelessWidget {
  const ImpressionGoodiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildHeader(),
                const SizedBox(height: 80),
                const InteractiveServicesSection(),
                const SizedBox(height: 80),
                _buildSectionTitle('Nos Produits Phares'),
                const SizedBox(height: 30),
                _buildProductGallery(),
                const SizedBox(height: 80),
                _buildQualitySection(),
                const SizedBox(height: 80),
                _buildCTASection(context),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // ===================== APP BAR =====================
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: const Color(0xFF004D40),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text(
          'IMPRESSION & GOODIES',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.4),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1626785774573-4b799315345d?q=80&w=2071&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    const Color(0xFF004D40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===================== HEADER =====================
  Widget _buildHeader() {
    return Column(
      children: [
        const Text(
          'Valorisez votre image de marque',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Color(0xFF004D40),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 70,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Impression professionnelle et supports de communication modernes pour entreprises et événements.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      ],
    );
  }

  // ===================== TITRE SECTION =====================
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF004D40),
      ),
    );
  }

  // ===================== PRODUITS =====================
  Widget _buildProductGallery() {
    final products = [
      {
        'name': 'T-shirts personnalisés',
        'image':
        'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=1974&auto=format&fit=crop',
        'desc': 'DTF, sérigraphie et sublimation haute qualité',
      },
      {
        'name': 'Mugs & Bols',
        'image':
        'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?q=80&w=2070&auto=format&fit=crop',
        'desc': 'Marquage durable et finition premium',
      },
      {
        'name': 'Flyers & Affiches',
        'image':
        'https://images.unsplash.com/photo-1560053608-13721e0d69e8?q=80&w=2070&auto=format&fit=crop',
        'desc': 'Supports publicitaires impactants',
      },
      {
        'name': 'Goodies événementiels',
        'image':
        'https://images.unsplash.com/photo-1516733725897-1aa73b87c8e8?q=80&w=2070&auto=format&fit=crop',
        'desc': 'Stylos, sacs, porte-clés personnalisés',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.25,
          ),
          itemBuilder: (_, index) =>
              _buildProductCard(products[index]),
        );
      },
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(24)),
              child: Image.network(
                product['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004D40),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product['desc']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===================== QUALITÉ =====================
  Widget _buildQualitySection() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.teal.shade50),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.verified, color: Colors.amber, size: 50),
          SizedBox(height: 20),
          Text(
            'Qualité & Fiabilité',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Nous utilisons des technologies modernes pour garantir une impression durable, nette et professionnelle.',
            style: TextStyle(fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }

  // ===================== CTA =====================
  Widget _buildCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF004D40), Color(0xFF00695C)],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Besoin d’un devis ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Contactez-nous et obtenez une réponse rapide.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: const Color(0xFF004D40),
              padding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'DEMANDER UN DEVIS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// ===================== SERVICES INTERACTIFS =====================
class InteractiveServicesSection extends StatefulWidget {
  const InteractiveServicesSection({super.key});

  @override
  State<InteractiveServicesSection> createState() =>
      _InteractiveServicesSectionState();
}

class _InteractiveServicesSectionState
    extends State<InteractiveServicesSection> {
  int hovered = -1;

  final services = [
    {
      'title': 'Impression professionnelle',
      'desc':
      'Impression DTF, UV et sublimation sur textiles et objets.',
      'image':
      'https://images.unsplash.com/photo-1581092160562-40aa08e78837?q=80&w=2070&auto=format&fit=crop',
    },
    {
      'title': 'Création de Flyers',
      'desc':
      'Design graphique moderne pour flyers, affiches et supports marketing.',
      'image':
      'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=2070&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(services.length, (index) {
        final isHovered = hovered == index;
        return Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() => hovered = index),
            onExit: (_) => setState(() => hovered = -1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 420,
              transform:
              isHovered ? (Matrix4.identity()..scale(1.03)) : null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: isHovered ? 30 : 15,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      services[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    bottom: 0,
                    left: isHovered ? 0 : 40,
                    right: isHovered ? 0 : -40,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.85),
                          ],
                        ),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            services[index]['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: isHovered ? 1 : 0,
                            child: Text(
                              services[index]['desc']!,
                              style: const TextStyle(
                                color: Colors.white70,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
