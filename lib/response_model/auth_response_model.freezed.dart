// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateVersionResponseModel _$ValidateVersionResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ValidateVersionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ValidateVersionResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ValidateDataModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateVersionResponseModelCopyWith<ValidateVersionResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateVersionResponseModelCopyWith<$Res> {
  factory $ValidateVersionResponseModelCopyWith(
          ValidateVersionResponseModel value,
          $Res Function(ValidateVersionResponseModel) then) =
      _$ValidateVersionResponseModelCopyWithImpl<$Res,
          ValidateVersionResponseModel>;
  @useResult
  $Res call({int? status, String? message, ValidateDataModel? data});

  $ValidateDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ValidateVersionResponseModelCopyWithImpl<$Res,
        $Val extends ValidateVersionResponseModel>
    implements $ValidateVersionResponseModelCopyWith<$Res> {
  _$ValidateVersionResponseModelCopyWithImpl(this._value, this._then);

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
              as ValidateDataModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidateDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ValidateDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ValidateVersionResponseModelImplCopyWith<$Res>
    implements $ValidateVersionResponseModelCopyWith<$Res> {
  factory _$$ValidateVersionResponseModelImplCopyWith(
          _$ValidateVersionResponseModelImpl value,
          $Res Function(_$ValidateVersionResponseModelImpl) then) =
      __$$ValidateVersionResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, ValidateDataModel? data});

  @override
  $ValidateDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ValidateVersionResponseModelImplCopyWithImpl<$Res>
    extends _$ValidateVersionResponseModelCopyWithImpl<$Res,
        _$ValidateVersionResponseModelImpl>
    implements _$$ValidateVersionResponseModelImplCopyWith<$Res> {
  __$$ValidateVersionResponseModelImplCopyWithImpl(
      _$ValidateVersionResponseModelImpl _value,
      $Res Function(_$ValidateVersionResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ValidateVersionResponseModelImpl(
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
              as ValidateDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateVersionResponseModelImpl
    implements _ValidateVersionResponseModel {
  const _$ValidateVersionResponseModelImpl(
      {this.status, this.message, this.data});

  factory _$ValidateVersionResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ValidateVersionResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final ValidateDataModel? data;

  @override
  String toString() {
    return 'ValidateVersionResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateVersionResponseModelImpl &&
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
  _$$ValidateVersionResponseModelImplCopyWith<
          _$ValidateVersionResponseModelImpl>
      get copyWith => __$$ValidateVersionResponseModelImplCopyWithImpl<
          _$ValidateVersionResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateVersionResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ValidateVersionResponseModel
    implements ValidateVersionResponseModel {
  const factory _ValidateVersionResponseModel(
      {final int? status,
      final String? message,
      final ValidateDataModel? data}) = _$ValidateVersionResponseModelImpl;

  factory _ValidateVersionResponseModel.fromJson(Map<String, dynamic> json) =
      _$ValidateVersionResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  ValidateDataModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$ValidateVersionResponseModelImplCopyWith<
          _$ValidateVersionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ValidateDataModel _$ValidateDataModelFromJson(Map<String, dynamic> json) {
  return _ValidateDataModel.fromJson(json);
}

/// @nodoc
mixin _$ValidateDataModel {
  bool? get validVersion => throw _privateConstructorUsedError;
  bool? get userBlocked => throw _privateConstructorUsedError;
  UserModel? get userData => throw _privateConstructorUsedError;
  List<String>? get banners => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateDataModelCopyWith<ValidateDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateDataModelCopyWith<$Res> {
  factory $ValidateDataModelCopyWith(
          ValidateDataModel value, $Res Function(ValidateDataModel) then) =
      _$ValidateDataModelCopyWithImpl<$Res, ValidateDataModel>;
  @useResult
  $Res call(
      {bool? validVersion,
      bool? userBlocked,
      UserModel? userData,
      List<String>? banners});

  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class _$ValidateDataModelCopyWithImpl<$Res, $Val extends ValidateDataModel>
    implements $ValidateDataModelCopyWith<$Res> {
  _$ValidateDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validVersion = freezed,
    Object? userBlocked = freezed,
    Object? userData = freezed,
    Object? banners = freezed,
  }) {
    return _then(_value.copyWith(
      validVersion: freezed == validVersion
          ? _value.validVersion
          : validVersion // ignore: cast_nullable_to_non_nullable
              as bool?,
      userBlocked: freezed == userBlocked
          ? _value.userBlocked
          : userBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      banners: freezed == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ValidateDataModelImplCopyWith<$Res>
    implements $ValidateDataModelCopyWith<$Res> {
  factory _$$ValidateDataModelImplCopyWith(_$ValidateDataModelImpl value,
          $Res Function(_$ValidateDataModelImpl) then) =
      __$$ValidateDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? validVersion,
      bool? userBlocked,
      UserModel? userData,
      List<String>? banners});

  @override
  $UserModelCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$ValidateDataModelImplCopyWithImpl<$Res>
    extends _$ValidateDataModelCopyWithImpl<$Res, _$ValidateDataModelImpl>
    implements _$$ValidateDataModelImplCopyWith<$Res> {
  __$$ValidateDataModelImplCopyWithImpl(_$ValidateDataModelImpl _value,
      $Res Function(_$ValidateDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validVersion = freezed,
    Object? userBlocked = freezed,
    Object? userData = freezed,
    Object? banners = freezed,
  }) {
    return _then(_$ValidateDataModelImpl(
      validVersion: freezed == validVersion
          ? _value.validVersion
          : validVersion // ignore: cast_nullable_to_non_nullable
              as bool?,
      userBlocked: freezed == userBlocked
          ? _value.userBlocked
          : userBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      banners: freezed == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateDataModelImpl implements _ValidateDataModel {
  const _$ValidateDataModelImpl(
      {this.validVersion,
      this.userBlocked,
      this.userData,
      final List<String>? banners})
      : _banners = banners;

  factory _$ValidateDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidateDataModelImplFromJson(json);

  @override
  final bool? validVersion;
  @override
  final bool? userBlocked;
  @override
  final UserModel? userData;
  final List<String>? _banners;
  @override
  List<String>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ValidateDataModel(validVersion: $validVersion, userBlocked: $userBlocked, userData: $userData, banners: $banners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateDataModelImpl &&
            (identical(other.validVersion, validVersion) ||
                other.validVersion == validVersion) &&
            (identical(other.userBlocked, userBlocked) ||
                other.userBlocked == userBlocked) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, validVersion, userBlocked,
      userData, const DeepCollectionEquality().hash(_banners));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateDataModelImplCopyWith<_$ValidateDataModelImpl> get copyWith =>
      __$$ValidateDataModelImplCopyWithImpl<_$ValidateDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateDataModelImplToJson(
      this,
    );
  }
}

abstract class _ValidateDataModel implements ValidateDataModel {
  const factory _ValidateDataModel(
      {final bool? validVersion,
      final bool? userBlocked,
      final UserModel? userData,
      final List<String>? banners}) = _$ValidateDataModelImpl;

  factory _ValidateDataModel.fromJson(Map<String, dynamic> json) =
      _$ValidateDataModelImpl.fromJson;

  @override
  bool? get validVersion;
  @override
  bool? get userBlocked;
  @override
  UserModel? get userData;
  @override
  List<String>? get banners;
  @override
  @JsonKey(ignore: true)
  _$$ValidateDataModelImplCopyWith<_$ValidateDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrimaryResponseModel _$PrimaryResponseModelFromJson(Map<String, dynamic> json) {
  return _PrimaryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PrimaryResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrimaryResponseModelCopyWith<PrimaryResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimaryResponseModelCopyWith<$Res> {
  factory $PrimaryResponseModelCopyWith(PrimaryResponseModel value,
          $Res Function(PrimaryResponseModel) then) =
      _$PrimaryResponseModelCopyWithImpl<$Res, PrimaryResponseModel>;
  @useResult
  $Res call({int? status, String? message});
}

/// @nodoc
class _$PrimaryResponseModelCopyWithImpl<$Res,
        $Val extends PrimaryResponseModel>
    implements $PrimaryResponseModelCopyWith<$Res> {
  _$PrimaryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrimaryResponseModelImplCopyWith<$Res>
    implements $PrimaryResponseModelCopyWith<$Res> {
  factory _$$PrimaryResponseModelImplCopyWith(_$PrimaryResponseModelImpl value,
          $Res Function(_$PrimaryResponseModelImpl) then) =
      __$$PrimaryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message});
}

/// @nodoc
class __$$PrimaryResponseModelImplCopyWithImpl<$Res>
    extends _$PrimaryResponseModelCopyWithImpl<$Res, _$PrimaryResponseModelImpl>
    implements _$$PrimaryResponseModelImplCopyWith<$Res> {
  __$$PrimaryResponseModelImplCopyWithImpl(_$PrimaryResponseModelImpl _value,
      $Res Function(_$PrimaryResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PrimaryResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrimaryResponseModelImpl implements _PrimaryResponseModel {
  const _$PrimaryResponseModelImpl({this.status, this.message});

  factory _$PrimaryResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrimaryResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'PrimaryResponseModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrimaryResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrimaryResponseModelImplCopyWith<_$PrimaryResponseModelImpl>
      get copyWith =>
          __$$PrimaryResponseModelImplCopyWithImpl<_$PrimaryResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrimaryResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PrimaryResponseModel implements PrimaryResponseModel {
  const factory _PrimaryResponseModel(
      {final int? status, final String? message}) = _$PrimaryResponseModelImpl;

  factory _PrimaryResponseModel.fromJson(Map<String, dynamic> json) =
      _$PrimaryResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PrimaryResponseModelImplCopyWith<_$PrimaryResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerifyOtpResponseModel _$VerifyOtpResponseModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpResponseModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  VerifyOtpDataModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpResponseModelCopyWith<VerifyOtpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpResponseModelCopyWith<$Res> {
  factory $VerifyOtpResponseModelCopyWith(VerifyOtpResponseModel value,
          $Res Function(VerifyOtpResponseModel) then) =
      _$VerifyOtpResponseModelCopyWithImpl<$Res, VerifyOtpResponseModel>;
  @useResult
  $Res call({int? status, String? message, VerifyOtpDataModel? data});

  $VerifyOtpDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$VerifyOtpResponseModelCopyWithImpl<$Res,
        $Val extends VerifyOtpResponseModel>
    implements $VerifyOtpResponseModelCopyWith<$Res> {
  _$VerifyOtpResponseModelCopyWithImpl(this._value, this._then);

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
              as VerifyOtpDataModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerifyOtpDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VerifyOtpDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyOtpResponseModelImplCopyWith<$Res>
    implements $VerifyOtpResponseModelCopyWith<$Res> {
  factory _$$VerifyOtpResponseModelImplCopyWith(
          _$VerifyOtpResponseModelImpl value,
          $Res Function(_$VerifyOtpResponseModelImpl) then) =
      __$$VerifyOtpResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, VerifyOtpDataModel? data});

  @override
  $VerifyOtpDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$VerifyOtpResponseModelImplCopyWithImpl<$Res>
    extends _$VerifyOtpResponseModelCopyWithImpl<$Res,
        _$VerifyOtpResponseModelImpl>
    implements _$$VerifyOtpResponseModelImplCopyWith<$Res> {
  __$$VerifyOtpResponseModelImplCopyWithImpl(
      _$VerifyOtpResponseModelImpl _value,
      $Res Function(_$VerifyOtpResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$VerifyOtpResponseModelImpl(
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
              as VerifyOtpDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpResponseModelImpl implements _VerifyOtpResponseModel {
  const _$VerifyOtpResponseModelImpl({this.status, this.message, this.data});

  factory _$VerifyOtpResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final VerifyOtpDataModel? data;

  @override
  String toString() {
    return 'VerifyOtpResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpResponseModelImpl &&
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
  _$$VerifyOtpResponseModelImplCopyWith<_$VerifyOtpResponseModelImpl>
      get copyWith => __$$VerifyOtpResponseModelImplCopyWithImpl<
          _$VerifyOtpResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpResponseModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpResponseModel implements VerifyOtpResponseModel {
  const factory _VerifyOtpResponseModel(
      {final int? status,
      final String? message,
      final VerifyOtpDataModel? data}) = _$VerifyOtpResponseModelImpl;

  factory _VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  VerifyOtpDataModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpResponseModelImplCopyWith<_$VerifyOtpResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerifyOtpDataModel _$VerifyOtpDataModelFromJson(Map<String, dynamic> json) {
  return _VerifyOtpDataModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpDataModel {
  bool? get registerUser => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpDataModelCopyWith<VerifyOtpDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpDataModelCopyWith<$Res> {
  factory $VerifyOtpDataModelCopyWith(
          VerifyOtpDataModel value, $Res Function(VerifyOtpDataModel) then) =
      _$VerifyOtpDataModelCopyWithImpl<$Res, VerifyOtpDataModel>;
  @useResult
  $Res call({bool? registerUser, String? token});
}

/// @nodoc
class _$VerifyOtpDataModelCopyWithImpl<$Res, $Val extends VerifyOtpDataModel>
    implements $VerifyOtpDataModelCopyWith<$Res> {
  _$VerifyOtpDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerUser = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      registerUser: freezed == registerUser
          ? _value.registerUser
          : registerUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpDataModelImplCopyWith<$Res>
    implements $VerifyOtpDataModelCopyWith<$Res> {
  factory _$$VerifyOtpDataModelImplCopyWith(_$VerifyOtpDataModelImpl value,
          $Res Function(_$VerifyOtpDataModelImpl) then) =
      __$$VerifyOtpDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? registerUser, String? token});
}

/// @nodoc
class __$$VerifyOtpDataModelImplCopyWithImpl<$Res>
    extends _$VerifyOtpDataModelCopyWithImpl<$Res, _$VerifyOtpDataModelImpl>
    implements _$$VerifyOtpDataModelImplCopyWith<$Res> {
  __$$VerifyOtpDataModelImplCopyWithImpl(_$VerifyOtpDataModelImpl _value,
      $Res Function(_$VerifyOtpDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerUser = freezed,
    Object? token = freezed,
  }) {
    return _then(_$VerifyOtpDataModelImpl(
      registerUser: freezed == registerUser
          ? _value.registerUser
          : registerUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpDataModelImpl implements _VerifyOtpDataModel {
  const _$VerifyOtpDataModelImpl({this.registerUser, this.token});

  factory _$VerifyOtpDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpDataModelImplFromJson(json);

  @override
  final bool? registerUser;
  @override
  final String? token;

  @override
  String toString() {
    return 'VerifyOtpDataModel(registerUser: $registerUser, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpDataModelImpl &&
            (identical(other.registerUser, registerUser) ||
                other.registerUser == registerUser) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, registerUser, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpDataModelImplCopyWith<_$VerifyOtpDataModelImpl> get copyWith =>
      __$$VerifyOtpDataModelImplCopyWithImpl<_$VerifyOtpDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpDataModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpDataModel implements VerifyOtpDataModel {
  const factory _VerifyOtpDataModel(
      {final bool? registerUser,
      final String? token}) = _$VerifyOtpDataModelImpl;

  factory _VerifyOtpDataModel.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpDataModelImpl.fromJson;

  @override
  bool? get registerUser;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpDataModelImplCopyWith<_$VerifyOtpDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadFileResponseModel _$UploadFileResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UploadFileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UploadFileResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadFileResponseModelCopyWith<UploadFileResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileResponseModelCopyWith<$Res> {
  factory $UploadFileResponseModelCopyWith(UploadFileResponseModel value,
          $Res Function(UploadFileResponseModel) then) =
      _$UploadFileResponseModelCopyWithImpl<$Res, UploadFileResponseModel>;
  @useResult
  $Res call({int? status, String? message, String? data});
}

/// @nodoc
class _$UploadFileResponseModelCopyWithImpl<$Res,
        $Val extends UploadFileResponseModel>
    implements $UploadFileResponseModelCopyWith<$Res> {
  _$UploadFileResponseModelCopyWithImpl(this._value, this._then);

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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadFileResponseModelImplCopyWith<$Res>
    implements $UploadFileResponseModelCopyWith<$Res> {
  factory _$$UploadFileResponseModelImplCopyWith(
          _$UploadFileResponseModelImpl value,
          $Res Function(_$UploadFileResponseModelImpl) then) =
      __$$UploadFileResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, String? data});
}

/// @nodoc
class __$$UploadFileResponseModelImplCopyWithImpl<$Res>
    extends _$UploadFileResponseModelCopyWithImpl<$Res,
        _$UploadFileResponseModelImpl>
    implements _$$UploadFileResponseModelImplCopyWith<$Res> {
  __$$UploadFileResponseModelImplCopyWithImpl(
      _$UploadFileResponseModelImpl _value,
      $Res Function(_$UploadFileResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UploadFileResponseModelImpl(
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFileResponseModelImpl implements _UploadFileResponseModel {
  const _$UploadFileResponseModelImpl({this.status, this.message, this.data});

  factory _$UploadFileResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFileResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final String? data;

  @override
  String toString() {
    return 'UploadFileResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFileResponseModelImpl &&
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
  _$$UploadFileResponseModelImplCopyWith<_$UploadFileResponseModelImpl>
      get copyWith => __$$UploadFileResponseModelImplCopyWithImpl<
          _$UploadFileResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFileResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UploadFileResponseModel implements UploadFileResponseModel {
  const factory _UploadFileResponseModel(
      {final int? status,
      final String? message,
      final String? data}) = _$UploadFileResponseModelImpl;

  factory _UploadFileResponseModel.fromJson(Map<String, dynamic> json) =
      _$UploadFileResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$UploadFileResponseModelImplCopyWith<_$UploadFileResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FetchUserDetailsResponseModel _$FetchUserDetailsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FetchUserDetailsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FetchUserDetailsResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchUserDetailsResponseModelCopyWith<FetchUserDetailsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchUserDetailsResponseModelCopyWith<$Res> {
  factory $FetchUserDetailsResponseModelCopyWith(
          FetchUserDetailsResponseModel value,
          $Res Function(FetchUserDetailsResponseModel) then) =
      _$FetchUserDetailsResponseModelCopyWithImpl<$Res,
          FetchUserDetailsResponseModel>;
  @useResult
  $Res call({int? status, String? message, UserModel? data});

  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$FetchUserDetailsResponseModelCopyWithImpl<$Res,
        $Val extends FetchUserDetailsResponseModel>
    implements $FetchUserDetailsResponseModelCopyWith<$Res> {
  _$FetchUserDetailsResponseModelCopyWithImpl(this._value, this._then);

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
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FetchUserDetailsResponseModelImplCopyWith<$Res>
    implements $FetchUserDetailsResponseModelCopyWith<$Res> {
  factory _$$FetchUserDetailsResponseModelImplCopyWith(
          _$FetchUserDetailsResponseModelImpl value,
          $Res Function(_$FetchUserDetailsResponseModelImpl) then) =
      __$$FetchUserDetailsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, UserModel? data});

  @override
  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$FetchUserDetailsResponseModelImplCopyWithImpl<$Res>
    extends _$FetchUserDetailsResponseModelCopyWithImpl<$Res,
        _$FetchUserDetailsResponseModelImpl>
    implements _$$FetchUserDetailsResponseModelImplCopyWith<$Res> {
  __$$FetchUserDetailsResponseModelImplCopyWithImpl(
      _$FetchUserDetailsResponseModelImpl _value,
      $Res Function(_$FetchUserDetailsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FetchUserDetailsResponseModelImpl(
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
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchUserDetailsResponseModelImpl
    implements _FetchUserDetailsResponseModel {
  const _$FetchUserDetailsResponseModelImpl(
      {this.status, this.message, this.data});

  factory _$FetchUserDetailsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FetchUserDetailsResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final UserModel? data;

  @override
  String toString() {
    return 'FetchUserDetailsResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserDetailsResponseModelImpl &&
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
  _$$FetchUserDetailsResponseModelImplCopyWith<
          _$FetchUserDetailsResponseModelImpl>
      get copyWith => __$$FetchUserDetailsResponseModelImplCopyWithImpl<
          _$FetchUserDetailsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchUserDetailsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FetchUserDetailsResponseModel
    implements FetchUserDetailsResponseModel {
  const factory _FetchUserDetailsResponseModel(
      {final int? status,
      final String? message,
      final UserModel? data}) = _$FetchUserDetailsResponseModelImpl;

  factory _FetchUserDetailsResponseModel.fromJson(Map<String, dynamic> json) =
      _$FetchUserDetailsResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  UserModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$FetchUserDetailsResponseModelImplCopyWith<
          _$FetchUserDetailsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get mobile => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  int? get otp => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  bool? get blocked => throw _privateConstructorUsedError;
  dynamic get favouriteHostels => throw _privateConstructorUsedError;
  dynamic get onGoingBookings => throw _privateConstructorUsedError;
  dynamic get upComingBookings => throw _privateConstructorUsedError;
  LocationModel? get address => throw _privateConstructorUsedError;
  List<DocumentDataModel>? get kycDocuments =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? image,
      int? mobile,
      String? name,
      String? email,
      String? gender,
      String? dob,
      String? profilePic,
      int? otp,
      String? source,
      String? version,
      String? deviceId,
      bool? blocked,
      dynamic favouriteHostels,
      dynamic onGoingBookings,
      dynamic upComingBookings,
      LocationModel? address,
      List<DocumentDataModel>? kycDocuments});

  $LocationModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? mobile = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? profilePic = freezed,
    Object? otp = freezed,
    Object? source = freezed,
    Object? version = freezed,
    Object? deviceId = freezed,
    Object? blocked = freezed,
    Object? favouriteHostels = freezed,
    Object? onGoingBookings = freezed,
    Object? upComingBookings = freezed,
    Object? address = freezed,
    Object? kycDocuments = freezed,
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
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
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
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      favouriteHostels: freezed == favouriteHostels
          ? _value.favouriteHostels
          : favouriteHostels // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onGoingBookings: freezed == onGoingBookings
          ? _value.onGoingBookings
          : onGoingBookings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      upComingBookings: freezed == upComingBookings
          ? _value.upComingBookings
          : upComingBookings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      kycDocuments: freezed == kycDocuments
          ? _value.kycDocuments
          : kycDocuments // ignore: cast_nullable_to_non_nullable
              as List<DocumentDataModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? image,
      int? mobile,
      String? name,
      String? email,
      String? gender,
      String? dob,
      String? profilePic,
      int? otp,
      String? source,
      String? version,
      String? deviceId,
      bool? blocked,
      dynamic favouriteHostels,
      dynamic onGoingBookings,
      dynamic upComingBookings,
      LocationModel? address,
      List<DocumentDataModel>? kycDocuments});

  @override
  $LocationModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? mobile = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? profilePic = freezed,
    Object? otp = freezed,
    Object? source = freezed,
    Object? version = freezed,
    Object? deviceId = freezed,
    Object? blocked = freezed,
    Object? favouriteHostels = freezed,
    Object? onGoingBookings = freezed,
    Object? upComingBookings = freezed,
    Object? address = freezed,
    Object? kycDocuments = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
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
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      favouriteHostels: freezed == favouriteHostels
          ? _value.favouriteHostels
          : favouriteHostels // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onGoingBookings: freezed == onGoingBookings
          ? _value.onGoingBookings
          : onGoingBookings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      upComingBookings: freezed == upComingBookings
          ? _value.upComingBookings
          : upComingBookings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      kycDocuments: freezed == kycDocuments
          ? _value._kycDocuments
          : kycDocuments // ignore: cast_nullable_to_non_nullable
              as List<DocumentDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.image,
      this.mobile,
      this.name,
      this.email,
      this.gender,
      this.dob,
      this.profilePic,
      this.otp,
      this.source,
      this.version,
      this.deviceId,
      this.blocked,
      this.favouriteHostels,
      this.onGoingBookings,
      this.upComingBookings,
      this.address,
      final List<DocumentDataModel>? kycDocuments})
      : _kycDocuments = kycDocuments;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? image;
  @override
  final int? mobile;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final String? dob;
  @override
  final String? profilePic;
  @override
  final int? otp;
  @override
  final String? source;
  @override
  final String? version;
  @override
  final String? deviceId;
  @override
  final bool? blocked;
  @override
  final dynamic favouriteHostels;
  @override
  final dynamic onGoingBookings;
  @override
  final dynamic upComingBookings;
  @override
  final LocationModel? address;
  final List<DocumentDataModel>? _kycDocuments;
  @override
  List<DocumentDataModel>? get kycDocuments {
    final value = _kycDocuments;
    if (value == null) return null;
    if (_kycDocuments is EqualUnmodifiableListView) return _kycDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, image: $image, mobile: $mobile, name: $name, email: $email, gender: $gender, dob: $dob, profilePic: $profilePic, otp: $otp, source: $source, version: $version, deviceId: $deviceId, blocked: $blocked, favouriteHostels: $favouriteHostels, onGoingBookings: $onGoingBookings, upComingBookings: $upComingBookings, address: $address, kycDocuments: $kycDocuments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            const DeepCollectionEquality()
                .equals(other.favouriteHostels, favouriteHostels) &&
            const DeepCollectionEquality()
                .equals(other.onGoingBookings, onGoingBookings) &&
            const DeepCollectionEquality()
                .equals(other.upComingBookings, upComingBookings) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._kycDocuments, _kycDocuments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      image,
      mobile,
      name,
      email,
      gender,
      dob,
      profilePic,
      otp,
      source,
      version,
      deviceId,
      blocked,
      const DeepCollectionEquality().hash(favouriteHostels),
      const DeepCollectionEquality().hash(onGoingBookings),
      const DeepCollectionEquality().hash(upComingBookings),
      address,
      const DeepCollectionEquality().hash(_kycDocuments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: '_id') final String? id,
      final String? image,
      final int? mobile,
      final String? name,
      final String? email,
      final String? gender,
      final String? dob,
      final String? profilePic,
      final int? otp,
      final String? source,
      final String? version,
      final String? deviceId,
      final bool? blocked,
      final dynamic favouriteHostels,
      final dynamic onGoingBookings,
      final dynamic upComingBookings,
      final LocationModel? address,
      final List<DocumentDataModel>? kycDocuments}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get image;
  @override
  int? get mobile;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get gender;
  @override
  String? get dob;
  @override
  String? get profilePic;
  @override
  int? get otp;
  @override
  String? get source;
  @override
  String? get version;
  @override
  String? get deviceId;
  @override
  bool? get blocked;
  @override
  dynamic get favouriteHostels;
  @override
  dynamic get onGoingBookings;
  @override
  dynamic get upComingBookings;
  @override
  LocationModel? get address;
  @override
  List<DocumentDataModel>? get kycDocuments;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentDataModel _$DocumentDataModelFromJson(Map<String, dynamic> json) {
  return _DocumentDataModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentDataModel {
  String? get documentType => throw _privateConstructorUsedError;
  String? get documentStatus => throw _privateConstructorUsedError;
  String? get uploadedUrl => throw _privateConstructorUsedError;
  String? get errorTxt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentDataModelCopyWith<DocumentDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDataModelCopyWith<$Res> {
  factory $DocumentDataModelCopyWith(
          DocumentDataModel value, $Res Function(DocumentDataModel) then) =
      _$DocumentDataModelCopyWithImpl<$Res, DocumentDataModel>;
  @useResult
  $Res call(
      {String? documentType,
      String? documentStatus,
      String? uploadedUrl,
      String? errorTxt});
}

/// @nodoc
class _$DocumentDataModelCopyWithImpl<$Res, $Val extends DocumentDataModel>
    implements $DocumentDataModelCopyWith<$Res> {
  _$DocumentDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = freezed,
    Object? documentStatus = freezed,
    Object? uploadedUrl = freezed,
    Object? errorTxt = freezed,
  }) {
    return _then(_value.copyWith(
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      documentStatus: freezed == documentStatus
          ? _value.documentStatus
          : documentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedUrl: freezed == uploadedUrl
          ? _value.uploadedUrl
          : uploadedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTxt: freezed == errorTxt
          ? _value.errorTxt
          : errorTxt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentDataModelImplCopyWith<$Res>
    implements $DocumentDataModelCopyWith<$Res> {
  factory _$$DocumentDataModelImplCopyWith(_$DocumentDataModelImpl value,
          $Res Function(_$DocumentDataModelImpl) then) =
      __$$DocumentDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? documentType,
      String? documentStatus,
      String? uploadedUrl,
      String? errorTxt});
}

/// @nodoc
class __$$DocumentDataModelImplCopyWithImpl<$Res>
    extends _$DocumentDataModelCopyWithImpl<$Res, _$DocumentDataModelImpl>
    implements _$$DocumentDataModelImplCopyWith<$Res> {
  __$$DocumentDataModelImplCopyWithImpl(_$DocumentDataModelImpl _value,
      $Res Function(_$DocumentDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = freezed,
    Object? documentStatus = freezed,
    Object? uploadedUrl = freezed,
    Object? errorTxt = freezed,
  }) {
    return _then(_$DocumentDataModelImpl(
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      documentStatus: freezed == documentStatus
          ? _value.documentStatus
          : documentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedUrl: freezed == uploadedUrl
          ? _value.uploadedUrl
          : uploadedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorTxt: freezed == errorTxt
          ? _value.errorTxt
          : errorTxt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentDataModelImpl implements _DocumentDataModel {
  const _$DocumentDataModelImpl(
      {required this.documentType,
      required this.documentStatus,
      required this.uploadedUrl,
      required this.errorTxt});

  factory _$DocumentDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentDataModelImplFromJson(json);

  @override
  final String? documentType;
  @override
  final String? documentStatus;
  @override
  final String? uploadedUrl;
  @override
  final String? errorTxt;

  @override
  String toString() {
    return 'DocumentDataModel(documentType: $documentType, documentStatus: $documentStatus, uploadedUrl: $uploadedUrl, errorTxt: $errorTxt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDataModelImpl &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentStatus, documentStatus) ||
                other.documentStatus == documentStatus) &&
            (identical(other.uploadedUrl, uploadedUrl) ||
                other.uploadedUrl == uploadedUrl) &&
            (identical(other.errorTxt, errorTxt) ||
                other.errorTxt == errorTxt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, documentType, documentStatus, uploadedUrl, errorTxt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDataModelImplCopyWith<_$DocumentDataModelImpl> get copyWith =>
      __$$DocumentDataModelImplCopyWithImpl<_$DocumentDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentDataModelImplToJson(
      this,
    );
  }
}

abstract class _DocumentDataModel implements DocumentDataModel {
  const factory _DocumentDataModel(
      {required final String? documentType,
      required final String? documentStatus,
      required final String? uploadedUrl,
      required final String? errorTxt}) = _$DocumentDataModelImpl;

  factory _DocumentDataModel.fromJson(Map<String, dynamic> json) =
      _$DocumentDataModelImpl.fromJson;

  @override
  String? get documentType;
  @override
  String? get documentStatus;
  @override
  String? get uploadedUrl;
  @override
  String? get errorTxt;
  @override
  @JsonKey(ignore: true)
  _$$DocumentDataModelImplCopyWith<_$DocumentDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
