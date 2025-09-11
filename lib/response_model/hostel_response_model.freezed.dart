// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hostel_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchHostelsResponseModel _$FetchHostelsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FetchHostelsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FetchHostelsResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<HostelModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchHostelsResponseModelCopyWith<FetchHostelsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchHostelsResponseModelCopyWith<$Res> {
  factory $FetchHostelsResponseModelCopyWith(FetchHostelsResponseModel value,
          $Res Function(FetchHostelsResponseModel) then) =
      _$FetchHostelsResponseModelCopyWithImpl<$Res, FetchHostelsResponseModel>;
  @useResult
  $Res call({int? status, String? message, List<HostelModel>? data});
}

/// @nodoc
class _$FetchHostelsResponseModelCopyWithImpl<$Res,
        $Val extends FetchHostelsResponseModel>
    implements $FetchHostelsResponseModelCopyWith<$Res> {
  _$FetchHostelsResponseModelCopyWithImpl(this._value, this._then);

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
              as List<HostelModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchHostelsResponseModelImplCopyWith<$Res>
    implements $FetchHostelsResponseModelCopyWith<$Res> {
  factory _$$FetchHostelsResponseModelImplCopyWith(
          _$FetchHostelsResponseModelImpl value,
          $Res Function(_$FetchHostelsResponseModelImpl) then) =
      __$$FetchHostelsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, List<HostelModel>? data});
}

/// @nodoc
class __$$FetchHostelsResponseModelImplCopyWithImpl<$Res>
    extends _$FetchHostelsResponseModelCopyWithImpl<$Res,
        _$FetchHostelsResponseModelImpl>
    implements _$$FetchHostelsResponseModelImplCopyWith<$Res> {
  __$$FetchHostelsResponseModelImplCopyWithImpl(
      _$FetchHostelsResponseModelImpl _value,
      $Res Function(_$FetchHostelsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FetchHostelsResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HostelModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchHostelsResponseModelImpl implements _FetchHostelsResponseModel {
  const _$FetchHostelsResponseModelImpl(
      {this.status, this.message, final List<HostelModel>? data})
      : _data = data;

  factory _$FetchHostelsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FetchHostelsResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  final List<HostelModel>? _data;
  @override
  List<HostelModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FetchHostelsResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchHostelsResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchHostelsResponseModelImplCopyWith<_$FetchHostelsResponseModelImpl>
      get copyWith => __$$FetchHostelsResponseModelImplCopyWithImpl<
          _$FetchHostelsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchHostelsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FetchHostelsResponseModel implements FetchHostelsResponseModel {
  const factory _FetchHostelsResponseModel(
      {final int? status,
      final String? message,
      final List<HostelModel>? data}) = _$FetchHostelsResponseModelImpl;

  factory _FetchHostelsResponseModel.fromJson(Map<String, dynamic> json) =
      _$FetchHostelsResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  List<HostelModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FetchHostelsResponseModelImplCopyWith<_$FetchHostelsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FetchHostelDetailsResponseModel _$FetchHostelDetailsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FetchHostelDetailsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FetchHostelDetailsResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  HostelModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchHostelDetailsResponseModelCopyWith<FetchHostelDetailsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchHostelDetailsResponseModelCopyWith<$Res> {
  factory $FetchHostelDetailsResponseModelCopyWith(
          FetchHostelDetailsResponseModel value,
          $Res Function(FetchHostelDetailsResponseModel) then) =
      _$FetchHostelDetailsResponseModelCopyWithImpl<$Res,
          FetchHostelDetailsResponseModel>;
  @useResult
  $Res call({int? status, String? message, HostelModel? data});

  $HostelModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$FetchHostelDetailsResponseModelCopyWithImpl<$Res,
        $Val extends FetchHostelDetailsResponseModel>
    implements $FetchHostelDetailsResponseModelCopyWith<$Res> {
  _$FetchHostelDetailsResponseModelCopyWithImpl(this._value, this._then);

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
              as HostelModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HostelModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $HostelModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FetchHostelDetailsResponseModelImplCopyWith<$Res>
    implements $FetchHostelDetailsResponseModelCopyWith<$Res> {
  factory _$$FetchHostelDetailsResponseModelImplCopyWith(
          _$FetchHostelDetailsResponseModelImpl value,
          $Res Function(_$FetchHostelDetailsResponseModelImpl) then) =
      __$$FetchHostelDetailsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, HostelModel? data});

  @override
  $HostelModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$FetchHostelDetailsResponseModelImplCopyWithImpl<$Res>
    extends _$FetchHostelDetailsResponseModelCopyWithImpl<$Res,
        _$FetchHostelDetailsResponseModelImpl>
    implements _$$FetchHostelDetailsResponseModelImplCopyWith<$Res> {
  __$$FetchHostelDetailsResponseModelImplCopyWithImpl(
      _$FetchHostelDetailsResponseModelImpl _value,
      $Res Function(_$FetchHostelDetailsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FetchHostelDetailsResponseModelImpl(
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
              as HostelModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchHostelDetailsResponseModelImpl
    implements _FetchHostelDetailsResponseModel {
  const _$FetchHostelDetailsResponseModelImpl(
      {this.status, this.message, this.data});

  factory _$FetchHostelDetailsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FetchHostelDetailsResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final HostelModel? data;

  @override
  String toString() {
    return 'FetchHostelDetailsResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchHostelDetailsResponseModelImpl &&
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
  _$$FetchHostelDetailsResponseModelImplCopyWith<
          _$FetchHostelDetailsResponseModelImpl>
      get copyWith => __$$FetchHostelDetailsResponseModelImplCopyWithImpl<
          _$FetchHostelDetailsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchHostelDetailsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FetchHostelDetailsResponseModel
    implements FetchHostelDetailsResponseModel {
  const factory _FetchHostelDetailsResponseModel(
      {final int? status,
      final String? message,
      final HostelModel? data}) = _$FetchHostelDetailsResponseModelImpl;

  factory _FetchHostelDetailsResponseModel.fromJson(Map<String, dynamic> json) =
      _$FetchHostelDetailsResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  HostelModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$FetchHostelDetailsResponseModelImplCopyWith<
          _$FetchHostelDetailsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HostelModel _$HostelModelFromJson(Map<String, dynamic> json) {
  return _HostelModel.fromJson(json);
}

/// @nodoc
mixin _$HostelModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get approvalStatus => throw _privateConstructorUsedError;
  List<String>? get rejectedFields => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get hostelImage => throw _privateConstructorUsedError;
  String? get hostelLicence => throw _privateConstructorUsedError;
  String? get hostelName => throw _privateConstructorUsedError;
  String? get aboutHostel => throw _privateConstructorUsedError;
  String? get gstIn => throw _privateConstructorUsedError;
  String? get hostelType => throw _privateConstructorUsedError;
  List<AmenitiesModel>? get amenities => throw _privateConstructorUsedError;
  int? get amenitiesMore => throw _privateConstructorUsedError;
  RoomModel? get room => throw _privateConstructorUsedError;
  List<RoomModel>? get rooms => throw _privateConstructorUsedError;
  int? get roomsMore => throw _privateConstructorUsedError;
  List<String>? get rules => throw _privateConstructorUsedError;
  List<ImageDataModel>? get images => throw _privateConstructorUsedError;
  LocationModel? get location => throw _privateConstructorUsedError;
  int? get monthlyIncome => throw _privateConstructorUsedError;
  int? get totalIncome => throw _privateConstructorUsedError;
  int? get totalVotes => throw _privateConstructorUsedError;
  dynamic get rating => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostelModelCopyWith<HostelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostelModelCopyWith<$Res> {
  factory $HostelModelCopyWith(
          HostelModel value, $Res Function(HostelModel) then) =
      _$HostelModelCopyWithImpl<$Res, HostelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? approvalStatus,
      List<String>? rejectedFields,
      String? reason,
      String? hostelImage,
      String? hostelLicence,
      String? hostelName,
      String? aboutHostel,
      String? gstIn,
      String? hostelType,
      List<AmenitiesModel>? amenities,
      int? amenitiesMore,
      RoomModel? room,
      List<RoomModel>? rooms,
      int? roomsMore,
      List<String>? rules,
      List<ImageDataModel>? images,
      LocationModel? location,
      int? monthlyIncome,
      int? totalIncome,
      int? totalVotes,
      dynamic rating,
      bool? isFavorite});

  $RoomModelCopyWith<$Res>? get room;
  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$HostelModelCopyWithImpl<$Res, $Val extends HostelModel>
    implements $HostelModelCopyWith<$Res> {
  _$HostelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? approvalStatus = freezed,
    Object? rejectedFields = freezed,
    Object? reason = freezed,
    Object? hostelImage = freezed,
    Object? hostelLicence = freezed,
    Object? hostelName = freezed,
    Object? aboutHostel = freezed,
    Object? gstIn = freezed,
    Object? hostelType = freezed,
    Object? amenities = freezed,
    Object? amenitiesMore = freezed,
    Object? room = freezed,
    Object? rooms = freezed,
    Object? roomsMore = freezed,
    Object? rules = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? monthlyIncome = freezed,
    Object? totalIncome = freezed,
    Object? totalVotes = freezed,
    Object? rating = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalStatus: freezed == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectedFields: freezed == rejectedFields
          ? _value.rejectedFields
          : rejectedFields // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelImage: freezed == hostelImage
          ? _value.hostelImage
          : hostelImage // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelLicence: freezed == hostelLicence
          ? _value.hostelLicence
          : hostelLicence // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelName: freezed == hostelName
          ? _value.hostelName
          : hostelName // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutHostel: freezed == aboutHostel
          ? _value.aboutHostel
          : aboutHostel // ignore: cast_nullable_to_non_nullable
              as String?,
      gstIn: freezed == gstIn
          ? _value.gstIn
          : gstIn // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelType: freezed == hostelType
          ? _value.hostelType
          : hostelType // ignore: cast_nullable_to_non_nullable
              as String?,
      amenities: freezed == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<AmenitiesModel>?,
      amenitiesMore: freezed == amenitiesMore
          ? _value.amenitiesMore
          : amenitiesMore // ignore: cast_nullable_to_non_nullable
              as int?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomModel?,
      rooms: freezed == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
      roomsMore: freezed == roomsMore
          ? _value.roomsMore
          : roomsMore // ignore: cast_nullable_to_non_nullable
              as int?,
      rules: freezed == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDataModel>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      monthlyIncome: freezed == monthlyIncome
          ? _value.monthlyIncome
          : monthlyIncome // ignore: cast_nullable_to_non_nullable
              as int?,
      totalIncome: freezed == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVotes: freezed == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<$Res>? get room {
    if (_value.room == null) {
      return null;
    }

    return $RoomModelCopyWith<$Res>(_value.room!, (value) {
      return _then(_value.copyWith(room: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HostelModelImplCopyWith<$Res>
    implements $HostelModelCopyWith<$Res> {
  factory _$$HostelModelImplCopyWith(
          _$HostelModelImpl value, $Res Function(_$HostelModelImpl) then) =
      __$$HostelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? approvalStatus,
      List<String>? rejectedFields,
      String? reason,
      String? hostelImage,
      String? hostelLicence,
      String? hostelName,
      String? aboutHostel,
      String? gstIn,
      String? hostelType,
      List<AmenitiesModel>? amenities,
      int? amenitiesMore,
      RoomModel? room,
      List<RoomModel>? rooms,
      int? roomsMore,
      List<String>? rules,
      List<ImageDataModel>? images,
      LocationModel? location,
      int? monthlyIncome,
      int? totalIncome,
      int? totalVotes,
      dynamic rating,
      bool? isFavorite});

  @override
  $RoomModelCopyWith<$Res>? get room;
  @override
  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$HostelModelImplCopyWithImpl<$Res>
    extends _$HostelModelCopyWithImpl<$Res, _$HostelModelImpl>
    implements _$$HostelModelImplCopyWith<$Res> {
  __$$HostelModelImplCopyWithImpl(
      _$HostelModelImpl _value, $Res Function(_$HostelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? approvalStatus = freezed,
    Object? rejectedFields = freezed,
    Object? reason = freezed,
    Object? hostelImage = freezed,
    Object? hostelLicence = freezed,
    Object? hostelName = freezed,
    Object? aboutHostel = freezed,
    Object? gstIn = freezed,
    Object? hostelType = freezed,
    Object? amenities = freezed,
    Object? amenitiesMore = freezed,
    Object? room = freezed,
    Object? rooms = freezed,
    Object? roomsMore = freezed,
    Object? rules = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? monthlyIncome = freezed,
    Object? totalIncome = freezed,
    Object? totalVotes = freezed,
    Object? rating = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$HostelModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalStatus: freezed == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectedFields: freezed == rejectedFields
          ? _value._rejectedFields
          : rejectedFields // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelImage: freezed == hostelImage
          ? _value.hostelImage
          : hostelImage // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelLicence: freezed == hostelLicence
          ? _value.hostelLicence
          : hostelLicence // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelName: freezed == hostelName
          ? _value.hostelName
          : hostelName // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutHostel: freezed == aboutHostel
          ? _value.aboutHostel
          : aboutHostel // ignore: cast_nullable_to_non_nullable
              as String?,
      gstIn: freezed == gstIn
          ? _value.gstIn
          : gstIn // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelType: freezed == hostelType
          ? _value.hostelType
          : hostelType // ignore: cast_nullable_to_non_nullable
              as String?,
      amenities: freezed == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<AmenitiesModel>?,
      amenitiesMore: freezed == amenitiesMore
          ? _value.amenitiesMore
          : amenitiesMore // ignore: cast_nullable_to_non_nullable
              as int?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomModel?,
      rooms: freezed == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
      roomsMore: freezed == roomsMore
          ? _value.roomsMore
          : roomsMore // ignore: cast_nullable_to_non_nullable
              as int?,
      rules: freezed == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDataModel>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      monthlyIncome: freezed == monthlyIncome
          ? _value.monthlyIncome
          : monthlyIncome // ignore: cast_nullable_to_non_nullable
              as int?,
      totalIncome: freezed == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVotes: freezed == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HostelModelImpl implements _HostelModel {
  const _$HostelModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.approvalStatus,
      final List<String>? rejectedFields,
      this.reason,
      this.hostelImage,
      this.hostelLicence,
      this.hostelName,
      this.aboutHostel,
      this.gstIn,
      this.hostelType,
      final List<AmenitiesModel>? amenities,
      this.amenitiesMore,
      this.room,
      final List<RoomModel>? rooms,
      this.roomsMore,
      final List<String>? rules,
      final List<ImageDataModel>? images,
      this.location,
      this.monthlyIncome,
      this.totalIncome,
      this.totalVotes,
      this.rating,
      this.isFavorite})
      : _rejectedFields = rejectedFields,
        _amenities = amenities,
        _rooms = rooms,
        _rules = rules,
        _images = images;

  factory _$HostelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostelModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? approvalStatus;
  final List<String>? _rejectedFields;
  @override
  List<String>? get rejectedFields {
    final value = _rejectedFields;
    if (value == null) return null;
    if (_rejectedFields is EqualUnmodifiableListView) return _rejectedFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? reason;
  @override
  final String? hostelImage;
  @override
  final String? hostelLicence;
  @override
  final String? hostelName;
  @override
  final String? aboutHostel;
  @override
  final String? gstIn;
  @override
  final String? hostelType;
  final List<AmenitiesModel>? _amenities;
  @override
  List<AmenitiesModel>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? amenitiesMore;
  @override
  final RoomModel? room;
  final List<RoomModel>? _rooms;
  @override
  List<RoomModel>? get rooms {
    final value = _rooms;
    if (value == null) return null;
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? roomsMore;
  final List<String>? _rules;
  @override
  List<String>? get rules {
    final value = _rules;
    if (value == null) return null;
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ImageDataModel>? _images;
  @override
  List<ImageDataModel>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LocationModel? location;
  @override
  final int? monthlyIncome;
  @override
  final int? totalIncome;
  @override
  final int? totalVotes;
  @override
  final dynamic rating;
  @override
  final bool? isFavorite;

  @override
  String toString() {
    return 'HostelModel(id: $id, approvalStatus: $approvalStatus, rejectedFields: $rejectedFields, reason: $reason, hostelImage: $hostelImage, hostelLicence: $hostelLicence, hostelName: $hostelName, aboutHostel: $aboutHostel, gstIn: $gstIn, hostelType: $hostelType, amenities: $amenities, amenitiesMore: $amenitiesMore, room: $room, rooms: $rooms, roomsMore: $roomsMore, rules: $rules, images: $images, location: $location, monthlyIncome: $monthlyIncome, totalIncome: $totalIncome, totalVotes: $totalVotes, rating: $rating, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus) &&
            const DeepCollectionEquality()
                .equals(other._rejectedFields, _rejectedFields) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.hostelImage, hostelImage) ||
                other.hostelImage == hostelImage) &&
            (identical(other.hostelLicence, hostelLicence) ||
                other.hostelLicence == hostelLicence) &&
            (identical(other.hostelName, hostelName) ||
                other.hostelName == hostelName) &&
            (identical(other.aboutHostel, aboutHostel) ||
                other.aboutHostel == aboutHostel) &&
            (identical(other.gstIn, gstIn) || other.gstIn == gstIn) &&
            (identical(other.hostelType, hostelType) ||
                other.hostelType == hostelType) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.amenitiesMore, amenitiesMore) ||
                other.amenitiesMore == amenitiesMore) &&
            (identical(other.room, room) || other.room == room) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.roomsMore, roomsMore) ||
                other.roomsMore == roomsMore) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.monthlyIncome, monthlyIncome) ||
                other.monthlyIncome == monthlyIncome) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        approvalStatus,
        const DeepCollectionEquality().hash(_rejectedFields),
        reason,
        hostelImage,
        hostelLicence,
        hostelName,
        aboutHostel,
        gstIn,
        hostelType,
        const DeepCollectionEquality().hash(_amenities),
        amenitiesMore,
        room,
        const DeepCollectionEquality().hash(_rooms),
        roomsMore,
        const DeepCollectionEquality().hash(_rules),
        const DeepCollectionEquality().hash(_images),
        location,
        monthlyIncome,
        totalIncome,
        totalVotes,
        const DeepCollectionEquality().hash(rating),
        isFavorite
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HostelModelImplCopyWith<_$HostelModelImpl> get copyWith =>
      __$$HostelModelImplCopyWithImpl<_$HostelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostelModelImplToJson(
      this,
    );
  }
}

abstract class _HostelModel implements HostelModel {
  const factory _HostelModel(
      {@JsonKey(name: '_id') final String? id,
      final String? approvalStatus,
      final List<String>? rejectedFields,
      final String? reason,
      final String? hostelImage,
      final String? hostelLicence,
      final String? hostelName,
      final String? aboutHostel,
      final String? gstIn,
      final String? hostelType,
      final List<AmenitiesModel>? amenities,
      final int? amenitiesMore,
      final RoomModel? room,
      final List<RoomModel>? rooms,
      final int? roomsMore,
      final List<String>? rules,
      final List<ImageDataModel>? images,
      final LocationModel? location,
      final int? monthlyIncome,
      final int? totalIncome,
      final int? totalVotes,
      final dynamic rating,
      final bool? isFavorite}) = _$HostelModelImpl;

  factory _HostelModel.fromJson(Map<String, dynamic> json) =
      _$HostelModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get approvalStatus;
  @override
  List<String>? get rejectedFields;
  @override
  String? get reason;
  @override
  String? get hostelImage;
  @override
  String? get hostelLicence;
  @override
  String? get hostelName;
  @override
  String? get aboutHostel;
  @override
  String? get gstIn;
  @override
  String? get hostelType;
  @override
  List<AmenitiesModel>? get amenities;
  @override
  int? get amenitiesMore;
  @override
  RoomModel? get room;
  @override
  List<RoomModel>? get rooms;
  @override
  int? get roomsMore;
  @override
  List<String>? get rules;
  @override
  List<ImageDataModel>? get images;
  @override
  LocationModel? get location;
  @override
  int? get monthlyIncome;
  @override
  int? get totalIncome;
  @override
  int? get totalVotes;
  @override
  dynamic get rating;
  @override
  bool? get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$HostelModelImplCopyWith<_$HostelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageDataModel _$ImageDataModelFromJson(Map<String, dynamic> json) {
  return _ImageDataModel.fromJson(json);
}

/// @nodoc
mixin _$ImageDataModel {
  String? get imagesType => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDataModelCopyWith<ImageDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDataModelCopyWith<$Res> {
  factory $ImageDataModelCopyWith(
          ImageDataModel value, $Res Function(ImageDataModel) then) =
      _$ImageDataModelCopyWithImpl<$Res, ImageDataModel>;
  @useResult
  $Res call({String? imagesType, List<String>? images});
}

/// @nodoc
class _$ImageDataModelCopyWithImpl<$Res, $Val extends ImageDataModel>
    implements $ImageDataModelCopyWith<$Res> {
  _$ImageDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesType = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      imagesType: freezed == imagesType
          ? _value.imagesType
          : imagesType // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageDataModelImplCopyWith<$Res>
    implements $ImageDataModelCopyWith<$Res> {
  factory _$$ImageDataModelImplCopyWith(_$ImageDataModelImpl value,
          $Res Function(_$ImageDataModelImpl) then) =
      __$$ImageDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imagesType, List<String>? images});
}

/// @nodoc
class __$$ImageDataModelImplCopyWithImpl<$Res>
    extends _$ImageDataModelCopyWithImpl<$Res, _$ImageDataModelImpl>
    implements _$$ImageDataModelImplCopyWith<$Res> {
  __$$ImageDataModelImplCopyWithImpl(
      _$ImageDataModelImpl _value, $Res Function(_$ImageDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesType = freezed,
    Object? images = freezed,
  }) {
    return _then(_$ImageDataModelImpl(
      imagesType: freezed == imagesType
          ? _value.imagesType
          : imagesType // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageDataModelImpl implements _ImageDataModel {
  const _$ImageDataModelImpl({this.imagesType, final List<String>? images})
      : _images = images;

  factory _$ImageDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageDataModelImplFromJson(json);

  @override
  final String? imagesType;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImageDataModel(imagesType: $imagesType, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDataModelImpl &&
            (identical(other.imagesType, imagesType) ||
                other.imagesType == imagesType) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, imagesType, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageDataModelImplCopyWith<_$ImageDataModelImpl> get copyWith =>
      __$$ImageDataModelImplCopyWithImpl<_$ImageDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageDataModelImplToJson(
      this,
    );
  }
}

abstract class _ImageDataModel implements ImageDataModel {
  const factory _ImageDataModel(
      {final String? imagesType,
      final List<String>? images}) = _$ImageDataModelImpl;

  factory _ImageDataModel.fromJson(Map<String, dynamic> json) =
      _$ImageDataModelImpl.fromJson;

  @override
  String? get imagesType;
  @override
  List<String>? get images;
  @override
  @JsonKey(ignore: true)
  _$$ImageDataModelImplCopyWith<_$ImageDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FetchAmenitiesResponseModel _$FetchAmenitiesResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FetchAmenitiesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FetchAmenitiesResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<AmenitiesModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchAmenitiesResponseModelCopyWith<FetchAmenitiesResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchAmenitiesResponseModelCopyWith<$Res> {
  factory $FetchAmenitiesResponseModelCopyWith(
          FetchAmenitiesResponseModel value,
          $Res Function(FetchAmenitiesResponseModel) then) =
      _$FetchAmenitiesResponseModelCopyWithImpl<$Res,
          FetchAmenitiesResponseModel>;
  @useResult
  $Res call({int? status, String? message, List<AmenitiesModel>? data});
}

/// @nodoc
class _$FetchAmenitiesResponseModelCopyWithImpl<$Res,
        $Val extends FetchAmenitiesResponseModel>
    implements $FetchAmenitiesResponseModelCopyWith<$Res> {
  _$FetchAmenitiesResponseModelCopyWithImpl(this._value, this._then);

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
              as List<AmenitiesModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchAmenitiesResponseModelImplCopyWith<$Res>
    implements $FetchAmenitiesResponseModelCopyWith<$Res> {
  factory _$$FetchAmenitiesResponseModelImplCopyWith(
          _$FetchAmenitiesResponseModelImpl value,
          $Res Function(_$FetchAmenitiesResponseModelImpl) then) =
      __$$FetchAmenitiesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, List<AmenitiesModel>? data});
}

/// @nodoc
class __$$FetchAmenitiesResponseModelImplCopyWithImpl<$Res>
    extends _$FetchAmenitiesResponseModelCopyWithImpl<$Res,
        _$FetchAmenitiesResponseModelImpl>
    implements _$$FetchAmenitiesResponseModelImplCopyWith<$Res> {
  __$$FetchAmenitiesResponseModelImplCopyWithImpl(
      _$FetchAmenitiesResponseModelImpl _value,
      $Res Function(_$FetchAmenitiesResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FetchAmenitiesResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AmenitiesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchAmenitiesResponseModelImpl
    implements _FetchAmenitiesResponseModel {
  const _$FetchAmenitiesResponseModelImpl(
      {this.status, this.message, final List<AmenitiesModel>? data})
      : _data = data;

  factory _$FetchAmenitiesResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FetchAmenitiesResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  final List<AmenitiesModel>? _data;
  @override
  List<AmenitiesModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FetchAmenitiesResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAmenitiesResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAmenitiesResponseModelImplCopyWith<_$FetchAmenitiesResponseModelImpl>
      get copyWith => __$$FetchAmenitiesResponseModelImplCopyWithImpl<
          _$FetchAmenitiesResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchAmenitiesResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FetchAmenitiesResponseModel
    implements FetchAmenitiesResponseModel {
  const factory _FetchAmenitiesResponseModel(
      {final int? status,
      final String? message,
      final List<AmenitiesModel>? data}) = _$FetchAmenitiesResponseModelImpl;

  factory _FetchAmenitiesResponseModel.fromJson(Map<String, dynamic> json) =
      _$FetchAmenitiesResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  List<AmenitiesModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FetchAmenitiesResponseModelImplCopyWith<_$FetchAmenitiesResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FetchRatingAndReviewsResponseModel _$FetchRatingAndReviewsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FetchRatingAndReviewsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FetchRatingAndReviewsResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<RatingAndReviewModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchRatingAndReviewsResponseModelCopyWith<
          FetchRatingAndReviewsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchRatingAndReviewsResponseModelCopyWith<$Res> {
  factory $FetchRatingAndReviewsResponseModelCopyWith(
          FetchRatingAndReviewsResponseModel value,
          $Res Function(FetchRatingAndReviewsResponseModel) then) =
      _$FetchRatingAndReviewsResponseModelCopyWithImpl<$Res,
          FetchRatingAndReviewsResponseModel>;
  @useResult
  $Res call({int? status, String? message, List<RatingAndReviewModel>? data});
}

/// @nodoc
class _$FetchRatingAndReviewsResponseModelCopyWithImpl<$Res,
        $Val extends FetchRatingAndReviewsResponseModel>
    implements $FetchRatingAndReviewsResponseModelCopyWith<$Res> {
  _$FetchRatingAndReviewsResponseModelCopyWithImpl(this._value, this._then);

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
              as List<RatingAndReviewModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchRatingAndReviewsResponseModelImplCopyWith<$Res>
    implements $FetchRatingAndReviewsResponseModelCopyWith<$Res> {
  factory _$$FetchRatingAndReviewsResponseModelImplCopyWith(
          _$FetchRatingAndReviewsResponseModelImpl value,
          $Res Function(_$FetchRatingAndReviewsResponseModelImpl) then) =
      __$$FetchRatingAndReviewsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, List<RatingAndReviewModel>? data});
}

/// @nodoc
class __$$FetchRatingAndReviewsResponseModelImplCopyWithImpl<$Res>
    extends _$FetchRatingAndReviewsResponseModelCopyWithImpl<$Res,
        _$FetchRatingAndReviewsResponseModelImpl>
    implements _$$FetchRatingAndReviewsResponseModelImplCopyWith<$Res> {
  __$$FetchRatingAndReviewsResponseModelImplCopyWithImpl(
      _$FetchRatingAndReviewsResponseModelImpl _value,
      $Res Function(_$FetchRatingAndReviewsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FetchRatingAndReviewsResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RatingAndReviewModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchRatingAndReviewsResponseModelImpl
    implements _FetchRatingAndReviewsResponseModel {
  const _$FetchRatingAndReviewsResponseModelImpl(
      {this.status, this.message, final List<RatingAndReviewModel>? data})
      : _data = data;

  factory _$FetchRatingAndReviewsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FetchRatingAndReviewsResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  final List<RatingAndReviewModel>? _data;
  @override
  List<RatingAndReviewModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FetchRatingAndReviewsResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchRatingAndReviewsResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchRatingAndReviewsResponseModelImplCopyWith<
          _$FetchRatingAndReviewsResponseModelImpl>
      get copyWith => __$$FetchRatingAndReviewsResponseModelImplCopyWithImpl<
          _$FetchRatingAndReviewsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchRatingAndReviewsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FetchRatingAndReviewsResponseModel
    implements FetchRatingAndReviewsResponseModel {
  const factory _FetchRatingAndReviewsResponseModel(
          {final int? status,
          final String? message,
          final List<RatingAndReviewModel>? data}) =
      _$FetchRatingAndReviewsResponseModelImpl;

  factory _FetchRatingAndReviewsResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$FetchRatingAndReviewsResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  List<RatingAndReviewModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FetchRatingAndReviewsResponseModelImplCopyWith<
          _$FetchRatingAndReviewsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RatingAndReviewModel _$RatingAndReviewModelFromJson(Map<String, dynamic> json) {
  return _RatingAndReviewModel.fromJson(json);
}

/// @nodoc
mixin _$RatingAndReviewModel {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get hostelId => throw _privateConstructorUsedError;
  dynamic get rating => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingAndReviewModelCopyWith<RatingAndReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingAndReviewModelCopyWith<$Res> {
  factory $RatingAndReviewModelCopyWith(RatingAndReviewModel value,
          $Res Function(RatingAndReviewModel) then) =
      _$RatingAndReviewModelCopyWithImpl<$Res, RatingAndReviewModel>;
  @useResult
  $Res call({dynamic userId, dynamic hostelId, dynamic rating, String? review});
}

/// @nodoc
class _$RatingAndReviewModelCopyWithImpl<$Res,
        $Val extends RatingAndReviewModel>
    implements $RatingAndReviewModelCopyWith<$Res> {
  _$RatingAndReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? hostelId = freezed,
    Object? rating = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingAndReviewModelImplCopyWith<$Res>
    implements $RatingAndReviewModelCopyWith<$Res> {
  factory _$$RatingAndReviewModelImplCopyWith(_$RatingAndReviewModelImpl value,
          $Res Function(_$RatingAndReviewModelImpl) then) =
      __$$RatingAndReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic userId, dynamic hostelId, dynamic rating, String? review});
}

/// @nodoc
class __$$RatingAndReviewModelImplCopyWithImpl<$Res>
    extends _$RatingAndReviewModelCopyWithImpl<$Res, _$RatingAndReviewModelImpl>
    implements _$$RatingAndReviewModelImplCopyWith<$Res> {
  __$$RatingAndReviewModelImplCopyWithImpl(_$RatingAndReviewModelImpl _value,
      $Res Function(_$RatingAndReviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? hostelId = freezed,
    Object? rating = freezed,
    Object? review = freezed,
  }) {
    return _then(_$RatingAndReviewModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingAndReviewModelImpl implements _RatingAndReviewModel {
  const _$RatingAndReviewModelImpl(
      {this.userId, this.hostelId, this.rating, this.review});

  factory _$RatingAndReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingAndReviewModelImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic hostelId;
  @override
  final dynamic rating;
  @override
  final String? review;

  @override
  String toString() {
    return 'RatingAndReviewModel(userId: $userId, hostelId: $hostelId, rating: $rating, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingAndReviewModelImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.hostelId, hostelId) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            (identical(other.review, review) || other.review == review));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(hostelId),
      const DeepCollectionEquality().hash(rating),
      review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingAndReviewModelImplCopyWith<_$RatingAndReviewModelImpl>
      get copyWith =>
          __$$RatingAndReviewModelImplCopyWithImpl<_$RatingAndReviewModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingAndReviewModelImplToJson(
      this,
    );
  }
}

abstract class _RatingAndReviewModel implements RatingAndReviewModel {
  const factory _RatingAndReviewModel(
      {final dynamic userId,
      final dynamic hostelId,
      final dynamic rating,
      final String? review}) = _$RatingAndReviewModelImpl;

  factory _RatingAndReviewModel.fromJson(Map<String, dynamic> json) =
      _$RatingAndReviewModelImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get hostelId;
  @override
  dynamic get rating;
  @override
  String? get review;
  @override
  @JsonKey(ignore: true)
  _$$RatingAndReviewModelImplCopyWith<_$RatingAndReviewModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FetchHostelRoomsResponseModel _$FetchHostelRoomsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FetchHostelRoomsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FetchHostelRoomsResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<RoomModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchHostelRoomsResponseModelCopyWith<FetchHostelRoomsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchHostelRoomsResponseModelCopyWith<$Res> {
  factory $FetchHostelRoomsResponseModelCopyWith(
          FetchHostelRoomsResponseModel value,
          $Res Function(FetchHostelRoomsResponseModel) then) =
      _$FetchHostelRoomsResponseModelCopyWithImpl<$Res,
          FetchHostelRoomsResponseModel>;
  @useResult
  $Res call({int? status, String? message, List<RoomModel>? data});
}

/// @nodoc
class _$FetchHostelRoomsResponseModelCopyWithImpl<$Res,
        $Val extends FetchHostelRoomsResponseModel>
    implements $FetchHostelRoomsResponseModelCopyWith<$Res> {
  _$FetchHostelRoomsResponseModelCopyWithImpl(this._value, this._then);

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
              as List<RoomModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchHostelRoomsResponseModelImplCopyWith<$Res>
    implements $FetchHostelRoomsResponseModelCopyWith<$Res> {
  factory _$$FetchHostelRoomsResponseModelImplCopyWith(
          _$FetchHostelRoomsResponseModelImpl value,
          $Res Function(_$FetchHostelRoomsResponseModelImpl) then) =
      __$$FetchHostelRoomsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, List<RoomModel>? data});
}

/// @nodoc
class __$$FetchHostelRoomsResponseModelImplCopyWithImpl<$Res>
    extends _$FetchHostelRoomsResponseModelCopyWithImpl<$Res,
        _$FetchHostelRoomsResponseModelImpl>
    implements _$$FetchHostelRoomsResponseModelImplCopyWith<$Res> {
  __$$FetchHostelRoomsResponseModelImplCopyWithImpl(
      _$FetchHostelRoomsResponseModelImpl _value,
      $Res Function(_$FetchHostelRoomsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FetchHostelRoomsResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchHostelRoomsResponseModelImpl
    implements _FetchHostelRoomsResponseModel {
  const _$FetchHostelRoomsResponseModelImpl(
      {this.status, this.message, final List<RoomModel>? data})
      : _data = data;

  factory _$FetchHostelRoomsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FetchHostelRoomsResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  final List<RoomModel>? _data;
  @override
  List<RoomModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FetchHostelRoomsResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchHostelRoomsResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchHostelRoomsResponseModelImplCopyWith<
          _$FetchHostelRoomsResponseModelImpl>
      get copyWith => __$$FetchHostelRoomsResponseModelImplCopyWithImpl<
          _$FetchHostelRoomsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchHostelRoomsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FetchHostelRoomsResponseModel
    implements FetchHostelRoomsResponseModel {
  const factory _FetchHostelRoomsResponseModel(
      {final int? status,
      final String? message,
      final List<RoomModel>? data}) = _$FetchHostelRoomsResponseModelImpl;

  factory _FetchHostelRoomsResponseModel.fromJson(Map<String, dynamic> json) =
      _$FetchHostelRoomsResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  List<RoomModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FetchHostelRoomsResponseModelImplCopyWith<
          _$FetchHostelRoomsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AmenitiesModel _$AmenitiesModelFromJson(Map<String, dynamic> json) {
  return _AmenitiesModel.fromJson(json);
}

/// @nodoc
mixin _$AmenitiesModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmenitiesModelCopyWith<AmenitiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmenitiesModelCopyWith<$Res> {
  factory $AmenitiesModelCopyWith(
          AmenitiesModel value, $Res Function(AmenitiesModel) then) =
      _$AmenitiesModelCopyWithImpl<$Res, AmenitiesModel>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? image, String? name});
}

/// @nodoc
class _$AmenitiesModelCopyWithImpl<$Res, $Val extends AmenitiesModel>
    implements $AmenitiesModelCopyWith<$Res> {
  _$AmenitiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmenitiesModelImplCopyWith<$Res>
    implements $AmenitiesModelCopyWith<$Res> {
  factory _$$AmenitiesModelImplCopyWith(_$AmenitiesModelImpl value,
          $Res Function(_$AmenitiesModelImpl) then) =
      __$$AmenitiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, String? image, String? name});
}

/// @nodoc
class __$$AmenitiesModelImplCopyWithImpl<$Res>
    extends _$AmenitiesModelCopyWithImpl<$Res, _$AmenitiesModelImpl>
    implements _$$AmenitiesModelImplCopyWith<$Res> {
  __$$AmenitiesModelImplCopyWithImpl(
      _$AmenitiesModelImpl _value, $Res Function(_$AmenitiesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
  }) {
    return _then(_$AmenitiesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmenitiesModelImpl implements _AmenitiesModel {
  const _$AmenitiesModelImpl(
      {@JsonKey(name: '_id') this.id, this.image, this.name});

  factory _$AmenitiesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmenitiesModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? image;
  @override
  final String? name;

  @override
  String toString() {
    return 'AmenitiesModel(id: $id, image: $image, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmenitiesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmenitiesModelImplCopyWith<_$AmenitiesModelImpl> get copyWith =>
      __$$AmenitiesModelImplCopyWithImpl<_$AmenitiesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AmenitiesModelImplToJson(
      this,
    );
  }
}

abstract class _AmenitiesModel implements AmenitiesModel {
  const factory _AmenitiesModel(
      {@JsonKey(name: '_id') final String? id,
      final String? image,
      final String? name}) = _$AmenitiesModelImpl;

  factory _AmenitiesModel.fromJson(Map<String, dynamic> json) =
      _$AmenitiesModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get image;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$AmenitiesModelImplCopyWith<_$AmenitiesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}

/// @nodoc
mixin _$RoomModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get dealerId => throw _privateConstructorUsedError;
  String? get hostelId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get roomNo => throw _privateConstructorUsedError;
  int? get floor => throw _privateConstructorUsedError;
  List<String>? get specialAmenities => throw _privateConstructorUsedError;
  int? get capacityCount => throw _privateConstructorUsedError;
  int? get occupiedCount => throw _privateConstructorUsedError;
  String? get roomType => throw _privateConstructorUsedError;
  RentModel? get rent => throw _privateConstructorUsedError;
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  DateTime? get checkOutDate => throw _privateConstructorUsedError;
  int? get guestCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomModelCopyWith<RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) then) =
      _$RoomModelCopyWithImpl<$Res, RoomModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? dealerId,
      String? hostelId,
      String? image,
      String? roomNo,
      int? floor,
      List<String>? specialAmenities,
      int? capacityCount,
      int? occupiedCount,
      String? roomType,
      RentModel? rent,
      DateTime? checkInDate,
      DateTime? checkOutDate,
      int? guestCount});

  $RentModelCopyWith<$Res>? get rent;
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res, $Val extends RoomModel>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dealerId = freezed,
    Object? hostelId = freezed,
    Object? image = freezed,
    Object? roomNo = freezed,
    Object? floor = freezed,
    Object? specialAmenities = freezed,
    Object? capacityCount = freezed,
    Object? occupiedCount = freezed,
    Object? roomType = freezed,
    Object? rent = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? guestCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dealerId: freezed == dealerId
          ? _value.dealerId
          : dealerId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      roomNo: freezed == roomNo
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      specialAmenities: freezed == specialAmenities
          ? _value.specialAmenities
          : specialAmenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capacityCount: freezed == capacityCount
          ? _value.capacityCount
          : capacityCount // ignore: cast_nullable_to_non_nullable
              as int?,
      occupiedCount: freezed == occupiedCount
          ? _value.occupiedCount
          : occupiedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      roomType: freezed == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as String?,
      rent: freezed == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as RentModel?,
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

  @override
  @pragma('vm:prefer-inline')
  $RentModelCopyWith<$Res>? get rent {
    if (_value.rent == null) {
      return null;
    }

    return $RentModelCopyWith<$Res>(_value.rent!, (value) {
      return _then(_value.copyWith(rent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomModelImplCopyWith<$Res>
    implements $RoomModelCopyWith<$Res> {
  factory _$$RoomModelImplCopyWith(
          _$RoomModelImpl value, $Res Function(_$RoomModelImpl) then) =
      __$$RoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? dealerId,
      String? hostelId,
      String? image,
      String? roomNo,
      int? floor,
      List<String>? specialAmenities,
      int? capacityCount,
      int? occupiedCount,
      String? roomType,
      RentModel? rent,
      DateTime? checkInDate,
      DateTime? checkOutDate,
      int? guestCount});

  @override
  $RentModelCopyWith<$Res>? get rent;
}

/// @nodoc
class __$$RoomModelImplCopyWithImpl<$Res>
    extends _$RoomModelCopyWithImpl<$Res, _$RoomModelImpl>
    implements _$$RoomModelImplCopyWith<$Res> {
  __$$RoomModelImplCopyWithImpl(
      _$RoomModelImpl _value, $Res Function(_$RoomModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dealerId = freezed,
    Object? hostelId = freezed,
    Object? image = freezed,
    Object? roomNo = freezed,
    Object? floor = freezed,
    Object? specialAmenities = freezed,
    Object? capacityCount = freezed,
    Object? occupiedCount = freezed,
    Object? roomType = freezed,
    Object? rent = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? guestCount = freezed,
  }) {
    return _then(_$RoomModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      dealerId: freezed == dealerId
          ? _value.dealerId
          : dealerId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      roomNo: freezed == roomNo
          ? _value.roomNo
          : roomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      specialAmenities: freezed == specialAmenities
          ? _value._specialAmenities
          : specialAmenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capacityCount: freezed == capacityCount
          ? _value.capacityCount
          : capacityCount // ignore: cast_nullable_to_non_nullable
              as int?,
      occupiedCount: freezed == occupiedCount
          ? _value.occupiedCount
          : occupiedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      roomType: freezed == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as String?,
      rent: freezed == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as RentModel?,
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
class _$RoomModelImpl implements _RoomModel {
  const _$RoomModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.dealerId,
      this.hostelId,
      this.image,
      this.roomNo,
      this.floor,
      final List<String>? specialAmenities,
      this.capacityCount,
      this.occupiedCount,
      this.roomType,
      this.rent,
      this.checkInDate,
      this.checkOutDate,
      this.guestCount})
      : _specialAmenities = specialAmenities;

  factory _$RoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? dealerId;
  @override
  final String? hostelId;
  @override
  final String? image;
  @override
  final String? roomNo;
  @override
  final int? floor;
  final List<String>? _specialAmenities;
  @override
  List<String>? get specialAmenities {
    final value = _specialAmenities;
    if (value == null) return null;
    if (_specialAmenities is EqualUnmodifiableListView)
      return _specialAmenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? capacityCount;
  @override
  final int? occupiedCount;
  @override
  final String? roomType;
  @override
  final RentModel? rent;
  @override
  final DateTime? checkInDate;
  @override
  final DateTime? checkOutDate;
  @override
  final int? guestCount;

  @override
  String toString() {
    return 'RoomModel(id: $id, dealerId: $dealerId, hostelId: $hostelId, image: $image, roomNo: $roomNo, floor: $floor, specialAmenities: $specialAmenities, capacityCount: $capacityCount, occupiedCount: $occupiedCount, roomType: $roomType, rent: $rent, checkInDate: $checkInDate, checkOutDate: $checkOutDate, guestCount: $guestCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dealerId, dealerId) ||
                other.dealerId == dealerId) &&
            (identical(other.hostelId, hostelId) ||
                other.hostelId == hostelId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.roomNo, roomNo) || other.roomNo == roomNo) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            const DeepCollectionEquality()
                .equals(other._specialAmenities, _specialAmenities) &&
            (identical(other.capacityCount, capacityCount) ||
                other.capacityCount == capacityCount) &&
            (identical(other.occupiedCount, occupiedCount) ||
                other.occupiedCount == occupiedCount) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.rent, rent) || other.rent == rent) &&
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
      id,
      dealerId,
      hostelId,
      image,
      roomNo,
      floor,
      const DeepCollectionEquality().hash(_specialAmenities),
      capacityCount,
      occupiedCount,
      roomType,
      rent,
      checkInDate,
      checkOutDate,
      guestCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      __$$RoomModelImplCopyWithImpl<_$RoomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomModelImplToJson(
      this,
    );
  }
}

abstract class _RoomModel implements RoomModel {
  const factory _RoomModel(
      {@JsonKey(name: '_id') final String? id,
      final String? dealerId,
      final String? hostelId,
      final String? image,
      final String? roomNo,
      final int? floor,
      final List<String>? specialAmenities,
      final int? capacityCount,
      final int? occupiedCount,
      final String? roomType,
      final RentModel? rent,
      final DateTime? checkInDate,
      final DateTime? checkOutDate,
      final int? guestCount}) = _$RoomModelImpl;

  factory _RoomModel.fromJson(Map<String, dynamic> json) =
      _$RoomModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get dealerId;
  @override
  String? get hostelId;
  @override
  String? get image;
  @override
  String? get roomNo;
  @override
  int? get floor;
  @override
  List<String>? get specialAmenities;
  @override
  int? get capacityCount;
  @override
  int? get occupiedCount;
  @override
  String? get roomType;
  @override
  RentModel? get rent;
  @override
  DateTime? get checkInDate;
  @override
  DateTime? get checkOutDate;
  @override
  int? get guestCount;
  @override
  @JsonKey(ignore: true)
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RentModel _$RentModelFromJson(Map<String, dynamic> json) {
  return _RentModel.fromJson(json);
}

/// @nodoc
mixin _$RentModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get daily => throw _privateConstructorUsedError;
  int? get monthly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentModelCopyWith<RentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentModelCopyWith<$Res> {
  factory $RentModelCopyWith(RentModel value, $Res Function(RentModel) then) =
      _$RentModelCopyWithImpl<$Res, RentModel>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, int? daily, int? monthly});
}

/// @nodoc
class _$RentModelCopyWithImpl<$Res, $Val extends RentModel>
    implements $RentModelCopyWith<$Res> {
  _$RentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? daily = freezed,
    Object? monthly = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      daily: freezed == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int?,
      monthly: freezed == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentModelImplCopyWith<$Res>
    implements $RentModelCopyWith<$Res> {
  factory _$$RentModelImplCopyWith(
          _$RentModelImpl value, $Res Function(_$RentModelImpl) then) =
      __$$RentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? id, int? daily, int? monthly});
}

/// @nodoc
class __$$RentModelImplCopyWithImpl<$Res>
    extends _$RentModelCopyWithImpl<$Res, _$RentModelImpl>
    implements _$$RentModelImplCopyWith<$Res> {
  __$$RentModelImplCopyWithImpl(
      _$RentModelImpl _value, $Res Function(_$RentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? daily = freezed,
    Object? monthly = freezed,
  }) {
    return _then(_$RentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      daily: freezed == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as int?,
      monthly: freezed == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentModelImpl implements _RentModel {
  const _$RentModelImpl(
      {@JsonKey(name: '_id') this.id, this.daily, this.monthly});

  factory _$RentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? daily;
  @override
  final int? monthly;

  @override
  String toString() {
    return 'RentModel(id: $id, daily: $daily, monthly: $monthly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.monthly, monthly) || other.monthly == monthly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, daily, monthly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentModelImplCopyWith<_$RentModelImpl> get copyWith =>
      __$$RentModelImplCopyWithImpl<_$RentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentModelImplToJson(
      this,
    );
  }
}

abstract class _RentModel implements RentModel {
  const factory _RentModel(
      {@JsonKey(name: '_id') final String? id,
      final int? daily,
      final int? monthly}) = _$RentModelImpl;

  factory _RentModel.fromJson(Map<String, dynamic> json) =
      _$RentModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  int? get daily;
  @override
  int? get monthly;
  @override
  @JsonKey(ignore: true)
  _$$RentModelImplCopyWith<_$RentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TitleMessageModel _$TitleMessageModelFromJson(Map<String, dynamic> json) {
  return _TitleMessageModel.fromJson(json);
}

/// @nodoc
mixin _$TitleMessageModel {
  String? get image => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TitleMessageModelCopyWith<TitleMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleMessageModelCopyWith<$Res> {
  factory $TitleMessageModelCopyWith(
          TitleMessageModel value, $Res Function(TitleMessageModel) then) =
      _$TitleMessageModelCopyWithImpl<$Res, TitleMessageModel>;
  @useResult
  $Res call({String? image, String? message});
}

/// @nodoc
class _$TitleMessageModelCopyWithImpl<$Res, $Val extends TitleMessageModel>
    implements $TitleMessageModelCopyWith<$Res> {
  _$TitleMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitleMessageModelImplCopyWith<$Res>
    implements $TitleMessageModelCopyWith<$Res> {
  factory _$$TitleMessageModelImplCopyWith(_$TitleMessageModelImpl value,
          $Res Function(_$TitleMessageModelImpl) then) =
      __$$TitleMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? image, String? message});
}

/// @nodoc
class __$$TitleMessageModelImplCopyWithImpl<$Res>
    extends _$TitleMessageModelCopyWithImpl<$Res, _$TitleMessageModelImpl>
    implements _$$TitleMessageModelImplCopyWith<$Res> {
  __$$TitleMessageModelImplCopyWithImpl(_$TitleMessageModelImpl _value,
      $Res Function(_$TitleMessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? message = freezed,
  }) {
    return _then(_$TitleMessageModelImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TitleMessageModelImpl implements _TitleMessageModel {
  const _$TitleMessageModelImpl({this.image, this.message});

  factory _$TitleMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TitleMessageModelImplFromJson(json);

  @override
  final String? image;
  @override
  final String? message;

  @override
  String toString() {
    return 'TitleMessageModel(image: $image, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleMessageModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleMessageModelImplCopyWith<_$TitleMessageModelImpl> get copyWith =>
      __$$TitleMessageModelImplCopyWithImpl<_$TitleMessageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TitleMessageModelImplToJson(
      this,
    );
  }
}

abstract class _TitleMessageModel implements TitleMessageModel {
  const factory _TitleMessageModel(
      {final String? image, final String? message}) = _$TitleMessageModelImpl;

  factory _TitleMessageModel.fromJson(Map<String, dynamic> json) =
      _$TitleMessageModelImpl.fromJson;

  @override
  String? get image;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$TitleMessageModelImplCopyWith<_$TitleMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
