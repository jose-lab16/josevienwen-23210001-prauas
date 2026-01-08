import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 🔹 NavBar sebagai StatefulWidget tetap dipakai agar hover effect jalan
class NavBar extends StatefulWidget {
  final VoidCallback? onMenuPressed;

  const NavBar({super.key, this.onMenuPressed});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static const List<String> _navItems = [
    'Home',
    'Works',
    'Blog',
    'About',
    'Contact',
  ];
  final List<bool> _isHovered = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Burger menu (hanya satu di sini)
        IconButton(
          onPressed: widget.onMenuPressed, // ← callback ke parent
          icon: const Icon(Icons.menu, color: Colors.black),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),

        const Spacer(),

        // Menu hover
        for (int i = 0; i < _navItems.length; i++)
          MouseRegion(
            onEnter: (_) => setState(() => _isHovered[i] = true),
            onExit: (_) => setState(() => _isHovered[i] = false),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: Text(
                _navItems[i],
                style: GoogleFonts.roboto(
                  fontSize: _isHovered[i] ? 30 : 20,
                  color: Colors.black,
                  decoration: _isHovered[i]
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: const Color(0xFF64FFDA),
                  decorationThickness: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
