

import 'dart:convert';
import 'dart:io';
import 'package:image/image.dart' as img;

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pg_hostel/pages/onboarding_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_provider.dart';
import '../api/api_result.dart';
import '../api/end_points.dart';
import '../pages/main_page.dart';
import '../pages/mobile_verification_page.dart';
import '../pages/otp_verification_page.dart';
import '../pages/register_user_page.dart';
import '../pages/update_version_screen.dart';
import '../pages/user_blocked.dart';
import '../request_model/auth_request_model.dart';
import '../response_model/auth_response_model.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';
import '../utils/geo_util.dart';
import '../utils/preference_manager.dart';
import 'package:http/http.dart' as http;


class AuthViewModel extends GetxController{
  final apiProvider = Get.put(ApiProvider());

  final validaVersionObserver = const ApiResult<ValidateVersionResponseModel>.init().obs;
  final sendOtpResponseObserver = const ApiResult<PrimaryResponseModel>.init().obs;
  final verifyOtpResponseObserver  = const ApiResult<VerifyOtpResponseModel>.init().obs;
  final googleAuthResponseObserver  = const ApiResult<VerifyOtpResponseModel>.init().obs;
  final registerUserResponseObserver  = const ApiResult<PrimaryResponseModel>.init().obs;
  final fetchUserDetailsObserver  = const ApiResult<FetchUserDetailsResponseModel>.init().obs;

  final preferenceManager = Get.put(PreferenceManager());
  RxString profilePic = "".obs;

  final uploadFileObserver  = const ApiResult<UploadFileResponseModel>.init().obs;

  Rx<File> uploadingFile = File('').obs;
  RxString aadharImage = "".obs;
  RxString uploadedImage = "".obs;

  RxString userId = "".obs;

  Rx<Position?> locationPosition = Rx<Position?>(null);
  Rx<LocationModel?> locationDetails = Rx<LocationModel?>(null);

  RxList<DocumentDataModel> kysDocuments = [
    DocumentDataModel(
      documentType: "aadhar",
      documentStatus: "pending",
      uploadedUrl: "",
      errorTxt: '',
    ),
    DocumentDataModel(
      documentType: "pan",
      documentStatus: "pending",
      uploadedUrl: "",
      errorTxt: '',
    ),
    DocumentDataModel(
      documentType: "selfie",
      documentStatus: "pending",
      uploadedUrl: "",
      errorTxt: '',
    )
  ].obs;

  Future<Position?> fetchCurrentLocation() async {
    if (locationPosition.value == null) {
      await Geolocator.requestPermission();
      LocationPermission locationPermission =
      await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) return null;
      final position = await Geolocator.getCurrentPosition();
      final geoAddress = await GeoUtil().getApiAddress(position.latitude, position.longitude);
      locationPosition.value = position;
      locationDetails.value = geoAddress;
      return position;
    } else {
      return locationPosition.value;
    }
  }

  Future<void> performUploadFile(File selectedFile,String type) async {
    try {
      uploadFileObserver.value =  const ApiResult.loading("Compressing");
      File file = await compressImage(selectedFile,50);
      uploadFileObserver.value =  const ApiResult.loading("");
      var uri = Uri.parse(apiProvider.liveUrl + EndPoints.uploadFile);
      var request = http.MultipartRequest('POST', uri);
      request.headers['apiKey'] = apiProvider.apiKey;
      final preferenceManager = Get.put(PreferenceManager());
      final token = await preferenceManager.getValue("token") ?? "";
      request.headers['authorization'] = token;
      request.fields['type'] = type;
      var stream = http.ByteStream(file.openRead());
      stream.cast();
      var length = await file.length() ?? 0;
      var multipart = http.MultipartFile(
        'file',
        stream,
        length,
        filename: file.path
            .split('/')
            .last,
      );
      request.files.add(multipart);
      var response = await request.send();
      String responseBody = await response.stream.bytesToString();
      final json = jsonDecode(responseBody);
      if(json != null){
        final jsonData = UploadFileResponseModel.fromJson(json);
        if (jsonData.status == 1) {
          uploadFileObserver.value = ApiResult.success(jsonData);
          if(type == "guestDoc"){
            aadharImage.value =  jsonData.data ?? "";
          }
          else if(type == "aadhar" || type == "pan" || type == "selfie"){
            final existingKycList = kysDocuments.toList() ?? List.empty();
            final index = existingKycList.indexWhere((element) => element.documentType == type);
            if(index != -1){
              final updatedKycList = existingKycList[index].copyWith(uploadedUrl: jsonData.data ?? "",documentStatus: "pending");
              existingKycList[index] = updatedKycList;
              kysDocuments.value = existingKycList;
              kysDocuments.refresh();
            }
          }
          else{
            uploadedImage.value = jsonData.data ?? "";
          }
          Get.close(1);
          return;
        }
        throw jsonData.message.toString();
      }
      throw "Body Null";
    } catch (e) {
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      uploadFileObserver.value = ApiResult.error(e.toString());
    }
  }


  Future<File> compressImage(File file, int quality) async {
    try{
      final originalSize = file.lengthSync();
      print('Original size: ${(originalSize / 1024).toStringAsFixed(2)} KB');
      final image = img.decodeImage(await file.readAsBytes());
      final tempDir = await getTemporaryDirectory();
      final targetPath = "${tempDir.path}/compressed_${file.path.split('/').last}";
      final compressedImage = File(targetPath)
        ..writeAsBytesSync(img.encodeJpg(image!, quality: quality));
      final compressedSize = compressedImage.lengthSync();
      print('Compressed size: ${(compressedSize / 1024).toStringAsFixed(2)} KB');
      return compressedImage;
    }
    catch(error){
      return file;
    }
  }

  Future<void> validateVersion(ValidateVersionRequestModel request) async {
    try{
      validaVersionObserver.value = const ApiResult.loading("");
      final String? validatorResponse = AuthUtils.validateRequestFields(['version'],request.toJson());
      if(validatorResponse != null) throw validatorResponse;
      final response = await apiProvider.post(EndPoints.validateVersion,request.toJson());
      final body = response.body;
      if(response.statusCode == 401){
        Get.offAll(() => MobileVerificationPage());
        throw "Please Login Again";
      }
      if(response.isOk && body !=null){
        final responseData = ValidateVersionResponseModel.fromJson(body);
        if(responseData.status == 1){
          validaVersionObserver.value = ApiResult.success(responseData);
          if(responseData.data?.validVersion == false){
            Get.offAll(() => const UpdateVersionScreen());
          }
          else if((responseData.data?.userBlocked  ??  false ) == true){
            Get.offAll(() => const UserBlocked());
          }
          else{
            final prefs = await SharedPreferences.getInstance();
            final page = prefs.getString('page') ?? "";
            if(page.isEmpty){
              Get.offAll(() => const OnBoardingScreens());
            }
            else{
              AuthUtils.navigateFromPageName(page);
            }
          }
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      validaVersionObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> sendOtp(SendOtpRequestModel request) async {
    try{
      sendOtpResponseObserver.value = const ApiResult.loading("");
      final String? validatorResponse = AuthUtils.validateRequestFields(['mobile'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;
      final response = await apiProvider.post(EndPoints.sendOtp,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = PrimaryResponseModel.fromJson(body);
        if(responseData.status == 1){
          sendOtpResponseObserver.value = ApiResult.success(responseData);
          Get.to(() => OtpVerificationPage(mobileNumber: request.mobile));
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      sendOtpResponseObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> verifyOtp(VerifyOtpRequestModel request) async {
    try{
      verifyOtpResponseObserver.value = const ApiResult.loading("");
      final String? validatorResponse = AuthUtils.validateRequestFields(['mobile','otp','source','version','deviceId'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;
      final response = await apiProvider.post(EndPoints.verifyOtp,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = VerifyOtpResponseModel.fromJson(body);
        if(responseData.status == 1){
          final page = responseData.data?.registerUser ==  true ? "registerUserPage" : "mainPage";
          preferenceManager.setValue("page",page);
          preferenceManager.setValue("registerValue",request.mobile.toString());
          preferenceManager.setValue("token",responseData.data?.token);
          verifyOtpResponseObserver.value = ApiResult.success(responseData);
          AuthUtils.navigateFromPageName(page);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      verifyOtpResponseObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> googleAuth(GoogleAuthRequestModel request) async {
    try{
      googleAuthResponseObserver.value = const ApiResult.loading("");
      final String? validatorResponse = AuthUtils.validateRequestFields(['email','name'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;
      final response = await apiProvider.post(EndPoints.googleAuth,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = VerifyOtpResponseModel.fromJson(body);
        if(responseData.status == 1){
          final page = responseData.data?.registerUser ==  true ? "registerUserPage" : "mainPage";
          preferenceManager.setValue("page",page);
          preferenceManager.setValue("registerValue",request.email.toString());
          preferenceManager.setValue("token",responseData.data?.token);
          googleAuthResponseObserver.value = ApiResult.success(responseData);
          AuthUtils.navigateFromPageName(page);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error","something went wrong $e",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      googleAuthResponseObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> fetchUserDetails(bool refresh) async {
    try{
      final success = fetchUserDetailsObserver.value.maybeWhen(success: (data) => true ,orElse: () => false);
      if(success && refresh == false) return;
      fetchUserDetailsObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.fetchUserDetails,{});
      final body = response.body;
      if(response.isOk && body !=null){
        var responseData = FetchUserDetailsResponseModel.fromJson(body);
        if(responseData.status == 1){
          fetchUserDetailsObserver.value = ApiResult.success(responseData);
          userId.value = responseData.data?.id ?? "";
          profilePic.value = responseData.data?.image ?? "";
          if(responseData.data?.kycDocuments?.length == 3){
            kysDocuments.value = responseData.data?.kycDocuments ?? [];
          }

          if(responseData.data?.address != null){
            locationDetails.value = responseData.data?.address;
          }else{
            await fetchCurrentLocation();
          }

          if((responseData.data?.email ?? "").isEmpty == true || responseData.data?.mobile.toString().isEmpty == true || responseData.data?.mobile.toString().length != 10 || (responseData.data?.name ?? "").isEmpty){
            Get.offAll(() => const  RegisterUserPage());
          }
          else if((responseData.data?.blocked  ??  false ) == true){
            Get.offAll(() => const UserBlocked());
          }

          // await FirebaseMessaging.instance.subscribeToTopic(responseData.data?.id ?? "");
          // await FirebaseMessaging.instance.subscribeToTopic("all");
          // await FirebaseMessaging.instance.subscribeToTopic("user");
          // final fcmToken = await FirebaseMessaging.instance.getToken();
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      fetchUserDetailsObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> registerUser(RegisterUserRequestModel request) async {
    try{
      registerUserResponseObserver.value = const ApiResult.loading("");
      final String? validatorResponse = AuthUtils.validateRequestFields(['mobile','name','email','dob','gender','address'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;
      final String? locationValidation = AuthUtils.validateRequestFields(['address1','address2','city','state','landMark','pinCode','latitude','longitude'], request.address!.toJson());
      if(locationValidation != null) throw locationValidation;
      final response = await apiProvider.post(EndPoints.registerUser,request.toJson());
      final body = response.body;
      if(response.isOk && body != null){
        final responseData = PrimaryResponseModel.fromJson(body);
        if(responseData.status == 1){
          registerUserResponseObserver.value = ApiResult.success(responseData);
          const page = "mainPage";
          preferenceManager.setValue("page",page);
          Get.offAll(() => const MainPage());
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      registerUserResponseObserver.value = ApiResult.error(e.toString());
    }
  }









}