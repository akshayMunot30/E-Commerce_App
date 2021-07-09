import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Build an alert dialog to display some errors
  Future<void> _alertDialogBuilder() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text("Just some random text for now"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close Dialogue"),
            )
          ],
        );
      },
    );
  }

  // Default Form loading state
  bool _registerFormLoading = false;

  // Form Input Field values
  String _registerEmail = "";
  String _registerPassword = "";

  // Focus Node for input fields
  FocusNode? _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24.0,
                ),
                child: Text(
                  "Create A New Account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email ID",
                    onChanged: (value) {
                      _registerEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode!.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                    isPasswordField: false,
                  ),
                  CustomInput(
                    hintText: "Password",
                    onChanged: (value) {
                      _registerPassword = value;
                    },
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                  ),
                  CustomButton(
                    text: "Create New Account",
                    onPressed: () {
                      //open dialog
                      setState(() {
                        _registerFormLoading = true;
                      });
                    },
                    isLoading: _registerFormLoading,
                    outlineBtn: false,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  text: "Back to Login",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
