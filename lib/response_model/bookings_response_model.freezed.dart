// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookings_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HostelRoomAvailabilityResponseModel
    _$HostelRoomAvailabilityResponseModelFromJson(Map<String, dynamic> json) {
  return _HostelRoomAvailabilityResponseModel.fromJson(json);
}

/// @nodoc
mixin _$HostelRoomAvailabilityResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  HostelRoomBookingDataModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostelRoomAvailabilityResponseModelCopyWith<
          HostelRoomAvailabilityResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostelRoomAvailabilityResponseModelCopyWith<$Res> {
  factory $HostelRoomAvailabilityResponseModelCopyWith(
          HostelRoomAvailabilityResponseModel value,
          $Res Function(HostelRoomAvailabilityResponseModel) then) =
      _$HostelRoomAvailabilityResponseModelCopyWithImpl<$Res,
          HostelRoomAvailabilityResponseModel>;
  @useResult
  $Res call({int? status, String? message, HostelRoomBookingDataModel? data});

  $HostelRoomBookingDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$HostelRoomAvailabilityResponseModelCopyWithImpl<$Res,
        $Val extends HostelRoomAvailabilityResponseModel>
    implements $HostelRoomAvailabilityResponseModelCopyWith<$Res> {
  _$HostelRoomAvailabilityResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HostelRoomBookingDataModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HostelRoomBookingDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $HostelRoomBookingDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HostelRoomAvailabilityResponseModelImplCopyWith<$Res>
    implements $HostelRoomAvailabilityResponseModelCopyWith<$Res> {
  factory _$$HostelRoomAvailabilityResponseModelImplCopyWith(
          _$HostelRoomAvailabilityResponseModelImpl value,
          $Res Function(_$HostelRoomAvailabilityResponseModelImpl) then) =
      __$$HostelRoomAvailabilityResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, HostelRoomBookingDataModel? data});

  @override
  $HostelRoomBookingDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$HostelRoomAvailabilityResponseModelImplCopyWithImpl<$Res>
    extends _$HostelRoomAvailabilityResponseModelCopyWithImpl<$Res,
        _$HostelRoomAvailabilityResponseModelImpl>
    implements _$$HostelRoomAvailabilityResponseModelImplCopyWith<$Res> {
  __$$HostelRoomAvailabilityResponseModelImplCopyWithImpl(
      _$HostelRoomAvailabilityResponseModelImpl _value,
      $Res Function(_$HostelRoomAvailabilityResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$HostelRoomAvailabilityResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HostelRoomBookingDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HostelRoomAvailabilityResponseModelImpl
    implements _HostelRoomAvailabilityResponseModel {
  const _$HostelRoomAvailabilityResponseModelImpl(
      {this.status, this.message, this.data});

  factory _$HostelRoomAvailabilityResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HostelRoomAvailabilityResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final HostelRoomBookingDataModel? data;

  @override
  String toString() {
    return 'HostelRoomAvailabilityResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostelRoomAvailabilityResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HostelRoomAvailabilityResponseModelImplCopyWith<
          _$HostelRoomAvailabilityResponseModelImpl>
      get copyWith => __$$HostelRoomAvailabilityResponseModelImplCopyWithImpl<
          _$HostelRoomAvailabilityResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostelRoomAvailabilityResponseModelImplToJson(
      this,
    );
  }
}

abstract class _HostelRoomAvailabilityResponseModel
    implements HostelRoomAvailabilityResponseModel {
  const factory _HostelRoomAvailabilityResponseModel(
          {final int? status,
          final String? message,
          final HostelRoomBookingDataModel? data}) =
      _$HostelRoomAvailabilityResponseModelImpl;

  factory _HostelRoomAvailabilityResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$HostelRoomAvailabilityResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  HostelRoomBookingDataModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$HostelRoomAvailabilityResponseModelImplCopyWith<
          _$HostelRoomAvailabilityResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ConfirmBookingResponseModel _$ConfirmBookingResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ConfirmBookingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ConfirmBookingResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  HostelRoomBookingDataModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfirmBookingResponseModelCopyWith<ConfirmBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmBookingResponseModelCopyWith<$Res> {
  factory $ConfirmBookingResponseModelCopyWith(
          ConfirmBookingResponseModel value,
          $Res Function(ConfirmBookingResponseModel) then) =
      _$ConfirmBookingResponseModelCopyWithImpl<$Res,
          ConfirmBookingResponseModel>;
  @useResult
  $Res call({int? status, String? message, HostelRoomBookingDataModel? data});

  $HostelRoomBookingDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ConfirmBookingResponseModelCopyWithImpl<$Res,
        $Val extends ConfirmBookingResponseModel>
    implements $ConfirmBookingResponseModelCopyWith<$Res> {
  _$ConfirmBookingResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HostelRoomBookingDataModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HostelRoomBookingDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $HostelRoomBookingDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfirmBookingResponseModelImplCopyWith<$Res>
    implements $ConfirmBookingResponseModelCopyWith<$Res> {
  factory _$$ConfirmBookingResponseModelImplCopyWith(
          _$ConfirmBookingResponseModelImpl value,
          $Res Function(_$ConfirmBookingResponseModelImpl) then) =
      __$$ConfirmBookingResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, HostelRoomBookingDataModel? data});

  @override
  $HostelRoomBookingDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ConfirmBookingResponseModelImplCopyWithImpl<$Res>
    extends _$ConfirmBookingResponseModelCopyWithImpl<$Res,
        _$ConfirmBookingResponseModelImpl>
    implements _$$ConfirmBookingResponseModelImplCopyWith<$Res> {
  __$$ConfirmBookingResponseModelImplCopyWithImpl(
      _$ConfirmBookingResponseModelImpl _value,
      $Res Function(_$ConfirmBookingResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ConfirmBookingResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HostelRoomBookingDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmBookingResponseModelImpl
    implements _ConfirmBookingResponseModel {
  const _$ConfirmBookingResponseModelImpl(
      {this.status, this.message, this.data});

  factory _$ConfirmBookingResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfirmBookingResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final HostelRoomBookingDataModel? data;

  @override
  String toString() {
    return 'ConfirmBookingResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmBookingResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmBookingResponseModelImplCopyWith<_$ConfirmBookingResponseModelImpl>
      get copyWith => __$$ConfirmBookingResponseModelImplCopyWithImpl<
          _$ConfirmBookingResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmBookingResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConfirmBookingResponseModel
    implements ConfirmBookingResponseModel {
  const factory _ConfirmBookingResponseModel(
          {final int? status,
          final String? message,
          final HostelRoomBookingDataModel? data}) =
      _$ConfirmBookingResponseModelImpl;

  factory _ConfirmBookingResponseModel.fromJson(Map<String, dynamic> json) =
      _$ConfirmBookingResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  HostelRoomBookingDataModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmBookingResponseModelImplCopyWith<_$ConfirmBookingResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HostelRoomBookingDataModel _$HostelRoomBookingDataModelFromJson(
    Map<String, dynamic> json) {
  return _HostelRoomBookingDataModel.fromJson(json);
}

/// @nodoc
mixin _$HostelRoomBookingDataModel {
  int? get amount => throw _privateConstructorUsedError;
  List<AmountDetailsModel>? get paymentDetailLogs =>
      throw _privateConstructorUsedError;
  BookingModel? get bookingResponse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostelRoomBookingDataModelCopyWith<HostelRoomBookingDataModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostelRoomBookingDataModelCopyWith<$Res> {
  factory $HostelRoomBookingDataModelCopyWith(HostelRoomBookingDataModel value,
          $Res Function(HostelRoomBookingDataModel) then) =
      _$HostelRoomBookingDataModelCopyWithImpl<$Res,
          HostelRoomBookingDataModel>;
  @useResult
  $Res call(
      {int? amount,
      List<AmountDetailsModel>? paymentDetailLogs,
      BookingModel? bookingResponse});

  $BookingModelCopyWith<$Res>? get bookingResponse;
}

/// @nodoc
class _$HostelRoomBookingDataModelCopyWithImpl<$Res,
        $Val extends HostelRoomBookingDataModel>
    implements $HostelRoomBookingDataModelCopyWith<$Res> {
  _$HostelRoomBookingDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? paymentDetailLogs = freezed,
    Object? bookingResponse = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentDetailLogs: freezed == paymentDetailLogs
          ? _value.paymentDetailLogs
          : paymentDetailLogs // ignore: cast_nullable_to_non_nullable
              as List<AmountDetailsModel>?,
      bookingResponse: freezed == bookingResponse
          ? _value.bookingResponse
          : bookingResponse // ignore: cast_nullable_to_non_nullable
              as BookingModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookingModelCopyWith<$Res>? get bookingResponse {
    if (_value.bookingResponse == null) {
      return null;
    }

    return $BookingModelCopyWith<$Res>(_value.bookingResponse!, (value) {
      return _then(_value.copyWith(bookingResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HostelRoomBookingDataModelImplCopyWith<$Res>
    implements $HostelRoomBookingDataModelCopyWith<$Res> {
  factory _$$HostelRoomBookingDataModelImplCopyWith(
          _$HostelRoomBookingDataModelImpl value,
          $Res Function(_$HostelRoomBookingDataModelImpl) then) =
      __$$HostelRoomBookingDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
      List<AmountDetailsModel>? paymentDetailLogs,
      BookingModel? bookingResponse});

  @override
  $BookingModelCopyWith<$Res>? get bookingResponse;
}

/// @nodoc
class __$$HostelRoomBookingDataModelImplCopyWithImpl<$Res>
    extends _$HostelRoomBookingDataModelCopyWithImpl<$Res,
        _$HostelRoomBookingDataModelImpl>
    implements _$$HostelRoomBookingDataModelImplCopyWith<$Res> {
  __$$HostelRoomBookingDataModelImplCopyWithImpl(
      _$HostelRoomBookingDataModelImpl _value,
      $Res Function(_$HostelRoomBookingDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? paymentDetailLogs = freezed,
    Object? bookingResponse = freezed,
  }) {
    return _then(_$HostelRoomBookingDataModelImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentDetailLogs: freezed == paymentDetailLogs
          ? _value._paymentDetailLogs
          : paymentDetailLogs // ignore: cast_nullable_to_non_nullable
              as List<AmountDetailsModel>?,
      bookingResponse: freezed == bookingResponse
          ? _value.bookingResponse
          : bookingResponse // ignore: cast_nullable_to_non_nullable
              as BookingModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HostelRoomBookingDataModelImpl implements _HostelRoomBookingDataModel {
  const _$HostelRoomBookingDataModelImpl(
      {this.amount,
      final List<AmountDetailsModel>? paymentDetailLogs,
      this.bookingResponse})
      : _paymentDetailLogs = paymentDetailLogs;

  factory _$HostelRoomBookingDataModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HostelRoomBookingDataModelImplFromJson(json);

  @override
  final int? amount;
  final List<AmountDetailsModel>? _paymentDetailLogs;
  @override
  List<AmountDetailsModel>? get paymentDetailLogs {
    final value = _paymentDetailLogs;
    if (value == null) return null;
    if (_paymentDetailLogs is EqualUnmodifiableListView)
      return _paymentDetailLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final BookingModel? bookingResponse;

  @override
  String toString() {
    return 'HostelRoomBookingDataModel(amount: $amount, paymentDetailLogs: $paymentDetailLogs, bookingResponse: $bookingResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostelRoomBookingDataModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other._paymentDetailLogs, _paymentDetailLogs) &&
            (identical(other.bookingResponse, bookingResponse) ||
                other.bookingResponse == bookingResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount,
      const DeepCollectionEquality().hash(_paymentDetailLogs), bookingResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HostelRoomBookingDataModelImplCopyWith<_$HostelRoomBookingDataModelImpl>
      get copyWith => __$$HostelRoomBookingDataModelImplCopyWithImpl<
          _$HostelRoomBookingDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostelRoomBookingDataModelImplToJson(
      this,
    );
  }
}

abstract class _HostelRoomBookingDataModel
    implements HostelRoomBookingDataModel {
  const factory _HostelRoomBookingDataModel(
      {final int? amount,
      final List<AmountDetailsModel>? paymentDetailLogs,
      final BookingModel? bookingResponse}) = _$HostelRoomBookingDataModelImpl;

  factory _HostelRoomBookingDataModel.fromJson(Map<String, dynamic> json) =
      _$HostelRoomBookingDataModelImpl.fromJson;

  @override
  int? get amount;
  @override
  List<AmountDetailsModel>? get paymentDetailLogs;
  @override
  BookingModel? get bookingResponse;
  @override
  @JsonKey(ignore: true)
  _$$HostelRoomBookingDataModelImplCopyWith<_$HostelRoomBookingDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AmountDetailsModel _$AmountDetailsModelFromJson(Map<String, dynamic> json) {
  return _AmountDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$AmountDetailsModel {
  String? get message => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmountDetailsModelCopyWith<AmountDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountDetailsModelCopyWith<$Res> {
  factory $AmountDetailsModelCopyWith(
          AmountDetailsModel value, $Res Function(AmountDetailsModel) then) =
      _$AmountDetailsModelCopyWithImpl<$Res, AmountDetailsModel>;
  @useResult
  $Res call({String? message, String? amount});
}

/// @nodoc
class _$AmountDetailsModelCopyWithImpl<$Res, $Val extends AmountDetailsModel>
    implements $AmountDetailsModelCopyWith<$Res> {
  _$AmountDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmountDetailsModelImplCopyWith<$Res>
    implements $AmountDetailsModelCopyWith<$Res> {
  factory _$$AmountDetailsModelImplCopyWith(_$AmountDetailsModelImpl value,
          $Res Function(_$AmountDetailsModelImpl) then) =
      __$$AmountDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? amount});
}

/// @nodoc
class __$$AmountDetailsModelImplCopyWithImpl<$Res>
    extends _$AmountDetailsModelCopyWithImpl<$Res, _$AmountDetailsModelImpl>
    implements _$$AmountDetailsModelImplCopyWith<$Res> {
  __$$AmountDetailsModelImplCopyWithImpl(_$AmountDetailsModelImpl _value,
      $Res Function(_$AmountDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$AmountDetailsModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmountDetailsModelImpl implements _AmountDetailsModel {
  const _$AmountDetailsModelImpl({this.message, this.amount});

  factory _$AmountDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmountDetailsModelImplFromJson(json);

  @override
  final String? message;
  @override
  final String? amount;

  @override
  String toString() {
    return 'AmountDetailsModel(message: $message, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountDetailsModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountDetailsModelImplCopyWith<_$AmountDetailsModelImpl> get copyWith =>
      __$$AmountDetailsModelImplCopyWithImpl<_$AmountDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AmountDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _AmountDetailsModel implements AmountDetailsModel {
  const factory _AmountDetailsModel(
      {final String? message, final String? amount}) = _$AmountDetailsModelImpl;

  factory _AmountDetailsModel.fromJson(Map<String, dynamic> json) =
      _$AmountDetailsModelImpl.fromJson;

  @override
  String? get message;
  @override
  String? get amount;
  @override
  @JsonKey(ignore: true)
  _$$AmountDetailsModelImplCopyWith<_$AmountDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get dealerId => throw _privateConstructorUsedError;
  dynamic get hostelId => throw _privateConstructorUsedError;
  dynamic get roomId => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String? get paymentStatus => throw _privateConstructorUsedError;
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  DateTime? get checkOutDate => throw _privateConstructorUsedError;
  int? get guestCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {dynamic userId,
      dynamic dealerId,
      dynamic hostelId,
      dynamic roomId,
      String? orderId,
      String? paymentId,
      String? paymentStatus,
      DateTime? checkInDate,
      DateTime? checkOutDate,
      int? guestCount});
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? dealerId = freezed,
    Object? hostelId = freezed,
    Object? roomId = freezed,
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? paymentStatus = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? guestCount = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dealerId: freezed == dealerId
          ? _value.dealerId
          : dealerId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestCount: freezed == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
          _$BookingModelImpl value, $Res Function(_$BookingModelImpl) then) =
      __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic userId,
      dynamic dealerId,
      dynamic hostelId,
      dynamic roomId,
      String? orderId,
      String? paymentId,
      String? paymentStatus,
      DateTime? checkInDate,
      DateTime? checkOutDate,
      int? guestCount});
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
      _$BookingModelImpl _value, $Res Function(_$BookingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? dealerId = freezed,
    Object? hostelId = freezed,
    Object? roomId = freezed,
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? paymentStatus = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? guestCount = freezed,
  }) {
    return _then(_$BookingModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dealerId: freezed == dealerId
          ? _value.dealerId
          : dealerId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestCount: freezed == guestCount
          ? _value.guestCount
          : guestCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingModelImpl implements _BookingModel {
  const _$BookingModelImpl(
      {this.userId,
      this.dealerId,
      this.hostelId,
      this.roomId,
      this.orderId,
      this.paymentId,
      this.paymentStatus,
      this.checkInDate,
      this.checkOutDate,
      this.guestCount});

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic dealerId;
  @override
  final dynamic hostelId;
  @override
  final dynamic roomId;
  @override
  final String? orderId;
  @override
  final String? paymentId;
  @override
  final String? paymentStatus;
  @override
  final DateTime? checkInDate;
  @override
  final DateTime? checkOutDate;
  @override
  final int? guestCount;

  @override
  String toString() {
    return 'BookingModel(userId: $userId, dealerId: $dealerId, hostelId: $hostelId, roomId: $roomId, orderId: $orderId, paymentId: $paymentId, paymentStatus: $paymentStatus, checkInDate: $checkInDate, checkOutDate: $checkOutDate, guestCount: $guestCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.dealerId, dealerId) &&
            const DeepCollectionEquality().equals(other.hostelId, hostelId) &&
            const DeepCollectionEquality().equals(other.roomId, roomId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.guestCount, guestCount) ||
                other.guestCount == guestCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(dealerId),
      const DeepCollectionEquality().hash(hostelId),
      const DeepCollectionEquality().hash(roomId),
      orderId,
      paymentId,
      paymentStatus,
      checkInDate,
      checkOutDate,
      guestCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(
      this,
    );
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel(
      {final dynamic userId,
      final dynamic dealerId,
      final dynamic hostelId,
      final dynamic roomId,
      final String? orderId,
      final String? paymentId,
      final String? paymentStatus,
      final DateTime? checkInDate,
      final DateTime? checkOutDate,
      final int? guestCount}) = _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get dealerId;
  @override
  dynamic get hostelId;
  @override
  dynamic get roomId;
  @override
  String? get orderId;
  @override
  String? get paymentId;
  @override
  String? get paymentStatus;
  @override
  DateTime? get checkInDate;
  @override
  DateTime? get checkOutDate;
  @override
  int? get guestCount;
  @override
  @JsonKey(ignore: true)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
