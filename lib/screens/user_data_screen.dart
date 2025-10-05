import 'package:flutter/material.dart';
import 'package:wallet/constants/appColor.dart';
import 'package:wallet/constants/appPadding.dart';
import 'package:wallet/services/user_data.dart';
import 'package:wallet/widget/custom_button_widget.dart';
import 'package:wallet/widget/custome_text_form_widget.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _remember = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defalutPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your \nPersonal Details',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomeTextFormWidget(
                        fieldName: 'Name',
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Name';
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      CustomeTextFormWidget(
                        fieldName: 'Email Address',
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Email Address';
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      CustomeTextFormWidget(
                        fieldName: 'Password',
                        controller: _passwordController,
                        obscueText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Password';
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      CustomeTextFormWidget(
                        fieldName: 'Confirm Password',
                        controller: _confirmPasswordController,
                        obscueText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter above Enter Password';
                          }
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppsubTextColor,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _remember,
                              onChanged: (value) {
                                setState(() {
                                  _remember = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            String username = _nameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                            await UserDataService.storeUserDetails(
                              username: username,
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword,
                              context: context,
                            );
                          } else {}
                        },
                        child: CustomButtonWidget(
                          btnName: 'Save',
                          btnColor: AppMainColor,
                        ),
                      ),
                    ],
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
