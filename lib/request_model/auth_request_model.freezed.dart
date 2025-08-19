// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateVersionRequestModel _$ValidateVersionRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ValidateVersionRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ValidateVersionRequestModel {
  String? get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateVersionRequestModelCopyWith<ValidateVersionRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateVersionRequestModelCopyWith<$Res> {
  factory $ValidateVersionRequestModelCopyWith(
          ValidateVersionRequestModel value,
          $Res Function(ValidateVersionRequestModel) then) =
      _$ValidateVersionRequestModelCopyWithImpl<$Res,
          ValidateVersionRequestModel>;
  @useResult
  $Res call({String? version});
}

/// @nodoc
class _$ValidateVersionRequestModelCopyWithImpl<$Res,
        $Val extends ValidateVersionRequestModel>
    implements $ValidateVersionRequestModelCopyWith<$Res> {
  _$ValidateVersionRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidateVersionRequestModelImplCopyWith<$Res>
    implements $ValidateVersionRequestModelCopyWith<$Res> {
  factory _$$ValidateVersionRequestModelImplCopyWith(
          _$ValidateVersionRequestModelImpl value,
          $Res Function(_$ValidateVersionRequestModelImpl) then) =
      __$$ValidateVersionRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? version});
}

/// @nodoc
class __$$ValidateVersionRequestModelImplCopyWithImpl<$Res>
    extends _$ValidateVersionRequestModelCopyWithImpl<$Res,
        _$ValidateVersionRequestModelImpl>
    implements _$$ValidateVersionRequestModelImplCopyWith<$Res> {
  __$$ValidateVersionRequestModelImplCopyWithImpl(
      _$ValidateVersionRequestModelImpl _value,
      $Res Function(_$ValidateVersionRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
  }) {
    return _then(_$ValidateVersionRequestModelImpl(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateVersionRequestModelImpl
    implements _ValidateVersionRequestModel {
  const _$ValidateVersionRequestModelImpl({required this.version});

  factory _$ValidateVersionRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ValidateVersionRequestModelImplFromJson(json);

  @override
  final String? version;

  @override
  String toString() {
    return 'ValidateVersionRequestModel(version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateVersionRequestModelImpl &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateVersionRequestModelImplCopyWith<_$ValidateVersionRequestModelImpl>
      get copyWith => __$$ValidateVersionRequestModelImplCopyWithImpl<
          _$ValidateVersionRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateVersionRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ValidateVersionRequestModel
    implements ValidateVersionRequestModel {
  const factory _ValidateVersionRequestModel({required final String? version}) =
      _$ValidateVersionRequestModelImpl;

  factory _ValidateVersionRequestModel.fromJson(Map<String, dynamic> json) =
      _$ValidateVersionRequestModelImpl.fromJson;

  @override
  String? get version;
  @override
  @JsonKey(ignore: true)
  _$$ValidateVersionRequestModelImplCopyWith<_$ValidateVersionRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaginationRequestModel _$PaginationRequestModelFromJson(
    Map<String, dynamic> json) {
  return _PaginationRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationRequestModel {
  String? get query => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get docId => throw _privateConstructorUsedError;
  String? get hostelId => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationRequestModelCopyWith<PaginationRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationRequestModelCopyWith<$Res> {
  factory $PaginationRequestModelCopyWith(PaginationRequestModel value,
          $Res Function(PaginationRequestModel) then) =
      _$PaginationRequestModelCopyWithImpl<$Res, PaginationRequestModel>;
  @useResult
  $Res call(
      {String? query,
      String? type,
      String? docId,
      String? hostelId,
      int? page});
}

/// @nodoc
class _$PaginationRequestModelCopyWithImpl<$Res,
        $Val extends PaginationRequestModel>
    implements $PaginationRequestModelCopyWith<$Res> {
  _$PaginationRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? type = freezed,
    Object? docId = freezed,
    Object? hostelId = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationRequestModelImplCopyWith<$Res>
    implements $PaginationRequestModelCopyWith<$Res> {
  factory _$$PaginationRequestModelImplCopyWith(
          _$PaginationRequestModelImpl value,
          $Res Function(_$PaginationRequestModelImpl) then) =
      __$$PaginationRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      String? type,
      String? docId,
      String? hostelId,
      int? page});
}

/// @nodoc
class __$$PaginationRequestModelImplCopyWithImpl<$Res>
    extends _$PaginationRequestModelCopyWithImpl<$Res,
        _$PaginationRequestModelImpl>
    implements _$$PaginationRequestModelImplCopyWith<$Res> {
  __$$PaginationRequestModelImplCopyWithImpl(
      _$PaginationRequestModelImpl _value,
      $Res Function(_$PaginationRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? type = freezed,
    Object? docId = freezed,
    Object? hostelId = freezed,
    Object? page = freezed,
  }) {
    return _then(_$PaginationRequestModelImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostelId: freezed == hostelId
          ? _value.hostelId
          : hostelId // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationRequestModelImpl implements _PaginationRequestModel {
  const _$PaginationRequestModelImpl(
      {this.query, this.type, this.docId, this.hostelId, required this.page});

  factory _$PaginationRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationRequestModelImplFromJson(json);

  @override
  final String? query;
  @override
  final String? type;
  @override
  final String? docId;
  @override
  final String? hostelId;
  @override
  final int? page;

  @override
  String toString() {
    return 'PaginationRequestModel(query: $query, type: $type, docId: $docId, hostelId: $hostelId, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationRequestModelImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.hostelId, hostelId) ||
                other.hostelId == hostelId) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, query, type, docId, hostelId, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationRequestModelImplCopyWith<_$PaginationRequestModelImpl>
      get copyWith => __$$PaginationRequestModelImplCopyWithImpl<
          _$PaginationRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PaginationRequestModel implements PaginationRequestModel {
  const factory _PaginationRequestModel(
      {final String? query,
      final String? type,
      final String? docId,
      final String? hostelId,
      required final int? page}) = _$PaginationRequestModelImpl;

  factory _PaginationRequestModel.fromJson(Map<String, dynamic> json) =
      _$PaginationRequestModelImpl.fromJson;

  @override
  String? get query;
  @override
  String? get type;
  @override
  String? get docId;
  @override
  String? get hostelId;
  @override
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$PaginationRequestModelImplCopyWith<_$PaginationRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SendOtpRequestModel _$SendOtpRequestModelFromJson(Map<String, dynamic> json) {
  return _SendOtpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendOtpRequestModel {
  int? get mobile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendOtpRequestModelCopyWith<SendOtpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpRequestModelCopyWith<$Res> {
  factory $SendOtpRequestModelCopyWith(
          SendOtpRequestModel value, $Res Function(SendOtpRequestModel) then) =
      _$SendOtpRequestModelCopyWithImpl<$Res, SendOtpRequestModel>;
  @useResult
  $Res call({int? mobile});
}

/// @nodoc
class _$SendOtpRequestModelCopyWithImpl<$Res, $Val extends SendOtpRequestModel>
    implements $SendOtpRequestModelCopyWith<$Res> {
  _$SendOtpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobile = freezed,
  }) {
    return _then(_value.copyWith(
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendOtpRequestModelImplCopyWith<$Res>
    implements $SendOtpRequestModelCopyWith<$Res> {
  factory _$$SendOtpRequestModelImplCopyWith(_$SendOtpRequestModelImpl value,
          $Res Function(_$SendOtpRequestModelImpl) then) =
      __$$SendOtpRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? mobile});
}

/// @nodoc
class __$$SendOtpRequestModelImplCopyWithImpl<$Res>
    extends _$SendOtpRequestModelCopyWithImpl<$Res, _$SendOtpRequestModelImpl>
    implements _$$SendOtpRequestModelImplCopyWith<$Res> {
  __$$SendOtpRequestModelImplCopyWithImpl(_$SendOtpRequestModelImpl _value,
      $Res Function(_$SendOtpRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobile = freezed,
  }) {
    return _then(_$SendOtpRequestModelImpl(
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendOtpRequestModelImpl implements _SendOtpRequestModel {
  const _$SendOtpRequestModelImpl({required this.mobile});

  factory _$SendOtpRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendOtpRequestModelImplFromJson(json);

  @override
  final int? mobile;

  @override
  String toString() {
    return 'SendOtpRequestModel(mobile: $mobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpRequestModelImpl &&
            (identical(other.mobile, mobile) || other.mobile == mobile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mobile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpRequestModelImplCopyWith<_$SendOtpRequestModelImpl> get copyWith =>
      __$$SendOtpRequestModelImplCopyWithImpl<_$SendOtpRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendOtpRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SendOtpRequestModel implements SendOtpRequestModel {
  const factory _SendOtpRequestModel({required final int? mobile}) =
      _$SendOtpRequestModelImpl;

  factory _SendOtpRequestModel.fromJson(Map<String, dynamic> json) =
      _$SendOtpRequestModelImpl.fromJson;

  @override
  int? get mobile;
  @override
  @JsonKey(ignore: true)
  _$$SendOtpRequestModelImplCopyWith<_$SendOtpRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyOtpRequestModel _$VerifyOtpRequestModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpRequestModel {
  int? get mobile => throw _privateConstructorUsedError;
  int? get otp => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpRequestModelCopyWith<VerifyOtpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpRequestModelCopyWith<$Res> {
  factory $VerifyOtpRequestModelCopyWith(VerifyOtpRequestModel value,
          $Res Function(VerifyOtpRequestModel) then) =
      _$VerifyOtpRequestModelCopyWithImpl<$Res, VerifyOtpRequestModel>;
  @useResult
  $Res call(
      {int? mobile,
      int? otp,
      String? source,
      String? version,
      String? deviceId});
}

/// @nodoc
class _$VerifyOtpRequestModelCopyWithImpl<$Res,
        $Val extends VerifyOtpRequestModel>
    implements $VerifyOtpRequestModelCopyWith<$Res> {
  _$VerifyOtpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobile = freezed,
    Object? otp = freezed,
    Object? source = freezed,
    Object? version = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpRequestModelImplCopyWith<$Res>
    implements $VerifyOtpRequestModelCopyWith<$Res> {
  factory _$$VerifyOtpRequestModelImplCopyWith(
          _$VerifyOtpRequestModelImpl value,
          $Res Function(_$VerifyOtpRequestModelImpl) then) =
      __$$VerifyOtpRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? mobile,
      int? otp,
      String? source,
      String? version,
      String? deviceId});
}

/// @nodoc
class __$$VerifyOtpRequestModelImplCopyWithImpl<$Res>
    extends _$VerifyOtpRequestModelCopyWithImpl<$Res,
        _$VerifyOtpRequestModelImpl>
    implements _$$VerifyOtpRequestModelImplCopyWith<$Res> {
  __$$VerifyOtpRequestModelImplCopyWithImpl(_$VerifyOtpRequestModelImpl _value,
      $Res Function(_$VerifyOtpRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobile = freezed,
    Object? otp = freezed,
    Object? source = freezed,
    Object? version = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_$VerifyOtpRequestModelImpl(
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpRequestModelImpl implements _VerifyOtpRequestModel {
  const _$VerifyOtpRequestModelImpl(
      {required this.mobile,
      required this.otp,
      required this.source,
      required this.version,
      required this.deviceId});

  factory _$VerifyOtpRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpRequestModelImplFromJson(json);

  @override
  final int? mobile;
  @override
  final int? otp;
  @override
  final String? source;
  @override
  final String? version;
  @override
  final String? deviceId;

  @override
  String toString() {
    return 'VerifyOtpRequestModel(mobile: $mobile, otp: $otp, source: $source, version: $version, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpRequestModelImpl &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mobile, otp, source, version, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpRequestModelImplCopyWith<_$VerifyOtpRequestModelImpl>
      get copyWith => __$$VerifyOtpRequestModelImplCopyWithImpl<
          _$VerifyOtpRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpRequestModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpRequestModel implements VerifyOtpRequestModel {
  const factory _VerifyOtpRequestModel(
      {required final int? mobile,
      required final int? otp,
      required final String? source,
      required final String? version,
      required final String? deviceId}) = _$VerifyOtpRequestModelImpl;

  factory _VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpRequestModelImpl.fromJson;

  @override
  int? get mobile;
  @override
  int? get otp;
  @override
  String? get source;
  @override
  String? get version;
  @override
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpRequestModelImplCopyWith<_$VerifyOtpRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GoogleAuthRequestModel _$GoogleAuthRequestModelFromJson(
    Map<String, dynamic> json) {
  return _GoogleAuthRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GoogleAuthRequestModel {
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoogleAuthRequestModelCopyWith<GoogleAuthRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthRequestModelCopyWith<$Res> {
  factory $GoogleAuthRequestModelCopyWith(GoogleAuthRequestModel value,
          $Res Function(GoogleAuthRequestModel) then) =
      _$GoogleAuthRequestModelCopyWithImpl<$Res, GoogleAuthRequestModel>;
  @useResult
  $Res call(
      {String? email,
      String? name,
      String? source,
      String? version,
      String? deviceId});
}

/// @nodoc
class _$GoogleAuthRequestModelCopyWithImpl<$Res,
        $Val extends GoogleAuthRequestModel>
    implements $GoogleAuthRequestModelCopyWith<$Res> {
  _$GoogleAuthRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? source = freezed,
    Object? version = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleAuthRequestModelImplCopyWith<$Res>
    implements $GoogleAuthRequestModelCopyWith<$Res> {
  factory _$$GoogleAuthRequestModelImplCopyWith(
          _$GoogleAuthRequestModelImpl value,
          $Res Function(_$GoogleAuthRequestModelImpl) then) =
      __$$GoogleAuthRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? name,
      String? source,
      String? version,
      String? deviceId});
}

/// @nodoc
class __$$GoogleAuthRequestModelImplCopyWithImpl<$Res>
    extends _$GoogleAuthRequestModelCopyWithImpl<$Res,
        _$GoogleAuthRequestModelImpl>
    implements _$$GoogleAuthRequestModelImplCopyWith<$Res> {
  __$$GoogleAuthRequestModelImplCopyWithImpl(
      _$GoogleAuthRequestModelImpl _value,
      $Res Function(_$GoogleAuthRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? source = freezed,
    Object? version = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_$GoogleAuthRequestModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoogleAuthRequestModelImpl implements _GoogleAuthRequestModel {
  const _$GoogleAuthRequestModelImpl(
      {required this.email,
      required this.name,
      required this.source,
      required this.version,
      required this.deviceId});

  factory _$GoogleAuthRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoogleAuthRequestModelImplFromJson(json);

  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? source;
  @override
  final String? version;
  @override
  final String? deviceId;

  @override
  String toString() {
    return 'GoogleAuthRequestModel(email: $email, name: $name, source: $source, version: $version, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleAuthRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, source, version, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleAuthRequestModelImplCopyWith<_$GoogleAuthRequestModelImpl>
      get copyWith => __$$GoogleAuthRequestModelImplCopyWithImpl<
          _$GoogleAuthRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoogleAuthRequestModelImplToJson(
      this,
    );
  }
}

abstract class _GoogleAuthRequestModel implements GoogleAuthRequestModel {
  const factory _GoogleAuthRequestModel(
      {required final String? email,
      required final String? name,
      required final String? source,
      required final String? version,
      required final String? deviceId}) = _$GoogleAuthRequestModelImpl;

  factory _GoogleAuthRequestModel.fromJson(Map<String, dynamic> json) =
      _$GoogleAuthRequestModelImpl.fromJson;

  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get source;
  @override
  String? get version;
  @override
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$GoogleAuthRequestModelImplCopyWith<_$GoogleAuthRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RegisterUserRequestModel _$RegisterUserRequestModelFromJson(
    Map<String, dynamic> json) {
  return _RegisterUserRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserRequestModel {
  bool? get registerByMobile => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterUserRequestModelCopyWith<RegisterUserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserRequestModelCopyWith<$Res> {
  factory $RegisterUserRequestModelCopyWith(RegisterUserRequestModel value,
          $Res Function(RegisterUserRequestModel) then) =
      _$RegisterUserRequestModelCopyWithImpl<$Res, RegisterUserRequestModel>;
  @useResult
  $Res call(
      {bool? registerByMobile,
      String? image,
      String? mobile,
      String? name,
      String? email,
      String? dob,
      String? gender});
}

/// @nodoc
class _$RegisterUserRequestModelCopyWithImpl<$Res,
        $Val extends RegisterUserRequestModel>
    implements $RegisterUserRequestModelCopyWith<$Res> {
  _$RegisterUserRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerByMobile = freezed,
    Object? image = freezed,
    Object? mobile = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      registerByMobile: freezed == registerByMobile
          ? _value.registerByMobile
          : registerByMobile // ignore: cast_nullable_to_non_nullable
              as bool?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterUserRequestModelImplCopyWith<$Res>
    implements $RegisterUserRequestModelCopyWith<$Res> {
  factory _$$RegisterUserRequestModelImplCopyWith(
          _$RegisterUserRequestModelImpl value,
          $Res Function(_$RegisterUserRequestModelImpl) then) =
      __$$RegisterUserRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? registerByMobile,
      String? image,
      String? mobile,
      String? name,
      String? email,
      String? dob,
      String? gender});
}

/// @nodoc
class __$$RegisterUserRequestModelImplCopyWithImpl<$Res>
    extends _$RegisterUserRequestModelCopyWithImpl<$Res,
        _$RegisterUserRequestModelImpl>
    implements _$$RegisterUserRequestModelImplCopyWith<$Res> {
  __$$RegisterUserRequestModelImplCopyWithImpl(
      _$RegisterUserRequestModelImpl _value,
      $Res Function(_$RegisterUserRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerByMobile = freezed,
    Object? image = freezed,
    Object? mobile = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$RegisterUserRequestModelImpl(
      registerByMobile: freezed == registerByMobile
          ? _value.registerByMobile
          : registerByMobile // ignore: cast_nullable_to_non_nullable
              as bool?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterUserRequestModelImpl implements _RegisterUserRequestModel {
  const _$RegisterUserRequestModelImpl(
      {this.registerByMobile,
      this.image,
      this.mobile,
      this.name,
      this.email,
      this.dob,
      this.gender});

  factory _$RegisterUserRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterUserRequestModelImplFromJson(json);

  @override
  final bool? registerByMobile;
  @override
  final String? image;
  @override
  final String? mobile;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? dob;
  @override
  final String? gender;

  @override
  String toString() {
    return 'RegisterUserRequestModel(registerByMobile: $registerByMobile, image: $image, mobile: $mobile, name: $name, email: $email, dob: $dob, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserRequestModelImpl &&
            (identical(other.registerByMobile, registerByMobile) ||
                other.registerByMobile == registerByMobile) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, registerByMobile, image, mobile, name, email, dob, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserRequestModelImplCopyWith<_$RegisterUserRequestModelImpl>
      get copyWith => __$$RegisterUserRequestModelImplCopyWithImpl<
          _$RegisterUserRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterUserRequestModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterUserRequestModel implements RegisterUserRequestModel {
  const factory _RegisterUserRequestModel(
      {final bool? registerByMobile,
      final String? image,
      final String? mobile,
      final String? name,
      final String? email,
      final String? dob,
      final String? gender}) = _$RegisterUserRequestModelImpl;

  factory _RegisterUserRequestModel.fromJson(Map<String, dynamic> json) =
      _$RegisterUserRequestModelImpl.fromJson;

  @override
  bool? get registerByMobile;
  @override
  String? get image;
  @override
  String? get mobile;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get dob;
  @override
  String? get gender;
  @override
  @JsonKey(ignore: true)
  _$$RegisterUserRequestModelImplCopyWith<_$RegisterUserRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  String? get address1 => throw _privateConstructorUsedError;
  String? get address2 => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get landMark => throw _privateConstructorUsedError;
  int? get pinCode => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
      {String? address1,
      String? address2,
      String? city,
      String? state,
      String? landMark,
      int? pinCode,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? landMark = freezed,
    Object? pinCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      landMark: freezed == landMark
          ? _value.landMark
          : landMark // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? address1,
      String? address2,
      String? city,
      String? state,
      String? landMark,
      int? pinCode,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? landMark = freezed,
    Object? pinCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$LocationModelImpl(
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      landMark: freezed == landMark
          ? _value.landMark
          : landMark // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl implements _LocationModel {
  const _$LocationModelImpl(
      {this.address1,
      this.address2,
      this.city,
      this.state,
      this.landMark,
      this.pinCode,
      this.latitude,
      this.longitude});

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final String? address1;
  @override
  final String? address2;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? landMark;
  @override
  final int? pinCode;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'LocationModel(address1: $address1, address2: $address2, city: $city, state: $state, landMark: $landMark, pinCode: $pinCode, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.landMark, landMark) ||
                other.landMark == landMark) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address1, address2, city, state,
      landMark, pinCode, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {final String? address1,
      final String? address2,
      final String? city,
      final String? state,
      final String? landMark,
      final int? pinCode,
      final double? latitude,
      final double? longitude}) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  String? get address1;
  @override
  String? get address2;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get landMark;
  @override
  int? get pinCode;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
