import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../api/api_provider.dart';
import '../api/api_result.dart';
import '../api/end_points.dart';
import '../components/helper_bottom_sheet.dart';
import '../request_model/auth_request_model.dart';
import '../request_model/bookings_request_model.dart';
import '../response_model/auth_response_model.dart';
import '../response_model/bookings_response_model.dart';
import '../utils/ConfigKeys.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';

class TransactionViewModel extends GetxController {

  final authViewModel = Get.put(AuthViewModel());
  final apiProvider = Get.put(ApiProvider());

  final Razorpay razorpay = Razorpay();


  final fetchTransactionsObserver =  PaginationModel(data: const ApiResult<FetchTransactionsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;

  final addAmountToWalletObserver = const ApiResult<ConfirmBookingResponseModel>.init().obs;
  final updateDepositStatusObserver = const ApiResult<ConfirmBookingResponseModel>.init().obs;


  Future<void> performAddAmountToBalance(int? amount,BuildContext context) async {
    try{
      if(amount == null) throw "Invalid Booking Request";
      razorpay.clear();
      addAmountToWalletObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.addAmountToWallet,{"amount":amount});
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = ConfirmBookingResponseModel.fromJson(body);
        print("responseData");
        print(responseData);

        if(responseData.status == 1){

          var options = {
            'key': ConfigKeys.razorPayId,
            'order_id': responseData.data?.transactionResponse?.orderId ?? "",
            'name': 'SastaStay',
            'description': 'Booking Hostel Room',
            'prefill': {}
          };

          options['prefill'] = {'contact': UserModel.fromJson(responseData.data?.transactionResponse?.userId).mobile, 'email': UserModel.fromJson(responseData.data?.transactionResponse?.userId).email};

          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (response) async {
            addAmountToWalletObserver.value = ApiResult.success(responseData);
            await updateDepositStatus(responseData.data?.transactionResponse?.orderId ?? "",amount,context);
          });
          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (razorPayResponse){
            addAmountToWalletObserver.value = ApiResult.error(razorPayResponse.message?.replaceAll("undefined", "Payment Aborted. Please try again") ?? "");
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
      addAmountToWalletObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> updateDepositStatus(String? orderId,int amount,BuildContext context) async{
    try{
      updateDepositStatusObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.updateDepositStatus,{"orderId":orderId});
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = ConfirmBookingResponseModel.fromJson(body);
        if(responseData.status == 1){
          authViewModel.fetchUserDetailsObserver.value.whenOrNull(
            success:(data){
              final userData = (data as FetchUserDetailsResponseModel);
              final newResponse = userData.copyWith(data: userData.data?.copyWith(wallet: (userData.data?.wallet ?? 0) + amount));
              authViewModel.fetchUserDetailsObserver.value = ApiResult.success(newResponse);
            }
          );
          updateDepositStatusObserver.value = ApiResult.success(responseData);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // allows full height scroll
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return HelperBottomSheet(assetImage: "assets/images/success.png",title:"Deposited Successfully",
                  message: "Your Money Deposited Successfully To Your Wallet"
                  ,btn1Txt: "Done", btn1Click: () {
                    Get.back();
                  });
            },
          );
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      razorpay.clear();
      Get.snackbar("Error",e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      updateDepositStatusObserver.value = ApiResult.error(e.toString());
    }
  }



  Future<void> fetchTransactions(PaginationRequestModel request,bool refresh) async {
    final observer = fetchTransactionsObserver;
    try{
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchTransactionsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
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

      final response = await apiProvider.post(EndPoints.fetchTransactions,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchTransactionsResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchTransactionsResponseModel?)?.data?.toList();
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


}