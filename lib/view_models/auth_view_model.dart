

import 'package:get/get.dart';
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
import '../utils/preference_manager.dart';

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
  RxString userId = "".obs;


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
              Get.offAll(() => MobileVerificationPage());
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


  Future<void> fetchUserDetails() async {
    try{
      fetchUserDetailsObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.fetchUserDetails,{});
      final body = response.body;
      if(response.isOk && body !=null){
        var responseData = FetchUserDetailsResponseModel.fromJson(body);
        if(responseData.status == 1){
          fetchUserDetailsObserver.value = ApiResult.success(responseData);
          userId.value = responseData.data?.id ?? "";
          profilePic.value = responseData.data?.image ?? "";
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
      final String? validatorResponse = AuthUtils.validateRequestFields(['mobile','name','email','age','gender'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;
      // final String? locationValidation = AuthUtils.validateRequestFields(['address1','address2','city','state','landmark','pinCode','latitude','longitude'], request.location!.toJson());
      // if(locationValidation != null) throw locationValidation;
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