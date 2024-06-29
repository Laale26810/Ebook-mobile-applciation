import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment.dart';

class SubscriptionPrices extends StatelessWidget {
  const SubscriptionPrices({super.key});

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/images/bookpad_high_resolution_logo_black_1_photoroom_png_photoroom_3.png',
                    width: 166,
                    height: 110,
                  ),
                ),
                const SizedBox(height: 20),
                _buildPlanHeader('Monthly', const Color(0xFFF8BB15)),
                const SizedBox(height: 20),
                _buildPlanPrice(
                    context, '9.99\$/Month', const Color(0xFFF8BB15), 1),
                const SizedBox(height: 30),
                _buildPlanHeader('Trimonthly', const Color(0xFFF8BB15)),
                const SizedBox(height: 20),
                _buildPlanPrice(
                    context, '20.99\$/3 Month', const Color(0xFFF8BB15), 3),
                const SizedBox(height: 30),
                _buildPlanHeader('Yearly', const Color(0xFFF8BB15)),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Best value!',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildPlanPrice(
                    context, '69.99\$/Year', const Color(0xFFF8BB15), 12),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanHeader(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.getFont(
            'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPlanPrice(
      BuildContext context, String price, Color color, int duration,
      {Color textColor = Colors.black}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PaymentPage(price: price, color: color, duration: duration),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: Center(
          child: Text(
            price,
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
