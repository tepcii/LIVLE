// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OriginUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconImagePath => throw _privateConstructorUsedError;
  bool get pickedImage => throw _privateConstructorUsedError;
  bool get isBanned => throw _privateConstructorUsedError;
  bool get isOfficial => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OriginUserCopyWith<OriginUser> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? iconImagePath = freezed,
    Object? pickedImage = freezed,
    Object? isBanned = freezed,
    Object? isOfficial = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconImagePath: iconImagePath == freezed
          ? _value.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      pickedImage: pickedImage == freezed
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: isBanned == freezed
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: isOfficial == freezed
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
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
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? iconImagePath = freezed,
    Object? pickedImage = freezed,
    Object? isBanned = freezed,
    Object? isOfficial = freezed,
  }) {
    return _then(_OriginUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconImagePath: iconImagePath == freezed
          ? _value.iconImagePath
          : iconImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      pickedImage: pickedImage == freezed
          ? _value.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: isBanned == freezed
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: isOfficial == freezed
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OriginUser with DiagnosticableTreeMixin implements _OriginUser {
  const _$_OriginUser(
      {required this.id,
      required this.name,
      this.description = '',
      this.iconImagePath = 'images/default_user_icon.png',
      this.pickedImage = false,
      this.isBanned = false,
      this.isOfficial = false});

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String iconImagePath;
  @override
  @JsonKey()
  final bool pickedImage;
  @override
  @JsonKey()
  final bool isBanned;
  @override
  @JsonKey()
  final bool isOfficial;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OriginUser(id: $id, name: $name, description: $description, iconImagePath: $iconImagePath, pickedImage: $pickedImage, isBanned: $isBanned, isOfficial: $isOfficial)';
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
      ..add(DiagnosticsProperty('pickedImage', pickedImage))
      ..add(DiagnosticsProperty('isBanned', isBanned))
      ..add(DiagnosticsProperty('isOfficial', isOfficial));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OriginUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.iconImagePath, iconImagePath) &&
            const DeepCollectionEquality()
                .equals(other.pickedImage, pickedImage) &&
            const DeepCollectionEquality().equals(other.isBanned, isBanned) &&
            const DeepCollectionEquality()
                .equals(other.isOfficial, isOfficial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(iconImagePath),
      const DeepCollectionEquality().hash(pickedImage),
      const DeepCollectionEquality().hash(isBanned),
      const DeepCollectionEquality().hash(isOfficial));

  @JsonKey(ignore: true)
  @override
  _$OriginUserCopyWith<_OriginUser> get copyWith =>
      __$OriginUserCopyWithImpl<_OriginUser>(this, _$identity);
}

abstract class _OriginUser implements OriginUser {
  const factory _OriginUser(
      {required final String id,
      required final String name,
      final String description,
      final String iconImagePath,
      final bool pickedImage,
      final bool isBanned,
      final bool isOfficial}) = _$_OriginUser;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get iconImagePath => throw _privateConstructorUsedError;
  @override
  bool get pickedImage => throw _privateConstructorUsedError;
  @override
  bool get isBanned => throw _privateConstructorUsedError;
  @override
  bool get isOfficial => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OriginUserCopyWith<_OriginUser> get copyWith =>
      throw _privateConstructorUsedError;
}
