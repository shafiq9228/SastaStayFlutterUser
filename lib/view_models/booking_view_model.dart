import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../api/api_provider.dart';
import '../api/api_result.dart';
import '../api/end_points.dart';
import '../request_model/auth_request_model.dart';
import '../request_model/bookings_request_model.dart';
import '../response_model/auth_response_model.dart';
import '../response_model/bookings_response_model.dart';
import '../response_model/hostel_response_model.dart';
import '../utils/ConfigKeys.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';
import '../utils/preference_manager.dart';

class BookingViewModel extends GetxController{

  final apiProvider = Get.put(ApiProvider());
  final preferenceManager = Get.put(PreferenceManager());
  final Razorpay razorpay = Razorpay();


  Rx<BookingRequestModel?> bookingRequestModelObserver = Rx<BookingRequestModel?>(null);


  final checkHostelRoomAvailabilityObserver = const ApiResult<HostelRoomAvailabilityResponseModel>.init().obs;
  final confirmBookingObserver = const ApiResult<ConfirmBookingResponseModel>.init().obs;
  final updateBookingStatusObserver = const ApiResult<ConfirmBookingResponseModel>.init().obs;


  Future<void> checkHostelRoomAvailability(BookingRequestModel request) async {
    try{
      checkHostelRoomAvailabilityObserver.value = const ApiResult.loading("");
      print(request.toJson());
      final response = await apiProvider.post(EndPoints.checkHostelRoomAvailability,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        var responseData = HostelRoomAvailabilityResponseModel.fromJson(body);
        if(responseData.status == 1){
          Get.close(2);
          final updatedRequest = request.copyWith(roomModel: request.roomModel?.copyWith(checkInDate: request.checkInDate,checkOutDate: request.checkOutDate,guestCount: request.guestCount));
          bookingRequestModelObserver.value = updatedRequest;
          checkHostelRoomAvailabilityObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      checkHostelRoomAvailabilityObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> performConfirmBooking(BookingRequestModel? request) async {
    try{
      if(request == null) throw "Invalid Booking Request";
      razorpay.clear();
      confirmBookingObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.confirmBooking,request?.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = ConfirmBookingResponseModel.fromJson(body);
        print(responseData.toJson());
        if(responseData.status == 1){
          print("Order Id 1: ${responseData.data?.bookingResponse?.orderId ?? ""}");
          var options = {
            'key': ConfigKeys.razorPayId,
            'order_id': responseData.data?.bookingResponse?.orderId ?? "",
            'name': 'SastaStay',
            'description': 'Booking Hostel Room',
            'prefill': {}
          };
          options['prefill'] = {'contact': (responseData.data?.bookingResponse?.userId as UserModel).mobile, 'email': (responseData.data?.bookingResponse?.userId as UserModel).email};
          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (response) async {
            confirmBookingObserver.value = ApiResult.success(responseData);
            await updateOrderPaymentStatus(responseData.data?.bookingResponse?.orderId ?? "");
          });
          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (razorPayResponse){
            confirmBookingObserver.value = ApiResult.error(razorPayResponse.message?.replaceAll("undefined", "Payment Aborted. Please try again") ?? "");
          });
          razorpay.open(options);
          // placeOrderObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error",e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      confirmBookingObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> updateOrderPaymentStatus(String? orderId) async{
    try{
      updateBookingStatusObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.updateBookingStatus,{"orderId":orderId});
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = ConfirmBookingResponseModel.fromJson(body);
        if(responseData.status == 1){
          updateBookingStatusObserver.value = ApiResult.success(responseData);
          confirmBookingObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      razorpay.clear();
      Get.snackbar("Error",e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      updateBookingStatusObserver.value = const ApiResult.error("Unable to Start Booking");
      confirmBookingObserver.value = ApiResult.error(e.toString());
    }
  }


}
