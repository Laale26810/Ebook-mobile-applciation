import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Import your specific pages here
import 'fiction_1.dart';
import 'fiction_2.dart';
import 'fiction_42.dart';
import 'fiction_41.dart';
import 'fiction_4.dart';
import 'fiction_6.dart';
import 'profile.dart'; // Import the profile page
import 'search.dart'; // Import the search page
import 'homepage.dart'; // Import the homepage

class Fiction extends StatelessWidget {
  const Fiction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          padding: const EdgeInsets.fromLTRB(2, 40, 2, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/bookpad_high_resolution_logo_black_1_photoroom_png_photoroom_3.png',
                            ),
                          ),
                        ),
                        width: 156,
                        height: 92,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Fiction Books',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 1.2,
                          letterSpacing: -0.4,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'All your favorite Fiction books in one place',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: const Color(0x80000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBookItem(
                          context,
                          'assets/images/image_1.png',
                          'The philosopher’s stone',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Fiction1(),
                            ),
                          ),
                        ),
                        _buildBookItem(
                          context,
                          'assets/images/image_4.png',
                          'The prisoner of azkaban',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Fiction2(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBookItem(
                          context,
                          'assets/images/image_3.png',
                          'The chamber of secrets',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Fiction42(),
                            ),
                          ),
                        ),
                        _buildBookItem(
                          context,
                          'assets/images/image_5.png',
                          'The goblet of fire',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Fiction41(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBookItem(
                          context,
                          'assets/images/image_6.png',
                          'The order of the phoenix',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Fiction4(),
                            ),
                          ),
                        ),
                        _buildBookItem(
                          context,
                          'assets/images/image_7.png',
                          'The half blood prince',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Fiction6(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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

  Widget _buildBookItem(
      BuildContext context, String imagePath, String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 120,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 1.4,
                color: const Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
