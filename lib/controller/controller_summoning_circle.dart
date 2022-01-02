import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:cat_summon_circle_flutter/endpoints/endpoint_cat.dart';
import 'package:cat_summon_circle_flutter/entities/model/cat.dart';

class ControllerSummoningCircle extends GetxController {
  Rx<Cat> cat = Cat().obs;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;

  EndpointCat endpointCat = EndpointCat(Dio());

  Future getCat() async {
    try {
      hasError.value = false;
      isLoading.value = true;
      cat.value = await endpointCat.getCat();
      isLoading.value = false;
    } catch (error) {
      Get.snackbar("Error", "Not enough mana");
      isLoading.value = false;
      hasError.value = true;
      throw error;
    }
  }
}
