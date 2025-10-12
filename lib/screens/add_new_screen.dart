import 'package:flutter/material.dart';
import 'package:wallet/constants/appColor.dart';
import 'package:wallet/constants/appPadding.dart';
import 'package:wallet/model/expenses.dart';
import 'package:wallet/model/income.dart';
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
                              vertical: defalutPadding,
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
