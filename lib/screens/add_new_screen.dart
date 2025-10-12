import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet/constants/appColor.dart';
import 'package:wallet/constants/appPadding.dart';
import 'package:wallet/model/expenses.dart';
import 'package:wallet/model/income.dart';
import 'package:wallet/widget/custom_button_widget.dart';
import 'package:wallet/widget/custome_text_form_widget.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selected = 0;
  ExpensesCategory _expensesCategory = ExpensesCategory.Shopping;
  IncomeCategory _incomeCategory = IncomeCategory.Salary;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selected == 0 ? AppGreenColor : AppRedColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [

              // ** Income and Expenses moving section **
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defalutPadding,
                  vertical: 20,
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

                      // Income Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _selected == 0
                                ? AppGreenColor
                                : AppWhiteColor,
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

                      // Expenses Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: _selected == 1 ? AppRedColor : AppWhiteColor,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defalutPadding,
                  vertical: 20,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How much?',
                        style: TextStyle(
                          fontSize: 22,
                          color: AppWhiteColor.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 55),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(color: AppWhiteColor),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Income and Expenses details Added Section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: AppWhiteColor,
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defalutPadding,
                    vertical: 40,
                  ),

                  // Details Add form
                  child: Form(
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          value: _selected == 0
                              ? _incomeCategory
                              : _expensesCategory,
                          items: _selected == 0
                              ? IncomeCategory.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                }).toList()
                              : ExpensesCategory.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name),
                                  );
                                }).toList(),
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 15),
                        CustomeTextFormWidget(
                          fieldName: 'Title',
                          controller: _titleController,
                        ),
                        SizedBox(height: 15),
                        CustomeTextFormWidget(
                          fieldName: 'Description',
                          controller: _descriptionController,
                        ),
                        SizedBox(height: 15),
                        CustomeTextFormWidget(
                          fieldName: 'Amount',
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            // Select Date Section
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2026),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color.fromARGB(255, 119, 119, 119),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 28,
                                        color: AppWhiteColor,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Select Date',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppWhiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(DateFormat.yMMMMd().format(_selectedDate)),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            // Select Time Section
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        value.hour,
                                        value.minute,
                                      );
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color.fromARGB(255, 150, 150, 150),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 28,
                                        color: AppWhiteColor,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Select Time',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppWhiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(DateFormat.jm().format(_selectedTime)),
                          ],
                        ),
                        SizedBox(height: 40),

                        // Add Button
                        CustomButtonWidget(
                          btnName: 'Add',
                          btnColor: _selected == 0
                              ? AppGreenColor
                              : AppRedColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
