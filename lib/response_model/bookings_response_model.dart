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
class GuestDetailsModel with _$GuestDetailsModel{
  const factory GuestDetailsModel({
    String? name,
    int? mobile,
    String? aadharImage,
    String? aadharNumber,
    String? gender,
    String? dob
  }) = _GuestDetailsModel;

  factory GuestDetailsModel.fromJson(Map<String, dynamic> json) => _$GuestDetailsModelFromJson(json);
}


@Freezed()
class HostelRoomBookingDataModel with _$HostelRoomBookingDataModel {
  const factory HostelRoomBookingDataModel({
    int? amount,
    int? discount,
    List<AmountDetailsModel>? paymentDetailLogs,
    List<BookingModel>? onGoingBookings,
    BookingModel? bookingResponse,
    TransactionDataModel? transactionResponse
  }) = _HostelRoomBookingDataModel;

  factory HostelRoomBookingDataModel.fromJson(Map<String, dynamic> json) => _$HostelRoomBookingDataModelFromJson(json);
}


@Freezed()
class FetchTransactionsResponseModel with _$FetchTransactionsResponseModel {
  const factory FetchTransactionsResponseModel({
    int? status,
    String? message,
    List<TransactionDataModel>? data
  }) = _FetchTransactionsResponseModel;

  factory FetchTransactionsResponseModel.fromJson(Map<String, dynamic> json) => _$FetchTransactionsResponseModelFromJson(json);
}

@Freezed()
class TransactionDataModel with _$TransactionDataModel {
  const factory TransactionDataModel({
    @JsonKey(name:'_id') String? id,
    String? userTitle,
    String? transactionType,
    String? paymentStatus,
    dynamic userId,
    dynamic dealerId,
    dynamic bookingId,
    String? orderId,
    String? paymentId,
    int? amount,
    List<AmountDetailsModel>? logs,
    DateTime? createdAt
  }) = _TransactionDataModel;

  factory TransactionDataModel.fromJson(Map<String, dynamic> json) => _$TransactionDataModelFromJson(json);
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
class FetchBookingsResponseModel with _$FetchBookingsResponseModel{
  const factory FetchBookingsResponseModel({
    int? status,
    String? message,
    List<BookingModel>? data
  }) = _FetchBookingsResponseModel;

  factory FetchBookingsResponseModel.fromJson(Map<String, dynamic> json) => _$FetchBookingsResponseModelFromJson(json);
}

@Freezed()
class FetchBookingDetailsResponseModel with _$FetchBookingDetailsResponseModel{
  const factory FetchBookingDetailsResponseModel({
    int? status,
    String? message,
    BookingModel? data
  }) = _FetchBookingDetailsResponseModel;

  factory FetchBookingDetailsResponseModel.fromJson(Map<String, dynamic> json) => _$FetchBookingDetailsResponseModelFromJson(json);
}

@Freezed()
class BookingModel with _$BookingModel {
  const factory BookingModel({
    @JsonKey(name:'_id') String? id,
    dynamic userId,
    dynamic dealerId,
    dynamic hostelId,
    dynamic roomId,
    String? orderId,
    String? paymentId,
    String? paymentStatus,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? guestCount,
    int? total,
    int? discount,
    List<GuestDetailsModel>? guestDetailsList,
    List<AmountDetailsModel>? logs,
    String? bookingStatus,
    DateTime? createdAt
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}


@Freezed()
class FetchCouponsResponseModel with _$FetchCouponsResponseModel{
  const factory FetchCouponsResponseModel({
    int? status,
    String? message,
    List<CouponDataModel>? data
  }) = _FetchCouponsResponseModel;

  factory FetchCouponsResponseModel.fromJson(Map<String, dynamic> json) => _$FetchCouponsResponseModelFromJson(json);
}

@Freezed()
class CouponDataModel with _$CouponDataModel{
  const factory CouponDataModel({
    @JsonKey(name:'_id') String? id,
    String? createdBy,
    DateTime? expiryDate,
    String? code,
    int? orderValue,
    int? discount
  }) = _CouponDataModel;

  factory CouponDataModel.fromJson(Map<String, dynamic> json) => _$CouponDataModelFromJson(json);
}



