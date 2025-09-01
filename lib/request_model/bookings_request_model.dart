import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';

import '../response_model/address_response_model.dart';
import '../response_model/hostel_response_model.dart';

part 'bookings_request_model.freezed.dart';
part 'bookings_request_model.g.dart';


@Freezed()
class BookingRequestModel with _$BookingRequestModel{
  const factory BookingRequestModel({
    required RoomModel? roomModel,
    required String? hostelId,
    required String? roomId,
    required String? couponId,
    required List<GuestDetailsModel>? guestDetailsList,
    required DateTime? checkInDate,
    required DateTime? checkOutDate,
    required int? guestCount
  }) = _BookingRequestModel;

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) => _$BookingRequestModelFromJson(json);
}


@Freezed()
class RatingReviewRequestModel with _$RatingReviewRequestModel{
  const factory RatingReviewRequestModel({
    required String? hostelId,
    required String? review,
    required double? rating
  }) = _RatingReviewRequestModel;

  factory RatingReviewRequestModel.fromJson(Map<String, dynamic> json) => _$RatingReviewRequestModelFromJson(json);
}

