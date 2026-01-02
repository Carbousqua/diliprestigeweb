import 'package:flutter/material.dart';
import 'dart:ui';
import '../pages/contact_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onServicesTap;
  final VoidCallback? onHomeTap;
  final VoidCallback? onContactTap;

  const AppBarWidget({
    super.key,
    this.onServicesTap,
    this.onHomeTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.8),
          elevation: 0,
          leadingWidth: 300,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: onHomeTap ?? () => Navigator.of(context).popUntil((route) => route.isFirst),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                    ),
                    child: Image.asset(
                      'assets/images/Logo.png',
                      height: 55,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.business, color: Color(0xFF050A30), size: 40);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Dili Prestige',
                  style: TextStyle(
                    color: Color(0xFF050A30),
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            _navItem('ACCUEIL', isSelected: true, onTap: onHomeTap),
            _navItem('SERVICES', onTap: onServicesTap),
            _navItem('À PROPOS'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  onPressed: onContactTap ?? () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                  ),
                  child: const Text('CONTACT', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, {bool isSelected = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF050A30),
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);
}
