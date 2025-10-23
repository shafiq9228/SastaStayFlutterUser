import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';

import '../api/api_provider.dart';
import '../api/api_result.dart';
import '../api/end_points.dart';
import '../components/helper_bottom_sheet.dart';
import '../request_model/auth_request_model.dart';
import '../request_model/bookings_request_model.dart';
import '../response_model/auth_response_model.dart';
import '../response_model/hostel_response_model.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';
import '../utils/preference_manager.dart';

class HostelViewModel extends GetxController{

  final apiProvider = Get.put(ApiProvider());
  final preferenceManager = Get.put(PreferenceManager());

  Rx<BookingRequestModel?> bookingRequestModelObserver = Rx<BookingRequestModel?>(null);
  final updateFavouritesObserver = const ApiResult<PrimaryResponseModel>.init().obs;

  final fetchCouponsObserver =  PaginationModel(data: const ApiResult<FetchCouponsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchNotificationsObserver =  PaginationModel(data: const ApiResult<FetchNotificationsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final deleteNotificationObserver =   const ApiResult<PrimaryResponseModel>.init().obs;

  final fetchHostelDetailsObserver = const ApiResult<FetchHostelDetailsResponseModel>.init().obs;

  final fetchFavouriteHostelsObserver =  PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchSearchedHostelsObserver =  PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchHostelsObserver =  PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchNearbyHostelsObserver =  PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchPopularHostelsObserver =  PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchFilterHostelsObserver =  PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;


  final fetchAmenitiesObserver =  PaginationModel(data: const ApiResult<FetchAmenitiesResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchHostelRoomsObserver =  PaginationModel(data: const ApiResult<FetchHostelRoomsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;

  final fetchRatingAndReviewsObserver =  PaginationModel(data: const ApiResult<FetchRatingAndReviewsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;

  final addRatingAndReviewObserver =  const ApiResult<PrimaryResponseModel>.init().obs;

  RxList<String> filterLocations = <String>[].obs;
  RxList<String> filterHostelTypes = <String>[].obs;
  RxList<String> filterRoomTypes = <String>[].obs;
  RxString bookingType = "Daily".obs;
  Rx<RangeValues> rangeValue =  RangeValues(0.0, 20000.0).obs;


  final fetchMapLocationsObserver = const ApiResult<FetchHostelsResponseModel>.init().obs;


  Future<void> fetchHostelDetails(PaginationRequestModel request) async {
    try{
      fetchHostelDetailsObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.fetchHostelDetails,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        var responseData = FetchHostelDetailsResponseModel.fromJson(body);
        if(responseData.status == 1){
          fetchHostelDetailsObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      fetchHostelDetailsObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> fetchMapLocations(PaginationRequestModel request) async {
    try{
      fetchMapLocationsObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.fetchMapLocation,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        var responseData = FetchHostelsResponseModel.fromJson(body);
        if(responseData.status == 1){
          fetchMapLocationsObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      fetchMapLocationsObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> addRatingAndReview(RatingReviewRequestModel request,BuildContext context) async {
    try{
      addRatingAndReviewObserver.value = const ApiResult.loading("");
      final String? validatorResponse = AuthUtils.validateRequestFields(['hostelId','rating','review'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;
      final response = await apiProvider.post(EndPoints.addRatingAndReviews,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        var responseData = PrimaryResponseModel.fromJson(body);
        if(responseData.status == 1){
          Get.close(1);
          addRatingAndReviewObserver.value = ApiResult.success(responseData);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // allows full height scroll
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return HelperBottomSheet(assetImage: "assets/images/congratulations.png",title:"Thank You For Feedback",
                  message: "Your Rating Submitted Successfully"
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
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      addRatingAndReviewObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> fetchHostels(PaginationRequestModel request,bool refresh) async {
    final observer = request.type == "favourites" ? fetchFavouriteHostelsObserver : request.type == "search" ? fetchSearchedHostelsObserver : request.type == "nearby" ? fetchNearbyHostelsObserver : request.type == "popular" ? fetchPopularHostelsObserver : request.type == "filter" ? fetchFilterHostelsObserver : fetchHostelsObserver;
    try{
      PaginationRequestModel newRequest = request;
      if(request.type == "filter"){
        newRequest = request.copyWith(filterRequest: FilterRequestModel(locations: filterLocations,hostelTypes: filterHostelTypes,roomTypes: filterRoomTypes,bookingType: bookingType.value,startPrice: rangeValue.value.start,endPrice: rangeValue.value.end));
      }
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
      }

      if (observer.value.isPaginationCompleted || observer.value.isLoading == true) return;

      if(observer.value.page == 1){
        observer.value.data.value = const ApiResult.loading("");
      }
      else{
        observer.value.isLoading = true;
        observer.refresh();
      }

      const maxListApiReturns = 10;
      observer.refresh();

      final String? validatorResponse = AuthUtils.validateRequestFields(['page'], newRequest.toJson());
      if(validatorResponse != null) throw validatorResponse;

      final response = await apiProvider.post(EndPoints.fetchHostels,newRequest.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchHostelsResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchHostelsResponseModel?)?.data?.toList();
            for (final hostel in responseData.data ?? []) {
              if (oldList?.any((e) => e.id == hostel.id) == false) {
                oldList?.add(hostel);
              }
            }
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

  Future<void> fetchAmenities(PaginationRequestModel request,bool refresh) async {
    final observer = fetchAmenitiesObserver;
    try{
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchAmenitiesResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
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

      final response = await apiProvider.post(EndPoints.fetchAmenities,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchAmenitiesResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchAmenitiesResponseModel?)?.data?.toList();
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

  Future<void> fetchRatingAndReviews(PaginationRequestModel request,bool refresh) async {
    final observer = fetchRatingAndReviewsObserver;
    try{
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchRatingAndReviewsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
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

      final response = await apiProvider.post(EndPoints.fetchRatingAndReviews,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchRatingAndReviewsResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchRatingAndReviewsResponseModel?)?.data?.toList();
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

  Future<void> fetchHostelRooms(PaginationRequestModel request,bool refresh) async {
    final observer = fetchHostelRoomsObserver;
    try{
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchHostelRoomsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
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

      final response = await apiProvider.post(EndPoints.fetchHostelRooms,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchHostelRoomsResponseModel.fromJson(body);
        if(responseData.status == 1){

          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchHostelRoomsResponseModel?)?.data?.toList();
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

  Future<void> fetchCoupons(PaginationRequestModel request,bool refresh) async {
    final observer = fetchCouponsObserver;
    try{
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchCouponsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
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

      final response = await apiProvider.post(EndPoints.fetchCoupons,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchCouponsResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchCouponsResponseModel?)?.data?.toList();
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

  Future<void> fetchNotifications(PaginationRequestModel request,bool refresh) async {
    final observer = fetchNotificationsObserver;
    try{
      if(refresh == true){
        observer.value = PaginationModel(data: const ApiResult<FetchNotificationsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "");
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

      final response = await apiProvider.post(EndPoints.fetchNotifications,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchNotificationsResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchNotificationsResponseModel)?.data?.toList();
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

  Future<void> deleteNotification(String? notificationId) async {
    try{
      if(notificationId == null || notificationId.trim().isEmpty) throw "couponId Is Required";
      deleteNotificationObserver.value = ApiResult.loading(notificationId);
      final response = await apiProvider.post(EndPoints.deleteNotification,{"notificationId":notificationId});
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = PrimaryResponseModel.fromJson(body);
        if(responseData.status == 1){
          fetchNotificationsObserver.value.data.value.whenOrNull(success: (responseData){
            var userResponse = (responseData as FetchNotificationsResponseModel);
            final coupons = userResponse.data?.toList() ?? List.empty();
            coupons.removeWhere((notification) => notification.id == notificationId);
            userResponse = userResponse.copyWith(data:coupons);
            fetchNotificationsObserver.value.data.value = ApiResult.success(userResponse);
          });
          deleteNotificationObserver.value = ApiResult.success(responseData);
          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      deleteNotificationObserver.value = ApiResult.error(e.toString());
    }
  }

  Future<void> updateFavouriteStatus(String hostelId,bool isFavorite) async {
    try{
      updateFavouritesObserver.value = const ApiResult.loading("");
      final response = await apiProvider.post(EndPoints.updateFavouriteStatus,{"hostelId":hostelId});
      final body = response.body;
      if(response.isOk && body !=null){
        var responseData = PrimaryResponseModel.fromJson(body);
        if(responseData.status == 1){
          final updatingObserverList = [fetchHostelsObserver,fetchSearchedHostelsObserver,fetchFilterHostelsObserver,fetchFavouriteHostelsObserver,fetchNearbyHostelsObserver,fetchPopularHostelsObserver];
          for (var observer in updatingObserverList) {
            observer.value.data.value.whenOrNull(
                success: (data){
                  final observerData = (data as FetchHostelsResponseModel);
                  final list = observerData.data?.toList() ?? List.empty();
                  final index = list.indexWhere((element) => element.id == hostelId);
                  if(index != -1){
                    final updatedUser = list[index].copyWith(isFavorite:!isFavorite);
                    list[index] = updatedUser;
                    observer.value.data.value = ApiResult.success(observerData.copyWith(data: list));
                    observer.refresh();
                  }
                });
          }
          updateFavouritesObserver.value = ApiResult.success(responseData);

          fetchHostelDetailsObserver.value.whenOrNull(
              success: (data) {
                final observerData = (data as FetchHostelDetailsResponseModel);
                final updatedData = observerData.data?.copyWith(isFavorite: !isFavorite);
                fetchHostelDetailsObserver.value = ApiResult.success(observerData.copyWith(data: updatedData));
                fetchHostelDetailsObserver.refresh();
              }
          );

          return;
        }
        throw "${responseData.message}";
      }
      throw "Response Body Null";
    }
    catch(e){
      Get.snackbar("Error", e.toString(),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
      updateFavouritesObserver.value = ApiResult.error(e.toString());
    }
  }

}