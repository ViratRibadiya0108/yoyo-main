import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconnection/core/constants/provaider/auth_provaider.dart';
import 'package:firebaseconnection/core/constants/provaider/category_provider.dart';
import 'package:firebaseconnection/core/constants/provaider/provaider_cart.dart';


import 'package:firebaseconnection/wrapper.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  
  );
  
  //   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth(),),
        ChangeNotifierProvider(create: (context) => CategoryProvider(),),
        ChangeNotifierProvider(create: (context) => ProvaiderCart(),)
        // ChangeNotifierProvider(create: (context)=> AllCategoryProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Wrapper(),
      ),
    );
  }
}


