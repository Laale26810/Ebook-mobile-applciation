import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'favorites.dart'; // Import the Favorites page
import 'profile.dart'; // Import the profile page
import 'search.dart'; // Import the search page
import 'homepage.dart'; // Import the homepage

class History5 extends StatelessWidget {
  const History5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    'assets/vectors/vector_40_x2.svg',
                    width: 24.8,
                    height: 15.5,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/bookpad_high_resolution_logo_black_1_photoroom_png_photoroom_3.png',
                    width: 45,
                    height: 45,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image_23.png'),
                        ),
                      ),
                      width: 77.6,
                      height: 121,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hell Put to Shame',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 1.2,
                              color: const Color(0xFF262422),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '“Hell Put to Shame is a powerfully unsettling portrait of the single most savage episode in the long decades of savagery inflicted by white southerners on their Black neighbors in the 20th century—and the methodical process that followed to erase those crimes from America’s collective memory.',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              height: 1.4,
                              color: const Color(0xFFABABAB),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 0),
                        blurRadius: 17.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/image_25.png',
                        width: 53,
                        height: 53,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Author',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              height: 1.4,
                              color: const Color(0xFFABABAB),
                            ),
                          ),
                          Text(
                            'Earl Swift',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1.2,
                              letterSpacing: -0.4,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'About the book',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    height: 1.4,
                    color: const Color(0xFF547DBE),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '“Hell Put to Shame” is a poignant tale of resilience in the face of adversity. It follows the journey of a protagonist who confronts life’s hardships with unwavering determination, ultimately triumphing over seemingly insurmountable obstacles. Through courage, perseverance, and a steadfast belief in oneself, the protagonist emerges victorious, proving that even in the darkest of times, there is always hope for redemption and transformation.',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    height: 1.4,
                    color: const Color(0x80000000),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        CollectionReference favorites = FirebaseFirestore
                            .instance
                            .collection('Users')
                            .doc(user.uid)
                            .collection('Favorites');

                        await favorites.add({
                          'image': 'assets/images/image_23.png',
                          'title': 'Hell Put to Shame',
                          'author': 'Earl Swift',
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Favorites(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 64,
                      ),
                      backgroundColor: const Color(0xFF000000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Add to favorites',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.5,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }
        },
      ),
    );
  }
}
