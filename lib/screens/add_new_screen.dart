import 'package:flutter/material.dart';
import 'package:wallet/constants/appColor.dart';
import 'package:wallet/constants/appPadding.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selected == 0 ? AppGreenColor : AppRedColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defalutPadding),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defalutPadding,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppWhiteColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selected = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selected == 1
                                  ?AppWhiteColor
                                  : AppGreenColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 60,
                              ),
                              child: Text(
                                'Income',
                                style: TextStyle(
                                  color: _selected == 0
                                      ? AppWhiteColor
                                      : AppBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selected = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selected == 0
                                  ?AppWhiteColor
                                  : AppRedColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 60,
                              ),
                              child: Text(
                                'Expenses',
                                style: TextStyle(
                                  color: _selected == 1
                                      ? AppWhiteColor
                                      : AppBlackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
