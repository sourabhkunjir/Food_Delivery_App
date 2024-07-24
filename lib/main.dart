import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';
import 'package:fooddeliveryapp/pages/splash_screen.dart';
// import 'package:fooddeliveryapp/services/auth_gate_services.dart';
import 'package:fooddeliveryapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  
  runApp(
    MultiProvider(
      providers: [
        //theme provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        //restaurant provider(for models data)
        ChangeNotifierProvider(
          create: (context) => Restaurant(),
        ),
      ],
      child: const MyRecipeApp(),
    ),
  );
}

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: "Food Reciepe App",
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          theme: themeProvider.themeData, //insert theme here
        );
      },
    );
  }
}


