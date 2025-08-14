import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';

part 'bookings_response_model.freezed.dart';
part 'bookings_response_model.g.dart';


@Freezed()
class HostelRoomAvailabilityResponseModel with _$HostelRoomAvailabilityResponseModel {
  const factory HostelRoomAvailabilityResponseModel({
    int? status,
    String? message,
    HostelRoomBookingDataModel? data
  }) = _HostelRoomAvailabilityResponseModel;

  factory HostelRoomAvailabilityResponseModel.fromJson(Map<String, dynamic> json) => _$HostelRoomAvailabilityResponseModelFromJson(json);
}

@Freezed()
class ConfirmBookingResponseModel with _$ConfirmBookingResponseModel{
  const factory ConfirmBookingResponseModel({
    int? status,
    String? message,
    HostelRoomBookingDataModel? data
  }) = _ConfirmBookingResponseModel;

  factory ConfirmBookingResponseModel.fromJson(Map<String, dynamic> json) => _$ConfirmBookingResponseModelFromJson(json);
}



@Freezed()
class HostelRoomBookingDataModel with _$HostelRoomBookingDataModel {
  const factory HostelRoomBookingDataModel({
    int? amount,
    List<AmountDetailsModel>? paymentDetailLogs,
    BookingModel? bookingResponse
  }) = _HostelRoomBookingDataModel;

  factory HostelRoomBookingDataModel.fromJson(Map<String, dynamic> json) => _$HostelRoomBookingDataModelFromJson(json);
}

@Freezed()
class AmountDetailsModel with _$AmountDetailsModel {
  const factory AmountDetailsModel({
    String? message,
    String? amount,
  }) = _AmountDetailsModel;

  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) => _$AmountDetailsModelFromJson(json);
}

@Freezed()
class BookingModel with _$BookingModel {
  const factory BookingModel({
    dynamic userId,
    dynamic dealerId,
    dynamic hostelId,
    dynamic roomId,
    String? orderId,
    String? paymentId,
    String? paymentStatus,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? guestCount
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}



