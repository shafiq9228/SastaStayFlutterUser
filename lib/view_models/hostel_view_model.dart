import 'package:get/get.dart';

import '../api/api_provider.dart';
import '../api/api_result.dart';
import '../api/end_points.dart';
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
  final fetchHostelDetailsObserver = const ApiResult<FetchHostelDetailsResponseModel>.init().obs;
  final fetchHostelsObserver =  PaginationModel(data: const ApiResult<FetchHostelsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchAmenitiesObserver =  PaginationModel(data: const ApiResult<FetchAmenitiesResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;
  final fetchHostelRoomsObserver =  PaginationModel(data: const ApiResult<FetchHostelRoomsResponseModel>.init().obs, isLoading: false, isPaginationCompleted: false, page: 1, error: "").obs;


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


  Future<void> fetchHostels(PaginationRequestModel request,bool refresh) async {
    final observer = fetchHostelsObserver;
    try{
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

      final String? validatorResponse = AuthUtils.validateRequestFields(['page'], request.toJson());
      if(validatorResponse != null) throw validatorResponse;

      final response = await apiProvider.post(EndPoints.fetchHostels,request.toJson());
      final body = response.body;
      if(response.isOk && body !=null){
        final responseData = FetchHostelsResponseModel.fromJson(body);
        if(responseData.status == 1){
          observer.value.data.value.maybeWhen(success: (data) {
            final oldList = (data as FetchHostelsResponseModel?)?.data?.toList();
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


}