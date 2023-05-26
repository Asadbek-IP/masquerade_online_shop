import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/constants/theme.dart';
import 'package:maskarad_online_shop/firebase_helper/firebase_auth_helper.dart/firebase_auth_helper.dart';
import 'package:maskarad_online_shop/firebase_helper/firebase_options/firebase_options.dart';
import 'package:maskarad_online_shop/provider/app_provider.dart';
import 'package:maskarad_online_shop/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:maskarad_online_shop/screens/home/home.dart';
import 'package:maskarad_online_shop/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CustomBottomBar();
            }
            return const Welcome();
          },
        ),
      ),
    );
  }
}
