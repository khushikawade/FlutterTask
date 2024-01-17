import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Screens/login/login.dart';

import 'package:http/http.dart' as http;

// import 'response/login_response_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController controllerForEmail =
      TextEditingController(); //emailController
  TextEditingController controllerForPassword = TextEditingController();
  TextEditingController controllerForUserName =
      TextEditingController(); //emailController
  TextEditingController controllerForFullName = TextEditingController();
  TextEditingController controllerForPhone =
      TextEditingController(); //emailController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffffffff)),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.deepPurple,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: signUpForm(signUpFormKey, controllerForEmail,
                  controllerForPassword, context),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  signUpForm(loginFormKey, controllerForEmail, controllerForPassword, context) {
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controllerForUserName,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffffffff), // Set the fill color

                labelText: 'Username',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  // Set the border radius
                ),
              ),
              validator: (value) {
                //_________________________RegExp for email______________________//
              }),
          SizedBox(
            height: 30,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controllerForFullName,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffffffff), // Set the fill color

                labelText: 'Full Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  // Set the border radius
                ),
              ),
              validator: (value) {
                //_________________________RegExp for email______________________//
              }),
          SizedBox(
            height: 30,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controllerForEmail,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffffffff), // Set the fill color
                // Set the prefix icon
                labelText: 'Email',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  // Set the border radius
                ),
              ),
              validator: (value) {
                //_________________________RegExp for email______________________//
                RegExp regexForEmail = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                bool hasUppercase = value!.contains(RegExp(r'[A-Z]'));
                bool hasLowercase = value.contains(RegExp(r'[a-z]'));
                bool hasDigit = value.contains(RegExp(r'[0-9]'));
                bool hasSpecialChar = value.contains(RegExp(r'[!@#\$%^&*]'));
                //-------------Validation for Email---------------------//

                if (value.isEmpty) {
                  return 'Please enter an email address.';
                } else if (!regexForEmail.hasMatch(value)) {
                  return 'Please enter the valid email address.';
                } else {
                  return '';
                }
              }),
          SizedBox(
            height: 30,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controllerForPhone,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffffffff), // Set the fill color
                // prefixIcon: Icon(Icons.person_2_outlined), // Set the prefix icon
                labelText: 'Phone',
                hintText: '+965   |    Phone Number',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  // Set the border radius
                ),
              ),
              validator: (value) {}),
          SizedBox(
            height: 30,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controllerForPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffffffff), // Set the fill color
                // prefixIcon: Icon(Icons.lock_outline),
                floatingLabelBehavior:
                    FloatingLabelBehavior.always, // Set the prefix icon
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // Set the border radius
                ),
              ),
              //-------------Validation for Password---------------------//
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the password.';
                } else if (value.length < 6) {
                  return 'Password must contain atleast 6 character';
                } else {
                  return '';
                }
              }),
          SizedBox(
            height: 20,
          ),
          const Text(
            "I agree with the company's privacy policy and terms and services ",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              callSignUPApi(controllerForEmail.text.toString(),
                  controllerForPassword.text.toString());
              // if (loginFormKey.currentState.validate()) {
              //   loginFormKey.currentState.save();

              // } else {
              //   // autoValidate = true;
              // }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 18, bottom: 18),
              // height: 30,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 86, 40, 165),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> callSignUPApi(String phoneNumber, String password) async {
    try {
      var url = Uri.parse('https://user.requeue.com/user/auth/SignUp');
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        "Name": "test",
        "Email": "test2@gmail.com",
        "phone_number": "9926571454",
        "Password": "Password@123",
        "Country": "91",
        "UserName": "testing"
      });

      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print(data['User']);
        print('Login successfully');
      } else {
        print('Failed with status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
