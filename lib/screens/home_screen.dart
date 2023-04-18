// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  List industryList = [
    "Agriculture",
    "Manufacturing",
    "Retail",
    "Technology",
    "Healthcare",
    "Hospitality",
    "Transportation",
    "Construction",
    "Energy",
    "Financial Services",
    "Education",
    "Media",
    "Entertainment",
    "Mining",
    "Real Estate"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Choose Category"),
      //   elevation: 0,
      // ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Get.theme.primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose Category",
                  style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  height: Get.height * 0.86,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: industryList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          // margin: EdgeInsets.only(top: 0),
                          height: Get.height * 0.085,
                          width: Get.width,
                          // color: Color(0xffE8E5FA),
                          child: Card(
                              color: Color(0xffE8E5FA),
                              // color: Color(0xffCDC7F4),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${industryList[index]}",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff6D5EE0)),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black45,
                                      size: 23,
                                    )
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
