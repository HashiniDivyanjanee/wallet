import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/screens/onboarding._screen.dart';
import 'package:wallet/services/user_data.dart';
import 'package:wallet/widget/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserDataService().CheckSavedUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          bool hasUsername = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(showMainScreen: hasUsername),
          );
        }
      },
    );
  }
}
