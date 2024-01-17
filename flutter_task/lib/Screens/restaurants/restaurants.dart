import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/Screens/restaurants/restaurants_response.dart';
import 'package:flutter_task/Screens/signUp/signUp.dart';

import 'package:http/http.dart' as http;

// import 'response/login_response_model.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({
    super.key,
  });

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  List<RestaurantData> restaurantList = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    // Call the API in the initState method
    restaurantListApi(restaurantList);
  }

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
                height: 150,
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
                top: 150,
                // left: 50,
                left: 0,
                right: 0,
                child: restaurantList != null || restaurantList.isNotEmpty
                    ? list(context)
                    : Container()),
            // Second Container positioned at the bottom-right

            Positioned(
                top: 80,
                right: 30,
                left: 30,
                child: Container(
                    height: 100,
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

  list(context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffffffff)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // restaurantList[index].logo != null
                        //     ? Image.network("restaurantList[index].logo")
                        //     :
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                "assets/dummy1.png",
                                fit: BoxFit.contain,
                              )),
                        ),
                        SizedBox(
                          width: 30,
                          height: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      restaurantList[index].nameEn != null
                                          ? restaurantList[index]
                                              .nameEn
                                              .toString()
                                          : '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurantList[index].nameAr != null
                                        ? restaurantList[index]
                                            .nameAr
                                            .toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurantList[index].status != null
                                        ? restaurantList[index]
                                            .status
                                            .toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    restaurantList[index].rating != null
                                        ? restaurantList[index]
                                            .rating!
                                            .toStringAsFixed(2)
                                            .toString()
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  Future<void> restaurantListApi(List<RestaurantData> restaurantList) async {
    try {
      var url = Uri.parse(
          'https://user.requeue.com/user/mainpages/get-restaurants?PickupAvailable=1&AreaName=Kuwait&page=1&page limit=10');
      var headers = {'Content-Type': 'application/json'};

      // Append additional query parameters if needed
      url = Uri(
        scheme: url.scheme,
        host: url.host,
        path: url.path,
        queryParameters: {
          'PickupAvailable': '1',
          'AreaName': 'Kuwait',
          'page': '1',
          'page limit': '10'
        },
      );

      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['data']);
        print('RestaurantData successfully');
        if (data['data'] != null) {
          List<RestaurantData> profiles = (data['data'] as List)
              .map((dynamic item) => RestaurantData.fromJson(item))
              .toList();
          setState(() {
            restaurantList.clear(); // Clear existing data
            restaurantList.addAll(profiles);
            print("profileList------${restaurantList.length}");
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
