import 'package:flutter/widgets.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class Label extends Text {
  final bool _isRich;
  final TypographyStylesTypes type;
  final Color color;

  const Label(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    this.type = TypographyStylesTypes.medium,
    this.color = AppColors.black,
  }) : _isRich = false;

  const Label.rich(
    super.textSpan, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow = TextOverflow.ellipsis,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    this.type = TypographyStylesTypes.medium,
    this.color = AppColors.black,
  }) : _isRich = true;

  TextStyle _getEffectiveStyle() {
    final baseType = getTypographyStyle(type);

    return baseType.merge(TextStyle(color: color)).merge(style);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = _getEffectiveStyle();

    return _isRich
        ? Text.rich(
            textSpan!,
            key: key,
            style: effectiveStyle,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: selectionColor,
          )
        : Text(
            data!,
            key: key,
            style: effectiveStyle,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: selectionColor,
          );
  }
}
