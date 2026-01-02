import 'package:flutter/material.dart';
import 'dart:ui';
import '../widgets/app_bar_widget.dart';
import 'formation_informatique_page.dart';
import 'formation_anglais_page.dart';
import 'impression_goodies_page.dart';
import 'contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _servicesKey = GlobalKey();

  void _scrollToServices() {
    Scrollable.ensureVisible(
      _servicesKey.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        onHomeTap: _scrollToTop,
        onServicesTap: _scrollToServices,
        onContactTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage()));
        },
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildModernHero(context),
            _buildStatsSection(),
            _buildGlassServices(context, key: _servicesKey),
            _buildCreativeSection(context),
            _buildTestimonialSection(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildModernHero(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF050A30),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: _blurCircle(Colors.blue.withOpacity(0.3), 300),
          ),
          Positioned(
            bottom: 50,
            right: -50,
            child: _blurCircle(Colors.amber.withOpacity(0.2), 250),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'L\'AGENCE DE RÉFÉRENCE AU MALI',
                    style: TextStyle(color: Colors.amber, letterSpacing: 2, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Propulsez votre\nAvenir Digital',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.0,
                    shadows: [Shadow(color: Colors.black26, offset: Offset(0, 10), blurRadius: 20)],
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Expertise en Formation IT, Langues et Communication Visuelle.',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                const SizedBox(height: 45),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _heroButton('NOS SERVICES', Colors.amber, const Color(0xFF050A30), onPressed: _scrollToServices),
                    const SizedBox(width: 20),
                    _heroButton('NOUS CONTACTER', Colors.white.withOpacity(0.1), Colors.white, isOutline: true, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage()));
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _blurCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: Container(color: Colors.transparent),
      ),
    );
  }

  Widget _heroButton(String text, Color bgColor, Color textColor, {bool isOutline = false, VoidCallback? onPressed}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: isOutline ? null : [BoxShadow(color: bgColor.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isOutline ? const BorderSide(color: Colors.white24) : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1)),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      color: Colors.white,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 100,
        runSpacing: 40,
        children: [
          _statItem('500+', 'Étudiants Formés'),
          _statItem('98%', 'Satisfaction Client'),
          _statItem('10+', 'Années d\'Expérience'),
          _statItem('50+', 'Partenaires'),
        ],
      ),
    );
  }

  Widget _statItem(String val, String label) {
    return Column(
      children: [
        Text(val, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Color(0xFF050A30))),
        Text(label, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildGlassServices(BuildContext context, {Key? key}) {
    return Container(
      key: key,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF8FAFC),
      ),
      child: Column(
        children: [
          const Text('CE QUE NOUS FAISONS', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 15),
          const Text('Des solutions sur mesure', style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Color(0xFF050A30))),
          const SizedBox(height: 60),
          LayoutBuilder(builder: (context, constraints) {
            return Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _glassCard(context, 'Formation IT', Icons.terminal, 'Développement, Bureautique & Design.', const Color(0xFF3B82F6), const FormationInformatiquePage()),
                _glassCard(context, 'Langues', Icons.public, 'Maîtrisez l\'Anglais pro en 3 mois.', const Color(0xFF8B5CF6), const FormationAnglaisPage()),
                _glassCard(context, 'Impression', Icons.auto_awesome_motion, 'Goodies & Supports marketing.', const Color(0xFF10B981), const ImpressionGoodiesPage()),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _glassCard(BuildContext context, String title, IconData icon, String desc, Color color, Widget page) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        width: 350,
        height: 280,
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 30, offset: const Offset(0, 15)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
              child: Icon(icon, color: color, size: 30),
            ),
            const Spacer(),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF050A30))),
            const SizedBox(height: 12),
            Text(desc, style: TextStyle(color: Colors.grey.shade600, fontSize: 16, height: 1.5)),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('En savoir plus', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, color: color, size: 18),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCreativeSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
      child: Row(
        children: [
          if (MediaQuery.of(context).size.width > 900)
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 40,
                    child: Container(
                      height: 500,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('NOTRE PHILOSOPHIE', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text(
                  'Innover pour mieux vous accompagner',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF050A30), height: 1.1),
                ),
                const SizedBox(height: 30),
                _philosophyPoint('Qualité Premium', 'Nous ne faisons aucun compromis sur la qualité de nos formations.'),
                _philosophyPoint('Accompagnement', 'Un suivi personnalisé pour chaque étudiant et client.'),
                _philosophyPoint('Modernité', 'Des outils à la pointe de la technologie pour vos projets.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _philosophyPoint(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.amber, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF050A30))),
                Text(desc, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: const Color(0xFF050A30),
      child: Column(
        children: [
          const Text('TÉMOIGNAGES', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 50),
                _testimonialCard('Alioune B.', 'La formation en Flutter a changé ma carrière !'),
                _testimonialCard('Fatoumata K.', 'Le service d\'impression est rapide et de haute qualité.'),
                _testimonialCard('Moussa D.', 'Un personnel très pro et accueillant. Je recommande.'),
                const SizedBox(width: 50),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _testimonialCard(String name, String quote) {
    return Container(
      width: 400,
      margin: const EdgeInsets.only(right: 30),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: Colors.amber, size: 40),
          const SizedBox(height: 20),
          Text(quote, style: const TextStyle(color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic)),
          const SizedBox(height: 30),
          Text(name, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: Colors.white,
      child: Column(
        children: [
          const Text('Prêt à commencer ?', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage())),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF050A30),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
            child: const Text('DISCUTONS DE VOTRE PROJET', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 80),
          const Divider(),
          const SizedBox(height: 40),
          const Text('© 2024 DILI PRESTIGE. Tous droits réservés.', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
