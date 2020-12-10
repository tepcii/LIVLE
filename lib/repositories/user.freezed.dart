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
      {@required IUserDataSource source,
      @required String id,
      @required String name,
      String description = '',
      String iconImagePath = 'images/default_user_icon.png',
      bool pickedImage = false,
      bool isBanned = false,
      bool isOfficial = false}) {
    return _OriginUser(
      source: source,
      id: id,
      name: name,
      description: description,
      iconImagePath: iconImagePath,
      pickedImage: pickedImage,
      isBanned: isBanned,
      isOfficial: isOfficial,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $OriginUser = _$OriginUserTearOff();

/// @nodoc
mixin _$OriginUser {
  IUserDataSource get source;
  String get id;
  String get name;
  String get description;
  String get iconImagePath;
  bool get pickedImage;
  bool get isBanned;
  bool get isOfficial;

  $OriginUserCopyWith<OriginUser> get copyWith;
}

/// @nodoc
abstract class $OriginUserCopyWith<$Res> {
  factory $OriginUserCopyWith(
          OriginUser value, $Res Function(OriginUser) then) =
      _$OriginUserCopyWithImpl<$Res>;
  $Res call(
      {IUserDataSource source,
      String id,
      String name,
      String description,
      String iconImagePath,
      bool pickedImage,
      bool isBanned,
      bool isOfficial});
}

/// @nodoc
class _$OriginUserCopyWithImpl<$Res> implements $OriginUserCopyWith<$Res> {
  _$OriginUserCopyWithImpl(this._value, this._then);

  final OriginUser _value;
  // ignore: unused_field
  final $Res Function(OriginUser) _then;

  @override
  $Res call({
    Object source = freezed,
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object iconImagePath = freezed,
    Object pickedImage = freezed,
    Object isBanned = freezed,
    Object isOfficial = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed ? _value.source : source as IUserDataSource,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      iconImagePath: iconImagePath == freezed
          ? _value.iconImagePath
          : iconImagePath as String,
      pickedImage:
          pickedImage == freezed ? _value.pickedImage : pickedImage as bool,
      isBanned: isBanned == freezed ? _value.isBanned : isBanned as bool,
      isOfficial:
          isOfficial == freezed ? _value.isOfficial : isOfficial as bool,
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
      {IUserDataSource source,
      String id,
      String name,
      String description,
      String iconImagePath,
      bool pickedImage,
      bool isBanned,
      bool isOfficial});
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
    Object source = freezed,
    Object id = freezed,
    Object name = freezed,
    Object description = freezed,
    Object iconImagePath = freezed,
    Object pickedImage = freezed,
    Object isBanned = freezed,
    Object isOfficial = freezed,
  }) {
    return _then(_OriginUser(
      source: source == freezed ? _value.source : source as IUserDataSource,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      iconImagePath: iconImagePath == freezed
          ? _value.iconImagePath
          : iconImagePath as String,
      pickedImage:
          pickedImage == freezed ? _value.pickedImage : pickedImage as bool,
      isBanned: isBanned == freezed ? _value.isBanned : isBanned as bool,
      isOfficial:
          isOfficial == freezed ? _value.isOfficial : isOfficial as bool,
    ));
  }
}

/// @nodoc
class _$_OriginUser with DiagnosticableTreeMixin implements _OriginUser {
  const _$_OriginUser(
      {@required this.source,
      @required this.id,
      @required this.name,
      this.description = '',
      this.iconImagePath = 'images/default_user_icon.png',
      this.pickedImage = false,
      this.isBanned = false,
      this.isOfficial = false})
      : assert(source != null),
        assert(id != null),
        assert(name != null),
        assert(description != null),
        assert(iconImagePath != null),
        assert(pickedImage != null),
        assert(isBanned != null),
        assert(isOfficial != null);

  @override
  final IUserDataSource source;
  @override
  final String id;
  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String description;
  @JsonKey(defaultValue: 'images/default_user_icon.png')
  @override
  final String iconImagePath;
  @JsonKey(defaultValue: false)
  @override
  final bool pickedImage;
  @JsonKey(defaultValue: false)
  @override
  final bool isBanned;
  @JsonKey(defaultValue: false)
  @override
  final bool isOfficial;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OriginUser(source: $source, id: $id, name: $name, description: $description, iconImagePath: $iconImagePath, pickedImage: $pickedImage, isBanned: $isBanned, isOfficial: $isOfficial)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OriginUser'))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('iconImagePath', iconImagePath))
      ..add(DiagnosticsProperty('pickedImage', pickedImage))
      ..add(DiagnosticsProperty('isBanned', isBanned))
      ..add(DiagnosticsProperty('isOfficial', isOfficial));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OriginUser &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
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
                    .equals(other.pickedImage, pickedImage)) &&
            (identical(other.isBanned, isBanned) ||
                const DeepCollectionEquality()
                    .equals(other.isBanned, isBanned)) &&
            (identical(other.isOfficial, isOfficial) ||
                const DeepCollectionEquality()
                    .equals(other.isOfficial, isOfficial)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(iconImagePath) ^
      const DeepCollectionEquality().hash(pickedImage) ^
      const DeepCollectionEquality().hash(isBanned) ^
      const DeepCollectionEquality().hash(isOfficial);

  @override
  _$OriginUserCopyWith<_OriginUser> get copyWith =>
      __$OriginUserCopyWithImpl<_OriginUser>(this, _$identity);
}

abstract class _OriginUser implements OriginUser {
  const factory _OriginUser(
      {@required IUserDataSource source,
      @required String id,
      @required String name,
      String description,
      String iconImagePath,
      bool pickedImage,
      bool isBanned,
      bool isOfficial}) = _$_OriginUser;

  @override
  IUserDataSource get source;
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
  bool get isBanned;
  @override
  bool get isOfficial;
  @override
  _$OriginUserCopyWith<_OriginUser> get copyWith;
}
