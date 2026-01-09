import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pg_hostel/response_model/auth_response_model.dart';

import '../response_model/address_response_model.dart';

part 'auth_request_model.freezed.dart';
part 'auth_request_model.g.dart';



@Freezed()
class ValidateVersionRequestModel with _$ValidateVersionRequestModel{
  const factory ValidateVersionRequestModel({
    required String? version
  }) = _ValidateVersionRequestModel;

  factory ValidateVersionRequestModel.fromJson(Map<String, dynamic> json) => _$ValidateVersionRequestModelFromJson(json);
}

@Freezed()
class PaginationRequestModel with _$PaginationRequestModel{
  const factory PaginationRequestModel({
    String? query,
    String? searchQuery,
    String? type,
    String? docId,
    String? hostelId,
    double? latitude,
    double? longitude,
    required int? page,
    FilterRequestModel? filterRequest,
    String? sort
  }) = _PaginationRequestModel;

  factory PaginationRequestModel.fromJson(Map<String, dynamic> json) => _$PaginationRequestModelFromJson(json);
}

@Freezed()
class FilterRequestModel with _$FilterRequestModel{
  const factory FilterRequestModel({
    List<String>? locations,
    List<String>? hostelTypes,
    List<String>? roomTypes,
    String? bookingType,
    double? startPrice,
    double? endPrice
  }) = _FilterRequestModel;

  factory FilterRequestModel.fromJson(Map<String, dynamic> json) => _$FilterRequestModelFromJson(json);
}

@Freezed()
class SendOtpRequestModel with _$SendOtpRequestModel{
  const factory SendOtpRequestModel({
    required int? mobile
  }) = _SendOtpRequestModel;

  factory SendOtpRequestModel.fromJson(Map<String, dynamic> json) => _$SendOtpRequestModelFromJson(json);
}


@Freezed()
class TrueCallerRequestModel with _$TrueCallerRequestModel{
  const factory TrueCallerRequestModel({
    required String? authorizationCode,
    required String? codeVerifier,
    required String? source,
    required String? version,
    required String? deviceId,
  }) = _TrueCallerRequestModel;

  factory TrueCallerRequestModel.fromJson(Map<String, dynamic> json) => _$TrueCallerRequestModelFromJson(json);
}

@Freezed()
class VerifyOtpRequestModel with _$VerifyOtpRequestModel{
  const factory VerifyOtpRequestModel({
    String? email,
    int? mobile,
    required int? otp,
    required String? source,
    required String? version,
    required String? deviceId,
  }) = _VerifyOtpRequestModel;

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestModelFromJson(json);
}

@Freezed()
class GoogleAuthRequestModel with _$GoogleAuthRequestModel{
  const factory GoogleAuthRequestModel({
    required String? email,
    required String? name,
    required String? source,
    required String? version,
    required String? deviceId,
  }) = _GoogleAuthRequestModel;

  factory GoogleAuthRequestModel.fromJson(Map<String, dynamic> json) => _$GoogleAuthRequestModelFromJson(json);
}

@Freezed()
class RegisterUserRequestModel with _$RegisterUserRequestModel{
  const factory RegisterUserRequestModel({
    bool? registerByMobile,
    String? image,
    String? mobile,
    String? name,
    String? email,
    String? dob,
    String? gender,
    LocationModel? address,
    String? referralCode,
    List<DocumentDataModel>? kycDocuments
  }) = _RegisterUserRequestModel;

  factory RegisterUserRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterUserRequestModelFromJson(json);
}

@Freezed()
class LocationModel with _$LocationModel{
  const factory LocationModel({
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? landMark,
    int? pinCode,
    double? latitude,
    double? longitude,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}