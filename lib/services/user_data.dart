import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataService {
  // *** Store user details using share preferences ***
  static Future<void> storeUserDetails({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      // Check password and confirpassword are same
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password and Confirm Password are not mached'),
          ),
        );
        return;
      }
      // If password are same when save user details
      SharedPreferences preferences = await SharedPreferences.getInstance();

      // Store the details as key value pairs
      await preferences.setString('username', username);
      await preferences.setString('email', email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User Details Stored Successfuly')),
      );
    } catch (e) {
      e.toString();
    }
  }

  // *** Check if the username is stored in share preferences ***
  Future<bool> CheckSavedUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? userName = preferences.getString('username');
    return userName != null;
  }


// *** Fetch User Details ***
  static Future<Map<String, String>> fetchUserDedatils() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? username = preferences.getString('username');
    String? email = preferences.getString('email');
    return {'username': username!, 'email': email!};
  }
}
