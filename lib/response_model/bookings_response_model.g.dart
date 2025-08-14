// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostelRoomAvailabilityResponseModelImpl
    _$$HostelRoomAvailabilityResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$HostelRoomAvailabilityResponseModelImpl(
          status: json['status'] as int?,
          message: json['message'] as String?,
          data: json['data'] == null
              ? null
              : HostelRoomBookingDataModel.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$HostelRoomAvailabilityResponseModelImplToJson(
        _$HostelRoomAvailabilityResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$ConfirmBookingResponseModelImpl _$$ConfirmBookingResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfirmBookingResponseModelImpl(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : HostelRoomBookingDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConfirmBookingResponseModelImplToJson(
        _$ConfirmBookingResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$HostelRoomBookingDataModelImpl _$$HostelRoomBookingDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HostelRoomBookingDataModelImpl(
      amount: json['amount'] as int?,
      paymentDetailLogs: (json['paymentDetailLogs'] as List<dynamic>?)
          ?.map((e) => AmountDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingResponse: json['bookingResponse'] == null
          ? null
          : BookingModel.fromJson(
              json['bookingResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HostelRoomBookingDataModelImplToJson(
        _$HostelRoomBookingDataModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'paymentDetailLogs': instance.paymentDetailLogs,
      'bookingResponse': instance.bookingResponse,
    };

_$AmountDetailsModelImpl _$$AmountDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AmountDetailsModelImpl(
      message: json['message'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$$AmountDetailsModelImplToJson(
        _$AmountDetailsModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'amount': instance.amount,
    };

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      userId: json['userId'],
      dealerId: json['dealerId'],
      hostelId: json['hostelId'],
      roomId: json['roomId'],
      orderId: json['orderId'] as String?,
      paymentId: json['paymentId'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      checkInDate: json['checkInDate'] == null
          ? null
          : DateTime.parse(json['checkInDate'] as String),
      checkOutDate: json['checkOutDate'] == null
          ? null
          : DateTime.parse(json['checkOutDate'] as String),
      guestCount: json['guestCount'] as int?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'dealerId': instance.dealerId,
      'hostelId': instance.hostelId,
      'roomId': instance.roomId,
      'orderId': instance.orderId,
      'paymentId': instance.paymentId,
      'paymentStatus': instance.paymentStatus,
      'checkInDate': instance.checkInDate?.toIso8601String(),
      'checkOutDate': instance.checkOutDate?.toIso8601String(),
      'guestCount': instance.guestCount,
    };
