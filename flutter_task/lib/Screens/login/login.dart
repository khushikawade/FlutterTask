import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Screens/home/home.dart';
import 'package:flutter_task/Screens/signUp/signUp.dart';

import 'package:http/http.dart' as http;

// import 'response/login_response_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController controllerForEmail =
      TextEditingController(); //emailController
  TextEditingController controllerForPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff5CC2E0),
              Color(0xff805CFF),
            ],
            stops: [0.05, 0.4],
          ),
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    '        ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/rq-logo-OMAR-WHITE.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
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
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/Group 568.png',
                          // width: 10,
                          // height: 10,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
                  width: double.infinity,
                  // height: 128.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 36, 114, 138),
                        Color.fromARGB(255, 152, 123, 255)
                      ],
                      stops: [0.05, 0.4],
                    ),

                    // color: Colors.deepPurple.withOpacity(0.35),
                  ),
                  child: loginForm(loginFormKey, controllerForEmail,
                      controllerForPassword, context)),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have an account yet!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                dividerWidget(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      // width: 30,
                      // height: 30,

                      child: Image.asset(
                        'assets/Continue with google.png',
                        // width: 10,
                        // height: 10,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      // width: 30,
                      // height: 30,

                      child: Image.asset(
                        'assets/Icon awesome-apple.png',
                        // width: 10,
                        // height: 10,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      // width: 30,
                      // height: 30,

                      child: Image.asset(
                        'assets/Facebook Logo.png',
                        // width: 10,
                        // height: 10,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      // width: 30,
                      // height: 30,

                      child: Image.asset(
                        'assets/Icon awesome-twitter.png',
                        // width: 10,
                        // height: 10,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

dividerWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Row(children: const [
      Expanded(
          child: Divider(
        endIndent: 20,
        color: Colors.white,
      )),
      Text(
        'login with',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
        // style: Theme.of(context).textTheme.overline,
      ),
      Expanded(
          child: Divider(
        indent: 20,
        color: Colors.white,
      )),
    ]),
  );
}

loginForm(loginFormKey, controllerForEmail, controllerForPassword, context) {
  return Form(
    key: loginFormKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Login your account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controllerForEmail,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF2F4F7), // Set the fill color
              prefixIcon: Icon(Icons.person_2_outlined), // Set the prefix icon
              labelText: 'E-mail',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
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
          height: 10,
        ),
        TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controllerForPassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF2F4F7), // Set the fill color
              prefixIcon: Icon(Icons.lock_outline), // Set the prefix icon
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
          'Forgot your password?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            // if (loginFormKey.currentState.validate()) {
            //   loginFormKey.currentState.save();
            //   callLoginApi(controllerForEmail.text.toString(),
            //       controllerForPassword.text.toString());
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const HomeScreen()),
            //   );
            // } else {
            //   // autoValidate = true;
            // }
            callLoginApi(controllerForEmail.text.toString(),
                controllerForPassword.text.toString());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            // height: 30,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                'Login',
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

Future<void> callLoginApi(String email, String password) async {
  try {
    print("uyuuuu");
    print(email);
    print(password);
    var url = Uri.parse('https://user.requeue.com/user/auth/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({"phone_number": email, "password": password});

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Login successfully');
    } else {
      print('Failed with status code: ${response.statusCode}');
      print(response.body);
    }
  } catch (e) {
    print(e.toString());
  }
}
