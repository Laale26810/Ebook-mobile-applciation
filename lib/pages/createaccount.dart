import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/pages/profile.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _termsAccepted = false;
  bool _isLoading = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print("CreateAccount page initialized");
  }

  @override
  Widget build(BuildContext context) {
    print("Build method called");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          padding: const EdgeInsets.fromLTRB(16, 27, 16, 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/bookpad_high_resolution_logo_black_1_photoroom_png_photoroom_3.png',
                    width: 45,
                    height: 45,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Create your account',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    height: 1.2,
                    letterSpacing: 0.5,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 30),
                _buildTextField('Username', 'ex: Alex ', _fullNameController,
                    TextInputType.name),
                const SizedBox(height: 20),
                _buildTextField('Email', 'ex: URNAME@email.com',
                    _emailController, TextInputType.emailAddress),
                const SizedBox(height: 20),
                _buildTextField('Phone', '+212 6 ** ** ** **', _phoneController,
                    TextInputType.phone),
                const SizedBox(height: 20),
                _buildPasswordField(
                    'Password', '*', _passwordController, _passwordVisible, () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                }),
                const SizedBox(height: 20),
                _buildPasswordField('Confirm Password', '*',
                    _confirmPasswordController, _confirmPasswordVisible, () {
                  setState(() {
                    _confirmPasswordVisible = !_confirmPasswordVisible;
                  });
                }),
                const SizedBox(height: 20),
                _buildTermsAndPolicy(context),
                const SizedBox(height: 20),
                _buildSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      TextEditingController controller, TextInputType inputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.getFont(
            'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.2,
            letterSpacing: 0.3,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              hintStyle: GoogleFonts.getFont(
                'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: const Color(0xFF888888),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your $label';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(
      String label,
      String hint,
      TextEditingController controller,
      bool visible,
      VoidCallback toggleVisibility) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.getFont(
            'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.2,
            letterSpacing: 0.3,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF1ECEC)),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  obscureText: !visible,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFFABABAB),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your $label';
                    }
                    if (label == 'Confirm Password' &&
                        value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              InkWell(
                onTap: toggleVisibility,
                child: SvgPicture.asset(
                  visible
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
    );
  }

  Widget _buildTermsAndPolicy(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _termsAccepted = !_termsAccepted;
            });
          },
          child: Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF9C5A46)),
              borderRadius: BorderRadius.circular(1),
              color:
                  _termsAccepted ? const Color(0xFF9C5A46) : Colors.transparent,
            ),
          ),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.3,
              color: const Color(0xFF000000),
            ),
            children: [
              const TextSpan(
                text: 'I understood the ',
              ),
              TextSpan(
                text: 'terms & policy',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.3,
                  color: const Color(0xFFE91B1B),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _showTermsAndPolicy(context);
                  },
              ),
              const TextSpan(
                text: '.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showTermsAndPolicy(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terms & Policy',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Welcome to Bookpad!',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'At Bookpad, we prioritize your privacy and strive to protect your personal information. By using our services, you agree to the terms and policies outlined below:',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '1. Data Collection:',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'We collect data to improve your experience. This includes your name, email, phone number, and password.',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '2. Data Usage:',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Your data is used to personalize your experience, provide customer support, and improve our services.',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '3. Data Sharing:',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'We do not share your personal data with third parties without your consent, except as required by law.',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '4. Security:',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'We implement security measures to protect your data. However, we cannot guarantee complete security.',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '5. Changes to Terms:',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'We may update our terms and policies. We will notify you of any changes.',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '6. Contact Us:',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'If you have any questions, please contact us at support@bookpad.com.',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Close',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSignUpButton() {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: _termsAccepted
                  ? () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });

                        final emailAddress = _emailController.text;
                        final password = _passwordController.text;
                        final fullName = _fullNameController.text;
                        final phone = _phoneController.text;

                        try {
                          print("Creating user...");
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailAddress,
                            password: password,
                          );

                          print("Saving user data to Firestore...");
                          // Save user data to Firestore
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(credential.user!.uid)
                              .set({
                            'Full Name': fullName,
                            'Email': emailAddress,
                            'Phone': phone,
                            'Password':
                                password, // Do not store passwords in plain text in a real app
                          });

                          print('User created: ${credential.user?.email}');

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            _isLoading = false;
                          });
                          String errorMessage;
                          if (e.code == 'weak-password') {
                            errorMessage = 'The password provided is too weak.';
                          } else if (e.code == 'email-already-in-use') {
                            errorMessage =
                                'The account already exists for that email.';
                          } else if (e.code == 'invalid-email') {
                            errorMessage = 'The email address is not valid.';
                          } else {
                            errorMessage =
                                'An error occurred. Please try again.';
                          }
                          _showErrorDialog(errorMessage);
                          print('Error: ${e.message}');
                        } catch (e) {
                          setState(() {
                            _isLoading = false;
                          });
                          _showErrorDialog(
                              'An unexpected error occurred. Please try again.');
                          print('Unexpected Error: $e');
                        } finally {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 130),
                backgroundColor: _termsAccepted ? Colors.black : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'SIGN UP',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
