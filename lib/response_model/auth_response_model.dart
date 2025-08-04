import 'package:freezed_annotation/freezed_annotation.dart';

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
    UserModel? userData
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
    String? profilePic,
    int? otp,
    String? source,
    String? version,
    String? deviceId,
    bool? blocked
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}