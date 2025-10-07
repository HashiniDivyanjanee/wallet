import 'package:flutter/material.dart';
import 'package:wallet/constants/appColor.dart';
import 'package:wallet/screens/add_new_screen.dart';
import 'package:wallet/screens/budget_screen.dart';
import 'package:wallet/screens/home_scree.dart';
import 'package:wallet/screens/profile_screen.dart';
import 'package:wallet/screens/transaction_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    AddNewScreen(),
    HomeScree(),
    TransactionScreen(),
    BudgetScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppWhiteColor,
        selectedItemColor: AppMainColor,
        unselectedItemColor: AppgrayColor,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppMainColor,
              ),
              child: Icon(Icons.add, size: 30),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: 'Budget'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}
