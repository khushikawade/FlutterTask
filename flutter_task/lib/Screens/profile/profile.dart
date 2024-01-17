import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Screens/signUp/signUp.dart';

import 'package:http/http.dart' as http;

import 'profile_response_model.dart';

// import 'response/login_response_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ProfileData> profileList = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    // Call the API in the initState method
    profileApi(profileList);
  }

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
          // borderRadius: BorderRadius.circular(30),

          ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset("assets/dummy-removebg-preview.png"),
          Text(
            profileList != null && profileList.isNotEmpty
                ? profileList[0].clientName != null
                    ? '${profileList[0].clientName}'
                    : ''
                : '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            profileList != null && profileList.isNotEmpty
                ? profileList[0].mail != null
                    ? '${profileList[0].mail}'
                    : ''
                : '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            profileList != null && profileList.isNotEmpty
                ? profileList[0].subscription != null
                    ? '${profileList[0].subscription}'
                    : ''
                : '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Followers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Following',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                profileList != null && profileList.isNotEmpty
                    ? profileList[0].followlist!.follower != null
                        ? '${profileList[0].followlist!.follower}'
                        : ''
                    : '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                profileList != null && profileList.isNotEmpty
                    ? profileList[0].followlist!.following != null
                        ? '${profileList[0].followlist!.following}'
                        : ''
                    : '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20),
                // width: 40,
                // height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 101, 69, 155),
                ),
                child: Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                // width: 40,
                // height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 31, 137, 193),
                ),
                child: Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> profileApi(List<ProfileData> profileList) async {
    try {
      var url = Uri.parse(
          'https://user.requeue.com/user/profiles/get-profiles?ClientID=2057719');
      var headers = {'Content-Type': 'application/json'};

      // Append additional query parameters if needed
      url = Uri(
        scheme: url.scheme,
        host: url.host,
        path: url.path,
        queryParameters: {
          'ClientID': '2057719',
        },
      );

      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['data']);
        print('Login successfully');
        if (data['data'] != null) {
          List<ProfileData> profiles = (data['data'] as List)
              .map((dynamic item) => ProfileData.fromJson(item))
              .toList();
          setState(() {
            profileList.clear(); // Clear existing data
            profileList.addAll(profiles);
            print("profileList------${profileList.length}");
          });
        }
      } else {
        print('Failed with status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
