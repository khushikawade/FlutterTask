import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Screens/profile/profile.dart';
import 'package:flutter_task/Screens/restaurants/restaurants.dart';
import 'package:flutter_task/Screens/signUp/signUp.dart';

import 'package:http/http.dart' as http;

// import 'response/login_response_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // First Container positioned at the top-left
            Positioned(
              // top: 10,
              right: 0,
              left: 0,
              child: Container(
                height: 140,
                // width: 30,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xff805CFF),
                      Color.fromARGB(255, 99, 161, 223),
                    ],
                    stops: [0.08, 0.9],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170,
              // left: 50,
              left: 0, right: 0,

              child: list(),
            ),
            // Second Container positioned at the bottom-right

            Positioned(
                top: 90,
                right: 30,
                left: 30,
                child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300.withOpacity(0.5),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.deepPurple,
                              ),
                              child: Icon(
                                Icons.menu,
                                color: Color(0xffffffff),
                              )),
                        ),
                      ],
                    )))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  // // This trailing comma makes auto-formatting nicer for build methods.

  list() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Container(
              // width: double.infinity / 2,
              height: 1,
              color: Color(
                0xffffffff,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  "assets/dummy-removebg-preview.png",
                  width: 50,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      'User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 60),
            child: Container(
              // width: double.infinity / 2,
              height: 1,
              color: Color(
                0xffffffff,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: Color(0xffffffff),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RestaurantsScreen()),
                    );
                  },
                  child: Text(
                    'View Restaurants',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
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
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: Color(0xffffffff),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: Text(
                    'View Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
