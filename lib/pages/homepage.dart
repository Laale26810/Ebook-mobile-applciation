import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart'; // Import the profile page
import 'search.dart'; // Import the search page
import 'fiction.dart';
import 'history.dart';
import 'mystery.dart';
import 'horror.dart';
import 'action_adventure.dart';
import 'favorites.dart'; // Assuming you have a Favorites page
import 'book_request_form.dart'; // Assuming you have a Book Request Form page

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          padding: const EdgeInsets.fromLTRB(2, 43, 2, 0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 2, 20),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/bookpad_high_resolution_logo_black_1_photoroom_png_photoroom_3.png',
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: 156,
                    height: 92,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCategoryButton(
                    context,
                    'assets/images/button_primary_3.png',
                    'Fiction',
                    const Color(0xFF000000),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Fiction()),
                      );
                    },
                  ),
                  _buildCategoryButton(
                    context,
                    'assets/images/button_primary_1.png',
                    'Action & Adventure',
                    const Color(0xFFFFFFFF),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ActionAdventure()),
                      );
                    },
                  ),
                  _buildCategoryButton(
                    context,
                    'assets/images/button_primary.jpeg',
                    'History',
                    const Color(0xFF000000),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const History()),
                      );
                    },
                  ),
                  _buildCategoryButton(
                    context,
                    'assets/images/button_primary_4.jpeg',
                    'Mystery',
                    const Color(0xFFFFFFFF),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mystery()),
                      );
                    },
                  ),
                  _buildCategoryButton(
                    context,
                    'assets/images/button_primary_2.jpeg',
                    'Horror',
                    const Color(0xFFFFFFFF),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Horror()),
                      );
                    },
                  ),
                  const SizedBox(height: 30), // Add space below Horror button
                  _buildSmallCategoryButton(
                    context,
                    'Favorites',
                    const Color(0xFFFFFFFF),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Favorites()),
                      );
                    },
                  ),
                  const SizedBox(height: 10), // Add space between buttons
                  _buildSmallCategoryButton(
                    context,
                    'Book Request',
                    const Color(0xFFFFFFFF),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookRequestForm()),
                      );
                    },
                  ),
                ],
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
            // Already on homepage
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

  Widget _buildCategoryButton(BuildContext context, String imagePath,
      String title, Color textColor, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0.4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              offset: Offset(0, 1),
              blurRadius: 1,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 0.4),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.5,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmallCategoryButton(
      BuildContext context, String title, Color textColor, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black, // Black background for the button
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.getFont(
              'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 15, // Smaller font size for these buttons
              height: 1.5,
              color: textColor, // White text
            ),
          ),
        ),
      ),
    );
  }
}
