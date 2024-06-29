import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'profile.dart';
import 'fiction_1.dart';
import 'fiction_2.dart';
import 'fiction_4.dart';
import 'fiction_41.dart';
import 'fiction_42.dart';
import 'fiction_6.dart';
import 'history_1.dart';
import 'history_2.dart';
import 'history_3.dart';
import 'history_4.dart';
import 'history_5.dart';
import 'history_6.dart';
import 'action_adventure_1.dart';
import 'action_adventure_2.dart';
import 'action_adventure_3.dart';
import 'action_adventure_4.dart';
import 'action_adventure_5.dart';
import 'action_adventure_6.dart';
import 'horror_1.dart';
import 'horror_2.dart';
import 'horror_3.dart';
import 'horror_4.dart';
import 'horror_5.dart';
import 'horror_6.dart';
import 'mystery_1.dart';
import 'mystery_2.dart';
import 'mystery_3.dart';
import 'mystery_4.dart';
import 'mystery_5.dart';
import 'mystery_6.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  List<Map<String, dynamic>> books = [
    // Fiction books
    {
      'title': 'The philosopher’s stone',
      'image': 'assets/images/image_1.png',
      'page': const Fiction1(),
    },
    {
      'title': 'The prisoner of azkaban',
      'image': 'assets/images/image_4.png',
      'page': const Fiction2(),
    },
    {
      'title': 'The chamber of secrets',
      'image': 'assets/images/image_3.png',
      'page': const Fiction42(),
    },
    {
      'title': 'The goblet of fire',
      'image': 'assets/images/image_5.png',
      'page': const Fiction41(),
    },
    {
      'title': 'The order of the phoenix',
      'image': 'assets/images/image_6.png',
      'page': const Fiction4(),
    },
    {
      'title': 'The half blood prince',
      'image': 'assets/images/image_7.png',
      'page': const Fiction6(),
    },
    // History books
    {
      'title': 'After 1177 B.C.: The Survival of Civilizations',
      'image': 'assets/images/image_19.png',
      'page': const History1(),
    },
    {
      'title': 'The Demon of Unrest',
      'image': 'assets/images/image_20.png',
      'page': const History2(),
    },
    {
      'title': 'The Wide Wide Sea',
      'image': 'assets/images/image_21.png',
      'page': const History3(),
    },
    {
      'title': 'The Swans of Harlem',
      'image': 'assets/images/image_22.png',
      'page': const History4(),
    },
    {
      'title': 'Hell Put to Shame',
      'image': 'assets/images/image_23.png',
      'page': const History5(),
    },
    {
      'title': 'The Rulebreaker',
      'image': 'assets/images/image_24.png',
      'page': const History6(),
    },
    // Action & Adventure books
    {
      'title': 'The Hunger Games',
      'image': 'assets/images/frame_11712754351.jpeg',
      'page': const ActionAdventure1(),
    },
    {
      'title': 'The Da Vinci Code',
      'image': 'assets/images/frame_1171275436.jpeg',
      'page': const ActionAdventure2(),
    },
    {
      'title': 'The Three Musketeers',
      'image': 'assets/images/frame_1171275437.jpeg',
      'page': const ActionAdventure3(),
    },
    {
      'title': 'The Count of Monte Cristo',
      'image': 'assets/images/frame_1171275438.jpeg',
      'page': const ActionAdventure4(),
    },
    {
      'title': 'A Game of Thrones',
      'image': 'assets/images/frame_1171275439.jpeg',
      'page': const ActionAdventure5(),
    },
    {
      'title': 'The Bourne Identity',
      'image': 'assets/images/frame_1171275440.jpeg',
      'page': const ActionAdventure6(),
    },
    // Horror books
    {
      'title': 'The Haunting of Hill House',
      'image': 'assets/images/frame_1171275441.jpeg',
      'page': const Horror1(),
    },
    {
      'title': 'Your Blood, My Bones',
      'image': 'assets/images/frame_1171275442.jpeg',
      'page': const Horror2(),
    },
    {
      'title': 'Bless Your Heart',
      'image': 'assets/images/frame_11712754361.jpeg',
      'page': const Horror3(),
    },
    {
      'title': 'The Black Girl Survives in This One',
      'image': 'assets/images/frame_1171275443.jpeg',
      'page': const Horror4(),
    },
    {
      'title': 'Ghost Station',
      'image': 'assets/images/frame_1171275435.png',
      'page': const Horror5(),
    },
    {
      'title': 'The Gathering',
      'image': 'assets/images/frame_1171275444.jpeg',
      'page': const Horror6(),
    },
    // Mystery books
    {
      'title': 'Murder on the Orient Express',
      'image': 'assets/images/image_191.png',
      'page': const Mystery2(),
    },
    {
      'title': 'Mr. Mercedes',
      'image': 'assets/images/image_253.png',
      'page': const Mystery1(),
    },
    {
      'title': 'Case Histories',
      'image': 'assets/images/image_282.png',
      'page': const Mystery3(),
    },
    {
      'title': 'Bury Your Dead',
      'image': 'assets/images/image_271.png',
      'page': const Mystery4(),
    },
    {
      'title': 'Crime and punishment',
      'image': 'assets/images/image_28.png',
      'page': const Mystery5(),
    },
    {
      'title': 'Kill Her Twice',
      'image': 'assets/images/image_29.png',
      'page': const Mystery6(),
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchResults = books.where((book) {
        final bookTitle = book['title'].toString().toLowerCase();
        final searchQuery = _searchController.text.toLowerCase();
        return bookTitle.contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }
        },
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          padding: const EdgeInsets.fromLTRB(2, 27, 2, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/bookpad_high_resolution_logo_black_1_photoroom_png_photoroom_3.png',
                    width: 166,
                    height: 110,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Search for the book that you want',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0x80000000),
                      ),
                    ),
                    const SizedBox(height: 43),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xEDFAFAFA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color(0x993C3C43),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: const Color(0x993C3C43),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _searchController.clear();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Color(0x993C3C43),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _searchResults.isEmpty
                    ? Center(
                        child: Text(
                          'No results found',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0x80000000),
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final book = _searchResults[index];
                          return _buildBookItem(
                            context,
                            book['image'],
                            book['title'],
                            book['page'],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookItem(
      BuildContext context, String imagePath, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
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
