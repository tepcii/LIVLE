// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$OriginUserTearOff {
  const _$OriginUserTearOff();

// ignore: unused_element
  _OriginUser call(
      {@required String id,
      @required String name,
      @required String description,
      @required String iconImagePath,
      @required bool pickedImage}) {
    return _OriginUser(
      id: id,
      name: name,
      description: description,
      iconImagePath: iconImagePath,
      pickedImage: pickedImage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $OriginUser = _$OriginUserTearOff();

/// @nodoc
mixin _$OriginUser {
  String get id;
  String get name;
  String get description;
  String get iconImagePath;
  bool get pickedImage;

  $OriginUserCopyWith<OriginUser> get copyWith;
}

/// @nodoc
abstract class $OriginUserCopyWith<$Res> {
  factory $OriginUserCopyWith(
          OriginUser value, $Res Function(OriginUser) then) =
      _$OriginUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String description,
      String iconImagePath,
      bool pickedImage});
}

/// @nodoc
class _$OriginUserCopyWithImpl<$Res> implements $OriginUserCopyWith<$Res> {
  _$OriginUserCopyWithImpl(this._value, this._then);

  final OriginUser _value;
  // ignore: unused_field
  final $Res Function(OriginUser) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object iconImagePath = freezed,
    Object pickedImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      iconImagePath: iconImagePath == freezed
          ? _value.iconImagePath
          : iconImagePath as String,
      pickedImage:
          pickedImage == freezed ? _value.pickedImage : pickedImage as bool,
    ));
  }
}

/// @nodoc
abstract class _$OriginUserCopyWith<$Res> implements $OriginUserCopyWith<$Res> {
  factory _$OriginUserCopyWith(
          _OriginUser value, $Res Function(_OriginUser) then) =
      __$OriginUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String description,
      String iconImagePath,
      bool pickedImage});
}

/// @nodoc
class __$OriginUserCopyWithImpl<$Res> extends _$OriginUserCopyWithImpl<$Res>
    implements _$OriginUserCopyWith<$Res> {
  __$OriginUserCopyWithImpl(
      _OriginUser _value, $Res Function(_OriginUser) _then)
      : super(_value, (v) => _then(v as _OriginUser));

  @override
  _OriginUser get _value => super._value as _OriginUser;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object iconImagePath = freezed,
    Object pickedImage = freezed,
  }) {
    return _then(_OriginUser(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      iconImagePath: iconImagePath == freezed
          ? _value.iconImagePath
          : iconImagePath as String,
      pickedImage:
          pickedImage == freezed ? _value.pickedImage : pickedImage as bool,
    ));
  }
}

/// @nodoc
class _$_OriginUser with DiagnosticableTreeMixin implements _OriginUser {
  const _$_OriginUser(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.iconImagePath,
      @required this.pickedImage})
      : assert(id != null),
        assert(name != null),
        assert(description != null),
        assert(iconImagePath != null),
        assert(pickedImage != null);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String iconImagePath;
  @override
  final bool pickedImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OriginUser(id: $id, name: $name, description: $description, iconImagePath: $iconImagePath, pickedImage: $pickedImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OriginUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('iconImagePath', iconImagePath))
      ..add(DiagnosticsProperty('pickedImage', pickedImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OriginUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.iconImagePath, iconImagePath) ||
                const DeepCollectionEquality()
                    .equals(other.iconImagePath, iconImagePath)) &&
            (identical(other.pickedImage, pickedImage) ||
                const DeepCollectionEquality()
                    .equals(other.pickedImage, pickedImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(iconImagePath) ^
      const DeepCollectionEquality().hash(pickedImage);

  @override
  _$OriginUserCopyWith<_OriginUser> get copyWith =>
      __$OriginUserCopyWithImpl<_OriginUser>(this, _$identity);
}

abstract class _OriginUser implements OriginUser {
  const factory _OriginUser(
      {@required String id,
      @required String name,
      @required String description,
      @required String iconImagePath,
      @required bool pickedImage}) = _$_OriginUser;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get iconImagePath;
  @override
  bool get pickedImage;
  @override
  _$OriginUserCopyWith<_OriginUser> get copyWith;
}
