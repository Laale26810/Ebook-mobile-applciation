// ignore_for_file: unused_import, duplicate_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/pages/payment.dart';
import 'firebase_options.dart'; // Make sure this path is correct

import 'package:flutter_app/pages/action_adventure.dart';
import 'package:flutter_app/pages/action_adventure_1.dart';
import 'package:flutter_app/pages/action_adventure_2.dart';
import 'package:flutter_app/pages/action_adventure_3.dart';
import 'package:flutter_app/pages/action_adventure_4.dart';
import 'package:flutter_app/pages/action_adventure_5.dart';
import 'package:flutter_app/pages/action_adventure_6.dart';
import 'package:flutter_app/pages/book_request_form.dart';
import 'package:flutter_app/pages/createaccount.dart';
import 'package:flutter_app/pages/favorites.dart';
import 'package:flutter_app/pages/fiction.dart';
import 'package:flutter_app/pages/fiction_1.dart';
import 'package:flutter_app/pages/fiction_2.dart';
import 'package:flutter_app/pages/fiction_4.dart';
import 'package:flutter_app/pages/fiction_41.dart';
import 'package:flutter_app/pages/fiction_42.dart';
import 'package:flutter_app/pages/fiction_6.dart';
import 'package:flutter_app/pages/frontpage.dart';
import 'package:flutter_app/pages/history.dart';
import 'package:flutter_app/pages/history_1.dart';
import 'package:flutter_app/pages/history_2.dart';
import 'package:flutter_app/pages/history_3.dart';
import 'package:flutter_app/pages/history_4.dart';
import 'package:flutter_app/pages/history_5.dart';
import 'package:flutter_app/pages/history_6.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/horror.dart';
import 'package:flutter_app/pages/horror_1.dart';
import 'package:flutter_app/pages/horror_2.dart';
import 'package:flutter_app/pages/horror_3.dart';
import 'package:flutter_app/pages/horror_4.dart';
import 'package:flutter_app/pages/horror_5.dart';
import 'package:flutter_app/pages/horror_6.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/mystery.dart';
import 'package:flutter_app/pages/mystery_1.dart';
import 'package:flutter_app/pages/mystery_2.dart';
import 'package:flutter_app/pages/mystery_3.dart';
import 'package:flutter_app/pages/mystery_4.dart';
import 'package:flutter_app/pages/mystery_5.dart';
import 'package:flutter_app/pages/mystery_6.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/payment.dart';
import 'package:flutter_app/pages/search.dart';
import 'package:flutter_app/pages/search_1.dart';
import 'package:flutter_app/pages/subscription_prices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BookPad',
      home: Scaffold(
        //body: ActionAdventure(),
        //body: ActionAdventure1(),
        //body: ActionAdventure2(),
        //body: ActionAdventure3(),
        //body: ActionAdventure4(),
        //body: ActionAdventure5(),
        //body: ActionAdventure6(),
        //body: BookRequestForm(),
        //body: CreateAccount(),
        //body: Downloads(),
        //body: Favorites(),
        //body: Fiction(),
        //body: Fiction1(),
        //body: Fiction2(),
        //body: Fiction4(),
        //body: Fiction41(),
        // body: Fiction42(),
        //body: Fiction6(),
        body: Frontpage(),
        //body: History(),
        //body: History1(),
        //body: History2(),
        //body: History3(),
        //body: History4(),
        //body: History5(),
        //body: History6(),
        //body: Homepage(),
        //body: Horror(),
        //body: Horror1(),
        //body: Horror2(),
        //body: Horror3(),
        //body: Horror4(),
        //body: Horror5(),
        //body: Horror6(),
        //body: Login(),
        //body: Mystery(),
        //body: Mystery1(),
        //body: Mystery2(),
        //body: Mystery3(),
        //body: Mystery4(),
        //body: Mystery5(),
        //body: Mystery6(),
        //body: Profile(),
        //body: Search(),
        //body: Search1(),
        //body: SubscriptionPrices(),
        //body: PaymentPage(),
      ),
    );
  }
}
