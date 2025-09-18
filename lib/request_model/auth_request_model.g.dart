// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidateVersionRequestModelImpl _$$ValidateVersionRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidateVersionRequestModelImpl(
      version: json['version'] as String?,
    );

Map<String, dynamic> _$$ValidateVersionRequestModelImplToJson(
        _$ValidateVersionRequestModelImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
    };

_$PaginationRequestModelImpl _$$PaginationRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationRequestModelImpl(
      query: json['query'] as String?,
      searchQuery: json['searchQuery'] as String?,
      type: json['type'] as String?,
      docId: json['docId'] as String?,
      hostelId: json['hostelId'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      page: json['page'] as int?,
      filterRequest: json['filterRequest'] == null
          ? null
          : FilterRequestModel.fromJson(
              json['filterRequest'] as Map<String, dynamic>),
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$$PaginationRequestModelImplToJson(
        _$PaginationRequestModelImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'searchQuery': instance.searchQuery,
      'type': instance.type,
      'docId': instance.docId,
      'hostelId': instance.hostelId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'page': instance.page,
      'filterRequest': instance.filterRequest,
      'sort': instance.sort,
    };

_$FilterRequestModelImpl _$$FilterRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FilterRequestModelImpl(
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hostelTypes: (json['hostelTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roomTypes: (json['roomTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bookingType: json['bookingType'] as String?,
      startPrice: (json['startPrice'] as num?)?.toDouble(),
      endPrice: (json['endPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FilterRequestModelImplToJson(
        _$FilterRequestModelImpl instance) =>
    <String, dynamic>{
      'locations': instance.locations,
      'hostelTypes': instance.hostelTypes,
      'roomTypes': instance.roomTypes,
      'bookingType': instance.bookingType,
      'startPrice': instance.startPrice,
      'endPrice': instance.endPrice,
    };

_$SendOtpRequestModelImpl _$$SendOtpRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendOtpRequestModelImpl(
      mobile: json['mobile'] as int?,
    );

Map<String, dynamic> _$$SendOtpRequestModelImplToJson(
        _$SendOtpRequestModelImpl instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
    };

_$VerifyOtpRequestModelImpl _$$VerifyOtpRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpRequestModelImpl(
      mobile: json['mobile'] as int?,
      otp: json['otp'] as int?,
      source: json['source'] as String?,
      version: json['version'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$VerifyOtpRequestModelImplToJson(
        _$VerifyOtpRequestModelImpl instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'otp': instance.otp,
      'source': instance.source,
      'version': instance.version,
      'deviceId': instance.deviceId,
    };

_$GoogleAuthRequestModelImpl _$$GoogleAuthRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GoogleAuthRequestModelImpl(
      email: json['email'] as String?,
      name: json['name'] as String?,
      source: json['source'] as String?,
      version: json['version'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$GoogleAuthRequestModelImplToJson(
        _$GoogleAuthRequestModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'source': instance.source,
      'version': instance.version,
      'deviceId': instance.deviceId,
    };

_$RegisterUserRequestModelImpl _$$RegisterUserRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterUserRequestModelImpl(
      registerByMobile: json['registerByMobile'] as bool?,
      image: json['image'] as String?,
      mobile: json['mobile'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] == null
          ? null
          : LocationModel.fromJson(json['address'] as Map<String, dynamic>),
      referralCode: json['referralCode'] as String?,
      kycDocuments: (json['kycDocuments'] as List<dynamic>?)
          ?.map((e) => DocumentDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RegisterUserRequestModelImplToJson(
        _$RegisterUserRequestModelImpl instance) =>
    <String, dynamic>{
      'registerByMobile': instance.registerByMobile,
      'image': instance.image,
      'mobile': instance.mobile,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob,
      'gender': instance.gender,
      'address': instance.address,
      'referralCode': instance.referralCode,
      'kycDocuments': instance.kycDocuments,
    };

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      landMark: json['landMark'] as String?,
      pinCode: json['pinCode'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'landMark': instance.landMark,
      'pinCode': instance.pinCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
