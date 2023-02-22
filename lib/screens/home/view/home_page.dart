import 'dart:ui';

import 'package:demo38/screens/home/controller/home_controller.dart';
import 'package:demo38/screens/home/modal/home_modal.dart';
import 'package:demo38/screens/utility/apis/api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                  child: Image.asset(
                    'assets/images/background.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      FutureBuilder<HomeModal?>(
                        future: ApiCall().getData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Not Found"),
                            );
                          } else if (snapshot.hasData) {
                            List<CountriesStat>? l1 =
                                snapshot.data!.countriesStat;
                            return ListView.builder(
                              itemCount: l1!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${l1[index].countryName}",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.orange,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.yellow,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Cases :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8.sp),
                                        ),
                                        Text(
                                          "${l1[index].deaths}",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Deaths :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8.sp),
                                        ),
                                        Text(
                                          "${l1[index].cases}",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Recovered :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8.sp),
                                        ),
                                        Text(
                                          "${l1[index].totalRecovered}",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Active Cases :- ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8.sp),
                                        ),
                                        Text(
                                          "${l1[index].activeCases}",
                                          style:
                                              TextStyle(color: Colors.white60),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Divider(color: Colors.orange)
                                  ],
                                );
                              },
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
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
