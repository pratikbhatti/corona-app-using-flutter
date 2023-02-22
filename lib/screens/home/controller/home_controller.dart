import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController cityName = TextEditingController();
  RxString city = "surat".obs;
}
