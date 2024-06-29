import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart'; // Import this for date formatting
import 'search_1.dart'; // Import the Search1 widget
import 'package:flutter_app/pages/homepage.dart'; // Import the Homepage widget
import 'package:flutter_app/pages/frontpage.dart'; // Import the FrontPage widget

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  Map<String, dynamic>? _userData;
  bool _passwordVisible = false; // State variable for password visibility
  bool _isSubscriptionExpired =
      false; // State variable for subscription expiration

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    _user = _auth.currentUser;
    if (_user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(_user!.uid)
          .get();
      setState(() {
        _userData = userDoc.data() as Map<String, dynamic>?;
        if (_userData?['Subscription Expiry'] != null) {
          DateTime expiryDate =
              (_userData!['Subscription Expiry'] as Timestamp).toDate();
          _isSubscriptionExpired = expiryDate.isBefore(DateTime.now());
        } else {
          _isSubscriptionExpired = true;
        }
      });
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              _buildProfilePicture(),
              _buildProfileField(
                  'Email', _userData?['Email'] ?? 'Loading...', Icons.email),
              _buildProfileField('Phone', _userData?['Phone'] ?? 'Loading...',
                  Icons.phone_android),
              _buildPasswordField(),
              _buildSubscriptionField(),
              const SizedBox(height: 25),
              _buildLogoutButton(),
              const SizedBox(height: 25),
              _buildRenewSubscriptionButton(),
              const SizedBox(height: 25), // Adjusted the spacing
              _buildHomepageButton(),
              const SizedBox(height: 21),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            width: 45,
            height: 45,
          ),
          SvgPicture.asset(
            'assets/vectors/vector_28_x2.svg',
            width: 30.2,
            height: 17.5,
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      margin: const EdgeInsets.only(bottom: 26.5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/ellipse_37.jpeg.jpeg',
            width: 112,
            height: 113,
          ),
          Positioned(
            bottom: 0,
            child: Text(
              _userData?['Full Name'] ?? 'Loading...',
              style: GoogleFonts.getFont(
                'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: const Color(0xFF262422),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileField(String label, String placeholder, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(icon, color: const Color(0xFF888888)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    placeholder,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: const Color(0xFF888888),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: const Color(0xFF262422),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF1ECEC)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/vectors/circle_lock_012_x2.svg',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _passwordVisible
                        ? (_userData?['Password'] ?? '*************')
                        : '*************',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFFABABAB),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: SvgPicture.asset(
                    _passwordVisible
                        ? 'assets/vectors/view_on_1_x2.svg'
                        : 'assets/vectors/view_off_1_x2.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscription expiring date',
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: const Color(0xFF262422),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.5),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF1ECEC)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type: ${_userData?['Subscription Type'] ?? 'NA'}',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFFABABAB),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _userData != null && _userData!['Subscription Expiry'] != null
                      ? DateFormat('dd/MM/yyyy').format(
                          (_userData!['Subscription Expiry'] as Timestamp)
                              .toDate())
                      : 'NA',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xFFABABAB),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 11.5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEE8924)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Frontpage()),
          );
        },
        child: Text(
          'Logout',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: const Color(0xFFEE8924),
          ),
        ),
      ),
    );
  }

  Widget _buildRenewSubscriptionButton() {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF000000),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 1,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Search1()),
          );
        },
        child: Text(
          'Renew subscription',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }

  Widget _buildHomepageButton() {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _isSubscriptionExpired ? Colors.grey : const Color(0xFF000000),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 1,
          ),
        ],
      ),
      child: TextButton(
        onPressed: _isSubscriptionExpired
            ? null
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
        child: Text(
          'Homepage',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
