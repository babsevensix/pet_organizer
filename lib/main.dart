import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/pages/home_screen.dart';
import 'package:pet_organizer/theme.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          themeMode: ThemeMode.light,
          darkTheme: darkTheme,
          theme: lightTheme,
        ),
      ),

    );
  });
}
