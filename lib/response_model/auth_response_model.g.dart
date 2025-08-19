// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidateVersionResponseModelImpl _$$ValidateVersionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidateVersionResponseModelImpl(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ValidateDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ValidateVersionResponseModelImplToJson(
        _$ValidateVersionResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$ValidateDataModelImpl _$$ValidateDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidateDataModelImpl(
      validVersion: json['validVersion'] as bool?,
      userBlocked: json['userBlocked'] as bool?,
      userData: json['userData'] == null
          ? null
          : UserModel.fromJson(json['userData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ValidateDataModelImplToJson(
        _$ValidateDataModelImpl instance) =>
    <String, dynamic>{
      'validVersion': instance.validVersion,
      'userBlocked': instance.userBlocked,
      'userData': instance.userData,
    };

_$PrimaryResponseModelImpl _$$PrimaryResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrimaryResponseModelImpl(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PrimaryResponseModelImplToJson(
        _$PrimaryResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

_$VerifyOtpResponseModelImpl _$$VerifyOtpResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpResponseModelImpl(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : VerifyOtpDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerifyOtpResponseModelImplToJson(
        _$VerifyOtpResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$VerifyOtpDataModelImpl _$$VerifyOtpDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpDataModelImpl(
      registerUser: json['registerUser'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$VerifyOtpDataModelImplToJson(
        _$VerifyOtpDataModelImpl instance) =>
    <String, dynamic>{
      'registerUser': instance.registerUser,
      'token': instance.token,
    };

_$UploadFileResponseModelImpl _$$UploadFileResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadFileResponseModelImpl(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$UploadFileResponseModelImplToJson(
        _$UploadFileResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$FetchUserDetailsResponseModelImpl
    _$$FetchUserDetailsResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$FetchUserDetailsResponseModelImpl(
          status: json['status'] as int?,
          message: json['message'] as String?,
          data: json['data'] == null
              ? null
              : UserModel.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$FetchUserDetailsResponseModelImplToJson(
        _$FetchUserDetailsResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String?,
      image: json['image'] as String?,
      mobile: json['mobile'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      profilePic: json['profilePic'] as String?,
      otp: json['otp'] as int?,
      source: json['source'] as String?,
      version: json['version'] as String?,
      deviceId: json['deviceId'] as String?,
      blocked: json['blocked'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'mobile': instance.mobile,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob,
      'profilePic': instance.profilePic,
      'otp': instance.otp,
      'source': instance.source,
      'version': instance.version,
      'deviceId': instance.deviceId,
      'blocked': instance.blocked,
    };
