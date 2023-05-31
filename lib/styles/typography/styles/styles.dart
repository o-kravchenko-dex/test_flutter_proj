import 'package:flutter/material.dart';

import 'typography_styles.dart';
import 'typography_styles_types.dart';

export './typography_styles.dart';
export './typography_styles_types.dart';

const styles = <TypographyStylesTypes, TextStyle> {
  TypographyStylesTypes.large: typographyStyleLarge,
  TypographyStylesTypes.medium: typographyStyleMedium,
  TypographyStylesTypes.small: typographyStyleSmall,
};

TextStyle getTypographyStyle(TypographyStylesTypes type) {
  final selectedStyle = styles[type];
  assert(selectedStyle != null, 'No typography style where found. Please make sure style exists and added to the styles map');

  return selectedStyle!;
}