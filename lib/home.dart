import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:josevienwen_23210001_prauas/nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

void _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _buildSocialIcon2({
  required String label,
  required String url,
  required String svgPath,
  required Color color,
}) {
  return IconButton(
    icon: SvgPicture.asset(svgPath, color: color, width: 35, height: 35),
    tooltip: label,
    onPressed: () => _launchUrl(url),
  );
}

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Builder(
          builder: (context) {
            return NavBar(
              onMenuPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF64FFDA),
                      width: 3,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'images/IMG_8542.jpeg',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.person, size: 40, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Josevien Wen',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon2(
                      label: 'Instagram',
                      url: 'https://instagram.com/josevien.wen',
                      svgPath: 'assets/icons/instagram.svg',
                      color: Colors.black,
                    ),
                    const SizedBox(width: 40),
                    _buildSocialIcon2(
                      label: 'Tiktok',
                      url: 'https://tiktok.com/@josvnwn',
                      svgPath: 'assets/icons/tiktok.svg',
                      color: Colors.black,
                    ),
                    const SizedBox(width: 40),
                    _buildSocialIcon2(
                      label: 'Whatsapp',
                      url: 'https://wa.me/6281319869047',
                      svgPath: 'assets/icons/whatsapp.svg',
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: const [HomePageContent(), AboutMeSection()]),
      ),
    );
  }

  Widget _buildSocialIcon1(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, size: 35, color: Colors.black),
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Buka $url')));
      },
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 280),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF64FFDA),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.zero,
                    ),
                  ),
                  child: Text(
                    'Hello I\'m',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  'Josevien Wen',
                  style: GoogleFonts.roboto(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Content Creator',
                  style: GoogleFonts.roboto(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                _buildContactRow(Icons.email, 'wenjosevien88@gmail.com'),
                const SizedBox(height: 15),
                _buildContactRow(Icons.phone, '+62 813 1986 9047'),
                const SizedBox(height: 15),
                _buildContactRow(Icons.location_on, 'Pontianak'),
              ],
            ),
          ),

          const SizedBox(width: 60),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF64FFDA), width: 4),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'images/IMG_8542.jpeg',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(Icons.person, size: 80, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black),
        const SizedBox(width: 12),
        Text(
          text,
          style: GoogleFonts.roboto(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 180),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 500,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/vector.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 80),

            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'About Me',
                    style: GoogleFonts.roboto(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Hai! Aku Josevien Wen, seorang Content Creator yang suka mengubah ide jadi konten yang engaging dan relatable. Mulai dari konsep, produksi, sampai editing, aku senang menciptakan konten yang bukan cuma enak dilihat, tapi juga punya cerita dan tujuan.',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 35),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _buildSkillBadge('Content Creation'),
                      _buildSkillBadge('Creative Copywriting'),
                      _buildSkillBadge('Content Strategy'),
                      _buildSkillBadge('Video Editing'),
                      _buildSkillBadge('Visual Storytelling'),
                      _buildSkillBadge('Photography & Reels'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildSkillBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF64FFDA)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
