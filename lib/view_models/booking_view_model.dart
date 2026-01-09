import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../api/api_provider.dart';
import '../api/api_result.dart';
import '../api/end_points.dart';
import '../pages/booking_confirmed_page.dart';
import '../pages/checkout_page.dart';
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
  final hostelViewModel = Get.put(HostelViewModel());
  final Razorpay razorpay = Razorpay();


  Rx<BookingRequestModel?> bookingRequestModelObserver = Rx<BookingRequestModel?>(null);

  final checkAvailabilityDatesObserver = const ApiResult<HostelRoomAvailabilityDatesResponseModel>.init().obs;


  final checkHostelRoomAvailabilityObserver = const ApiResult<HostelRoomAvailabilityResponseModel>.init().obs;
  final confirmBookingObserver = const ApiResult<ConfirmBookingResponseModel>.init().obs;
  final updateBookingStatusObserver = const ApiResult<ConfirmBookingResponseModel>.init().obs;
  final cancelBookingStatusObserver = const ApiResult<ConfirmBookingResponseModel>.init().obs;


  final fetchAllBookingsObserver =  PaginationModel(data: const ApiResult<FetchBookingsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchOngoingBookingsObserver =  PaginationModel(data: const ApiResult<FetchBookingsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchUpComingBookingsObserver =  PaginationModel(data: const ApiResult<FetchBookingsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchPastBookingsObserver =  PaginationModel(data: const ApiResult<FetchBookingsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchCancelledBookingsObserver =  PaginationModel(data: const ApiResult<FetchBookingsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;


  final fetchBookingDetailsObserver = const ApiResult<FetchBookingDetailsResponseModel>.init().obs;

  RxList<GuestDetailsModel> guestDetailsList = <GuestDetailsModel>[].obs;
  Rx<CouponDataModel?> selectedCoupon = Rx<CouponDataModel?>(null);
  RxBool userWalletBalance = false.obs;


  Future<void> checkAvailabilityDates(String? hostelId,String? roomId,int? guestCount) async {
    try{
      checkAvailabilityDatesObserver.value = const ApiResult.loading("");

      final response = await apiProvider.post(EndPoints.checkHostelRoomAvailabilityDates,{"hostelId":hostelId,"roomId":roomId,"guestCount":guestCount});
      final body = response.body;

      if(response.isOk && body !=null){
        var responseData = HostelRoomAvailabilityDatesResponseModel.fromJson(body);
        if(responseData.status == 1){
          checkAvailabilityDatesObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      checkAvailabilityDatesObserver.value = ApiResult.error(e.toString());
    }
  }



  Future<void> checkHostelRoomAvailability(BookingRequestModel? request,int navigate) async {
    try{
      checkHostelRoomAvailabilityObserver.value = const ApiResult.loading("");

      final newRequest = request?.copyWith(couponId: selectedCoupon.value?.id ?? "",useWalletBalance:userWalletBalance.value);
      final response = await apiProvider.post(EndPoints.checkHostelRoomAvailability,newRequest?.toJson());
      final body = response.body;

      if(response.isOk && body !=null){
        var responseData = HostelRoomAvailabilityResponseModel.fromJson(body);
        if(responseData.status == 1){
          final updatedRequest = request?.copyWith(roomModel: request.roomModel?.copyWith(checkInDate: request.checkInDate,checkOutDate: request.checkOutDate,guestCount: request.guestCount));
          bookingRequestModelObserver.value = updatedRequest;

          if(navigate == 2){
            hostelViewModel.fetchHostelDetailsObserver.value.maybeWhen(
                success: (data){
                  final hostelData = (data as FetchHostelDetailsResponseModel).data;
                  Get.close(2);
                  Get.to(() => CheckoutPage(hostelData: hostelData));
                },
                orElse: (){
                  Get.close(2);
                }
            );
          }
          else if(navigate == 1){
            Get.close(1);
          }
          checkHostelRoomAvailabilityObserver.value = ApiResult.success(responseData);
          return;
        }
        else if(responseData.status == 2 || responseData.status == 3){
          checkHostelRoomAvailabilityObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      selectedCoupon.value = null;
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      checkHostelRoomAvailabilityObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<ConfirmBookingResponseModel?> performConfirmBooking(
      BookingRequestModel? request,
      ) async {
    try {
      if (request == null) throw "Invalid Booking Request";

      final newRequest = request.copyWith(
        couponId: selectedCoupon.value?.id ?? "",
        useWalletBalance: userWalletBalance.value,
      );

      confirmBookingObserver.value = const ApiResult.loading("");

      final response = await apiProvider.post(EndPoints.confirmBooking, newRequest.toJson());

      final body = response.body;
      if (!response.isOk || body == null) {
        throw "Failed to confirm booking";
      }

      final responseData = ConfirmBookingResponseModel.fromJson(body);
      debugPrint("ConfirmBookingResponse: $responseData");

      /// 🔹 PAYMENT REQUIRED
      if (responseData.status == 1) {
        confirmBookingObserver.value = ApiResult.success(responseData);
        return responseData;
      }

      /// 🔹 NO PAYMENT (Wallet / Free booking)
      if (responseData.status == 2) {
        confirmBookingObserver.value = ApiResult.success(responseData);

        await updateOrderPaymentStatus(
          responseData.data?.bookingResponse?.id ?? "",
        );

        return responseData;
      }

      throw responseData.message ?? "Booking failed";
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: CustomColors.primary,
        colorText: CustomColors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      confirmBookingObserver.value = ApiResult.error(e.toString());
      return null;
    }
  }


  Future<void> updateOrderPaymentStatus(String? bookingId) async{
    try{
      updateBookingStatusObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.updateBookingStatus,{"bookingId":bookingId});
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = ConfirmBookingResponseModel.fromJson(body);
        if(responseData.status == 1){
          guestDetailsList.clear();
          bookingRequestModelObserver.value = null;
          Get.to(() => BookingConfirmedPage(bookingId: bookingId ?? ""));
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


  // Future<void> performConfirmBooking(BookingRequestModel? request) async {
  //   try{
  //     if(request == null) throw "Invalid Booking Request";
  //     razorpay.clear();
  //     final newRequest = request.copyWith(couponId: selectedCoupon.value?.id ?? "",useWalletBalance:userWalletBalance.value);
  //     confirmBookingObserver.value = const ApiResult.loading("");
  //     final response = await apiProvider.post(EndPoints.confirmBooking,newRequest.toJson());
  //     final body = response.body;
  //     if(response.isOk && body !=null){
  //       final responseData = ConfirmBookingResponseModel.fromJson(body);
  //       print("responseData");
  //       print(responseData);
  //
  //       if(responseData.status == 1){
  //         var options = {
  //           'key': ConfigKeys.razorPayId,
  //           'order_id': responseData.data?.bookingResponse?.orderId ?? "",
  //           'name': 'SastaStay',
  //           'description': 'Booking Hostel Room',
  //           'prefill': {}
  //         };
  //         print("hello1");
  //         options['prefill'] = {'contact': UserModel.fromJson(responseData.data?.bookingResponse?.userId).mobile, 'email': UserModel.fromJson(responseData.data?.bookingResponse?.userId).email};
  //
  //         razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (response) async {
  //           confirmBookingObserver.value = ApiResult.success(responseData);
  //           await updateOrderPaymentStatus(responseData.data?.bookingResponse?.id ?? "");
  //         });
  //         razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (razorPayResponse){
  //           confirmBookingObserver.value = ApiResult.error(razorPayResponse.message?.replaceAll("undefined", "Payment Aborted. Please try again") ?? "");
  //         });
  //         razorpay.open(options);
  //         // placeOrderObserver.value = ApiResult.success(responseData);
  //         return;
  //       }
  //       else if(responseData.status == 2){
  //         confirmBookingObserver.value = ApiResult.success(responseData);
  //         await updateOrderPaymentStatus(responseData.data?.bookingResponse?.id ?? "");
  //         return;
  //       }
  //       throw "${responseData.message}";
  //     }
  //     throw "Response Body Null";
  //   }
  //   catch(e){
  //     Get.snackbar("Error",e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
  //     confirmBookingObserver.value = ApiResult.error(e.toString());
  //   }
  // }

  // Future<void> updateOrderPaymentStatus(String? bookingId) async{
  //   try{
  //     updateBookingStatusObserver.value = const ApiResult.loading("");
  //     final response = await apiProvider.post(EndPoints.updateBookingStatus,{"bookingId":bookingId});
  //     final body = response.body;
  //     if(response.isOk && body !=null){
  //       final responseData = ConfirmBookingResponseModel.fromJson(body);
  //       if(responseData.status == 1){
  //         guestDetailsList.clear();
  //         bookingRequestModelObserver.value = null;
  //         Get.to(() => BookingConfirmedPage(bookingId: bookingId ?? ""));
  //         updateBookingStatusObserver.value = ApiResult.success(responseData);
  //         confirmBookingObserver.value = ApiResult.success(responseData);
  //         return;
  //       }
  //       throw "${responseData.message}";
  //     }
  //     throw "Response Body Null";
  //   }
  //   catch(e){
  //     razorpay.clear();
  //     Get.snackbar("Error",e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
  //     updateBookingStatusObserver.value = const ApiResult.error("Unable to Start Booking");
  //     confirmBookingObserver.value = ApiResult.error(e.toString());
  //   }
  // }


  Future<void> performCancelBooking(String? bookingId) async{
    try{
      cancelBookingStatusObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.cancelBooking,{"bookingId":bookingId});
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = ConfirmBookingResponseModel.fromJson(body);
        if(responseData.status == 1){
          Get.snackbar("Success","Booking Cancelled Successfully.Your Amount Refund Back To Your Wallet",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
          fetchBookingDetails(bookingId ?? "");
          cancelBookingStatusObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error",e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      cancelBookingStatusObserver.value = ApiResult.error(e.toString());
    }
  }



  Future<void> fetchBookings(PaginationRequestModel request,bool refresh) async {
    final observer = request.query == "Ongoing" ? fetchOngoingBookingsObserver : request.query == "Upcoming" ? fetchUpComingBookingsObserver : request.query == "Past" ? fetchPastBookingsObserver : request.query == "Cancelled" ? fetchCancelledBookingsObserver :fetchAllBookingsObserver;
    try{
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchBookingsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
      }

      if (observer.value.isPaginationCompleted || observer.value.isLoading == true) return;

      if(observer.value.page == 1){
        observer.value.data.value = const ApiResult.loading("");
      }
      else{
        observer.value.isLoading = true;
        observer.refresh();
      }

      const maxListApiReturns = 20;
      observer.refresh();

      final String? validatorResponse = AuthUtils.validateRequestFields(['page'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;

      final response = await apiProvider.post(EndPoints.fetchBookings,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchBookingsResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchBookingsResponseModel?)?.data?.toList();
            oldList?.addAll(responseData.data ?? List.empty());
            observer.value.data.value = ApiResult.success(responseData.copyWith(data: oldList));
          }, orElse: () {
            observer.value.data.value = ApiResult.success(responseData);
          });

          observer.value.page = observer.value.page + 1;
          if ((responseData.data?.length ?? 0) < maxListApiReturns) {
            observer.value.isPaginationCompleted = true;
          }
          observer.value.isLoading = false;
          observer.refresh();
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      observer.value.data.value = ApiResult.error(e.toString());
      observer.value.isLoading = false;
      observer.refresh();
    }
  }

  Future<void> fetchBookingDetails(String bookingId) async{
    try{
      fetchBookingDetailsObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.fetchBookingDetails,{"bookingId":bookingId});
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchBookingDetailsResponseModel.fromJson(body);
        if(responseData.status == 1){
          fetchBookingDetailsObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      print(e.toString());
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      fetchBookingDetailsObserver.value = ApiResult.error(e.toString());
    }
  }

}
