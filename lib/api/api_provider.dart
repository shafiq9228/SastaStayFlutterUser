import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../utils/preference_manager.dart';


class ApiProvider<T> extends GetConnect{

  String apiKey = "654321";
  String liveUrl = false ? "https://sastastay-1d420.el.r.appspot.com/user/" : "http://192.168.0.218:8055/user/";

  @override
  Future<void> onInit() async {
    final preferenceManager = Get.put(PreferenceManager());
    httpClient.baseUrl = liveUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 100);
    httpClient.addRequestModifier<T>((request) async {
      final token = await preferenceManager.getValue("token") ?? "";
      final modifiedRequest = request as Request<T>;
      modifiedRequest.headers['Authorization'] = token;
      modifiedRequest.headers['apiKey'] = apiKey;
      return modifiedRequest;
    });
    super.onInit();
  }

  void changeBaseUrl(String entity) {
    httpClient.baseUrl = liveUrl;
  }

}