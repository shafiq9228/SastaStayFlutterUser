import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/main_page.dart';
import '../pages/register_user_page.dart';
import '../response_model/auth_response_model.dart';
import 'ConfigKeys.dart';
import 'custom_colors.dart';



class AuthUtils {

  AuthUtils._();

  static final appId = "2c6d2150a3c3d4f08dc38b7e766a5ad66";


  static void shareApp() {
    final String appLink = Platform.isAndroid
        ? "https://play.google.com/store/apps/details?id=com.sastastays.user"
        : "https://apps.apple.com/app/idYOUR_APP_ID";

    Share.share("Hey 👋 Try this app:\n$appLink");
  }

  static Future<void> openWhatsAppChat({
    required String phoneNumber, // in international format without '+'
    String message = '',
  }) async {
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}",
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  static Future<void> openGoogleMaps(double latitude, double longitude) async {
    if(latitude == 0.00 || latitude == 0.00) throw "Could not open Google Maps";
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open Google Maps';
    }
  }

  static Future<void> openChatBoot(UserModel? userModel)async {
    try {
      if(userModel == null) throw "Please Try Again In Sometime";
      dynamic user = {
        'userId': userModel?.id,  //unique userId
        'password': userModel?.id,
        'displayName': userModel?.name,
        'contactNumber': userModel?.mobile.toString(),
        'imageLink': userModel?.profilePic,
        'email': userModel?.email,
        'appId': ConfigKeys.appId
      };

      await KommunicateFlutterPlugin.login(user).then((result) async {
        dynamic conversationObject = {
          'appId': ConfigKeys.appId,
          'kmUser': jsonEncode(user),
          'isSingleConversation': false
        };

        await KommunicateFlutterPlugin.buildConversation(conversationObject).then((clientConversationId) {
          print("Conversation builder success : " + clientConversationId.toString());
        }).catchError((error) {
          print("Conversation builder error : " + error.toString());
        });

      }).catchError((error) {
        print("Login failed : " + error.toString());
      });
    } catch (e) {
      Get.snackbar("Error",e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      print("Conversation error: $e");
    }
  }


  static DateTime _toIndianTime(DateTime date) {
    return date.toUtc().add(const Duration(hours: 5, minutes: 30));
  }

  static String formatPrice(double price) => '\$${price.toStringAsFixed(2)}';

  static String formatDate(DateTime date) {
    final indiaTime = _toIndianTime(date);
    return DateFormat.yMd().format(indiaTime);
  }

  static String dateFormatToCheckInCheckOut1(DateTime? checkInDate, DateTime? checkOutDate) {
    if (checkInDate == null || checkOutDate == null) return "";

    final indiaCheckIn = _toIndianTime(checkInDate);
    final indiaCheckOut = _toIndianTime(checkOutDate);

    bool isSameDate = indiaCheckIn.year == indiaCheckOut.year &&
        indiaCheckIn.month == indiaCheckOut.month &&
        indiaCheckIn.day == indiaCheckOut.day;

    if (isSameDate) {
      return formatDateToLong(indiaCheckIn);
    }
    return "${formatDateToLong(indiaCheckIn)} - ${formatDateToLong(indiaCheckOut)}";

  }

  static String dateFormatToCheckInCheckOut(DateTime? checkInDate, DateTime? checkOutDate) {
    if (checkInDate == null || checkOutDate == null) return "";

    final indiaCheckIn = _toIndianTime(checkInDate);
    final indiaCheckOut = _toIndianTime(checkOutDate);

    bool isSameDate = indiaCheckIn.year == indiaCheckOut.year &&
        indiaCheckIn.month == indiaCheckOut.month &&
        indiaCheckIn.day == indiaCheckOut.day;

    if (isSameDate) {
      return "${formatDateToLong(indiaCheckIn)}\nCheck In : ${formatDateToLong(indiaCheckIn)}\nCheck Out : ${formatDateToLong(indiaCheckOut.add(Duration(days: 1)))}";
    }
    return "${formatDateToLong(indiaCheckIn)} - ${formatDateToLong(indiaCheckOut)}\nCheck In : ${formatDateToLong(indiaCheckIn)}\nCheck Out : ${formatDateToLong(indiaCheckOut.add(Duration(days: 1)))}";
        
  }

  static DateTime normalizeDate(DateTime date) {
    final indiaTime = _toIndianTime(date);
    return DateTime(indiaTime.year, indiaTime.month, indiaTime.day);
  }

  static String formatNumber(num? number) {
    if (number == null) return '';
    if (number < 1000) return number.toString();
    if (number < 1000000) return "${(number / 1000).toStringAsFixed(number % 1000 < 100 ? 1 : 0)}K";
    if (number < 1000000000) return "${(number / 1000000).toStringAsFixed(number % 1000000 < 100000 ? 1 : 0)}M";
    return "${(number / 1000000000).toStringAsFixed(number % 1000000000 < 100000000 ? 1 : 0)}B";
  }

  static String formatDateToLong(DateTime? date) {
    if (date == null) return "";
    final indiaTime = date.toUtc().add(const Duration(hours: 5, minutes: 30));
    return DateFormat("MMM d yyyy").format(indiaTime);
  }

  static String formatDatetime(DateTime? date) {
    if (date == null) return "";
    final indiaTime = date.toUtc().add(const Duration(hours: 5, minutes: 30));
    return DateFormat("dd MMMM yyyy, hh:mm a").format(indiaTime);
  }

  static void navigateFromPageName(String? page){
    switch(page){
      case "mainPage": Get.offAll(() =>  const MainPage());
      case "registerUserPage": Get.offAll(() => const RegisterUserPage());
    }
  }

  static bool isValidBase64(String base64Str) {
    final base64Pattern = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    return base64Pattern.hasMatch(base64Str) && (base64Str.length % 4 == 0);
  }

  static String repairBase64(String base64Str) {
    base64Str = base64Str.replaceAll(RegExp(r'[^A-Za-z0-9+/=]'), '');
    int mod = base64Str.length % 4;
    if (mod > 0) {
      base64Str += "=" * (4 - mod);
    }
    return base64Str;
  }




  static String? validateRequestFields(List<String> requiredFields, Map<String, dynamic> body) {
    if (requiredFields.contains('mobile') && body['mobile']?.toString().length != 10) {
      return 'Check Your Mobile Number';
    }

    if (requiredFields.contains('otp') && body['otp']?.toString().length != 6) {
      return 'Check Your Otp';
    }

    if (requiredFields.contains('email') && !(body['email']?.toString().contains('@gmail.com') ?? false)) {
      return 'Check Your Email Id';
    }

    List<String> missingFields = requiredFields.where((field) {
      var value = body[field];
      return value == null ||
          value == '' ||
          (value is List && value.isEmpty);
    }).toList();

    if (missingFields.isNotEmpty) {
      return 'Missing required fields: ${missingFields.join(", ")}';
    }

    return null;
  }

  static Future<String?>  getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return null;
  }


  static Future<Map<String, String?>> getDeviceDetails() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? imei;
    String? deviceVersion;
    String? deviceId;

    if (Platform.isAndroid) {
      // Request Permission
      if (await Permission.phone.request().isGranted) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        imei = androidInfo.id; // IMEI
        deviceVersion = androidInfo.version.release; // Android version
        deviceId = androidInfo.id; // Device ID
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      imei = iosInfo.identifierForVendor; // No IMEI on iOS, so use identifierForVendor
      deviceVersion = iosInfo.systemVersion; // iOS version
      deviceId = iosInfo.identifierForVendor;
    }

    return {
      "imei": imei,
      "deviceVersion": deviceVersion,
      "deviceId": deviceId
    };
  }

  static String  getSource(){
    return Platform.isAndroid ? "android" : "ios";
  }



  static String convertDate(String? timestamp) {
    DateTime dateTime;

    if (timestamp == null || timestamp.trim().isEmpty) {
      dateTime = DateTime.now().toUtc();
    } else {
      dateTime = DateTime.parse(timestamp).toUtc();
    }

    DateTime istDateTime = dateTime.add(Duration(hours: 5, minutes: 30));
    String formattedDate = DateFormat('MMMM dd | yyyy | hh:mm a').format(istDateTime);

    return formattedDate;
  }


}