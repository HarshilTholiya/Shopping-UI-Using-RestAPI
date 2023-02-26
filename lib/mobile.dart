import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/shopping.dart';
import 'package:mobile_app/watches.dart';
import 'package:badges/badges.dart';
import 'bottomNavigationBar.dart';
import 'package:http/http.dart' as http;

class MobileApp extends StatefulWidget {
  @override
  State<MobileApp> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
        future: callShoppingApi2(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.white,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.data![1]['image']
                                .toString()),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![1]['name']
                                  .toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'User',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black38),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Badge(
                        badgeColor: Colors.red,
                        child: Icon(
                          Icons.notifications,
                          size: 35,
                          color: Colors.blueAccent,
                        ),
                        position: BadgePosition.topEnd(top: 0, end: 0),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: Image.asset(
                            'assets/images/bag.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'SHOPPING',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child: Text(
                                'Lorem ipsum dolor sit amet,\n consectetuer',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ))
                          ],
                        ))
                      ],
                    ),
                    flex: 5),
                Expanded(
                    child: InkWell(
                  // onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigationBarCustom()));
                  // },
                  child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          'GET  STARTED',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )),
                )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Lorem  ipsum dolor sit amet?',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            )
          ],
        );
    }
    else{
      return Center(child: CircularProgressIndicator());
    }
    }
        )
      ),
    );
  }
  Future<List<dynamic>> callShoppingApi2() async {
    var res2 = await http
        .get(Uri.parse("https://63fb39064e024687bf744fdc.mockapi.io/Shopping"));
    if (res2.statusCode == 200) {
      return jsonDecode(res2.body);
    } else {
      throw Exception("Unable to fetch");
    }
  }
}
