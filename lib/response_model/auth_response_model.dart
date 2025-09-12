import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pg_hostel/request_model/auth_request_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

class PaginationModel<T>{
  T data;
  bool isLoading;
  bool isPaginationCompleted;
  int page;
  String error;

  PaginationModel({
    required this.data,
    required this.isLoading,
    required this.isPaginationCompleted,
    required this.page,
    required this.error
  });
}

class OnBoardingDataModel<T>{
  String image;
  String title;
  String message;

  OnBoardingDataModel({
    required this.image,
    required this.title,
    required this.message
  });
}



@Freezed()
class ValidateVersionResponseModel with _$ValidateVersionResponseModel{
  const factory ValidateVersionResponseModel({
    int? status,
    String? message,
    ValidateDataModel? data
  }) = _ValidateVersionResponseModel;

  factory ValidateVersionResponseModel.fromJson(Map<String, dynamic> json) => _$ValidateVersionResponseModelFromJson(json);
}

@Freezed()
class ValidateDataModel with _$ValidateDataModel{
  const factory ValidateDataModel({
    bool? validVersion,
    bool? userBlocked,
    UserModel? userData,
    List<String>? banners
  }) = _ValidateDataModel;

  factory ValidateDataModel.fromJson(Map<String, dynamic> json) => _$ValidateDataModelFromJson(json);
}



@Freezed()
class PrimaryResponseModel with _$PrimaryResponseModel{
  const factory PrimaryResponseModel({
    int? status,
    String? message
  }) = _PrimaryResponseModel;

  factory PrimaryResponseModel.fromJson(Map<String, dynamic> json) => _$PrimaryResponseModelFromJson(json);

}


@Freezed()
class VerifyOtpResponseModel with _$VerifyOtpResponseModel{
  const factory VerifyOtpResponseModel({
    int? status,
    String? message,
    VerifyOtpDataModel? data
  }) = _VerifyOtpResponseModel;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseModelFromJson(json);
}

@Freezed()
class VerifyOtpDataModel with _$VerifyOtpDataModel{
  const factory VerifyOtpDataModel({
    bool? registerUser,
    String? token,
  }) = _VerifyOtpDataModel;

  factory VerifyOtpDataModel.fromJson(Map<String, dynamic> json) => _$VerifyOtpDataModelFromJson(json);
}

@Freezed()
class UploadFileResponseModel with _$UploadFileResponseModel{
  const factory UploadFileResponseModel({
    int? status,
    String? message,
    String? data
  }) = _UploadFileResponseModel;

  factory UploadFileResponseModel.fromJson(Map<String, dynamic> json) => _$UploadFileResponseModelFromJson(json);
}

@Freezed()
class FetchUserDetailsResponseModel with _$FetchUserDetailsResponseModel{
  const factory FetchUserDetailsResponseModel({
    int? status,
    String? message,
    UserModel? data
  }) = _FetchUserDetailsResponseModel;

  factory FetchUserDetailsResponseModel.fromJson(Map<String, dynamic> json) => _$FetchUserDetailsResponseModelFromJson(json);
}

@Freezed()
class UserModel with _$UserModel{
  const factory UserModel({
    @JsonKey(name: '_id') String? id,
    String? image,
    int? mobile,
    String? name,
    String? email,
    String? gender,
    String? dob,
    String? profilePic,
    int? otp,
    String? source,
    String? version,
    String? deviceId,
    bool? blocked,
    dynamic favouriteHostels,
    dynamic onGoingBookings,
    dynamic upComingBookings,
    dynamic wallet,
    LocationModel? address,
    String? referralCode,
    List<String>? referrals,
    int? referralEarnings,
    List<DocumentDataModel>? kycDocuments
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@Freezed()
class DocumentDataModel with _$DocumentDataModel{
  const factory DocumentDataModel({
    required String? documentType,
    required String? documentStatus,
    required String? uploadedUrl,
    required String? errorTxt
  }) = _DocumentDataModel;

  factory DocumentDataModel.fromJson(Map<String, dynamic> json) => _$DocumentDataModelFromJson(json);
}

@Freezed()
class FetchNotificationsResponseModel with _$FetchNotificationsResponseModel{
  const factory FetchNotificationsResponseModel({
    int? status,
    String? message,
    List<NotificationModel>? data
  }) = _FetchNotificationsResponseModel;

  factory FetchNotificationsResponseModel.fromJson(Map<String, dynamic> json) => _$FetchNotificationsResponseModelFromJson(json);
}

@Freezed()
class NotificationModel with _$NotificationModel{
  const factory NotificationModel({
    String? topic,
    String? title,
    String? body
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}


