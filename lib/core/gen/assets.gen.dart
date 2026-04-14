// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_left_icn.svg
  SvgGenImage get arrowLeftIcn =>
      const SvgGenImage('assets/icons/arrow_left_icn.svg');

  /// File path: assets/icons/calendar_icn.svg
  SvgGenImage get calendarIcn =>
      const SvgGenImage('assets/icons/calendar_icn.svg');

  /// File path: assets/icons/error_icn.png
  AssetGenImage get errorIcn =>
      const AssetGenImage('assets/icons/error_icn.png');

  /// File path: assets/icons/google_icn.svg
  SvgGenImage get googleIcn => const SvgGenImage('assets/icons/google_icn.svg');

  /// File path: assets/icons/google_img.png
  AssetGenImage get googleImg =>
      const AssetGenImage('assets/icons/google_img.png');

  /// File path: assets/icons/heart_active_icn.svg
  SvgGenImage get heartActiveIcn =>
      const SvgGenImage('assets/icons/heart_active_icn.svg');

  /// File path: assets/icons/heart_icn.svg
  SvgGenImage get heartIcn => const SvgGenImage('assets/icons/heart_icn.svg');

  /// File path: assets/icons/home_active_icn.svg
  SvgGenImage get homeActiveIcn =>
      const SvgGenImage('assets/icons/home_active_icn.svg');

  /// File path: assets/icons/home_icn.svg
  SvgGenImage get homeIcn => const SvgGenImage('assets/icons/home_icn.svg');

  /// File path: assets/icons/lock_icn.svg
  SvgGenImage get lockIcn => const SvgGenImage('assets/icons/lock_icn.svg');

  /// File path: assets/icons/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/icons/moon.svg');

  /// File path: assets/icons/search_icn.svg
  SvgGenImage get searchIcn => const SvgGenImage('assets/icons/search_icn.svg');

  /// File path: assets/icons/sms_icn.svg
  SvgGenImage get smsIcn => const SvgGenImage('assets/icons/sms_icn.svg');

  /// File path: assets/icons/success_icn.png
  AssetGenImage get successIcn =>
      const AssetGenImage('assets/icons/success_icn.png');

  /// File path: assets/icons/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/icons/sun.svg');

  /// File path: assets/icons/user_active_icn.svg
  SvgGenImage get userActiveIcn =>
      const SvgGenImage('assets/icons/user_active_icn.svg');

  /// File path: assets/icons/user_icn.svg
  SvgGenImage get userIcn => const SvgGenImage('assets/icons/user_icn.svg');

  /// File path: assets/icons/warning_icn.png
  AssetGenImage get warningIcn =>
      const AssetGenImage('assets/icons/warning_icn.png');

  /// List of all assets
  List<dynamic> get values => [
    arrowLeftIcn,
    calendarIcn,
    errorIcn,
    googleIcn,
    googleImg,
    heartActiveIcn,
    heartIcn,
    homeActiveIcn,
    homeIcn,
    lockIcn,
    moon,
    searchIcn,
    smsIcn,
    successIcn,
    sun,
    userActiveIcn,
    userIcn,
    warningIcn,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/birthday_img.png
  AssetGenImage get birthdayImg =>
      const AssetGenImage('assets/images/birthday_img.png');

  /// File path: assets/images/book_club_img.png
  AssetGenImage get bookClubImg =>
      const AssetGenImage('assets/images/book_club_img.png');

  /// File path: assets/images/evently_logo_img.png
  AssetGenImage get eventlyLogoImg =>
      const AssetGenImage('assets/images/evently_logo_img.png');

  /// File path: assets/images/exhibition_img.png
  AssetGenImage get exhibitionImg =>
      const AssetGenImage('assets/images/exhibition_img.png');

  /// File path: assets/images/meeting_img.png
  AssetGenImage get meetingImg =>
      const AssetGenImage('assets/images/meeting_img.png');

  /// File path: assets/images/on_boarding_config_img.png
  AssetGenImage get onBoardingConfigImg =>
      const AssetGenImage('assets/images/on_boarding_config_img.png');

  /// File path: assets/images/sport_img.png
  AssetGenImage get sportImg =>
      const AssetGenImage('assets/images/sport_img.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    birthdayImg,
    bookClubImg,
    eventlyLogoImg,
    exhibitionImg,
    meetingImg,
    onBoardingConfigImg,
    sportImg,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
