// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingRequestModelImpl _$$BookingRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingRequestModelImpl(
      roomModel: json['roomModel'] == null
          ? null
          : RoomModel.fromJson(json['roomModel'] as Map<String, dynamic>),
      hostelId: json['hostelId'] as String?,
      roomId: json['roomId'] as String?,
      couponId: json['couponId'] as String?,
      guestDetailsList: (json['guestDetailsList'] as List<dynamic>?)
          ?.map((e) => GuestDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkInDate: json['checkInDate'] == null
          ? null
          : DateTime.parse(json['checkInDate'] as String),
      checkOutDate: json['checkOutDate'] == null
          ? null
          : DateTime.parse(json['checkOutDate'] as String),
      guestCount: json['guestCount'] as int?,
      useWalletBalance: json['useWalletBalance'] as bool?,
    );

Map<String, dynamic> _$$BookingRequestModelImplToJson(
        _$BookingRequestModelImpl instance) =>
    <String, dynamic>{
      'roomModel': instance.roomModel,
      'hostelId': instance.hostelId,
      'roomId': instance.roomId,
      'couponId': instance.couponId,
      'guestDetailsList': instance.guestDetailsList,
      'checkInDate': instance.checkInDate?.toIso8601String(),
      'checkOutDate': instance.checkOutDate?.toIso8601String(),
      'guestCount': instance.guestCount,
      'useWalletBalance': instance.useWalletBalance,
    };

_$RatingReviewRequestModelImpl _$$RatingReviewRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RatingReviewRequestModelImpl(
      hostelId: json['hostelId'] as String?,
      review: json['review'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RatingReviewRequestModelImplToJson(
        _$RatingReviewRequestModelImpl instance) =>
    <String, dynamic>{
      'hostelId': instance.hostelId,
      'review': instance.review,
      'rating': instance.rating,
    };
