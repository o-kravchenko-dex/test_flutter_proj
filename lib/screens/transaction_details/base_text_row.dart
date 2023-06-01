import 'package:flutter/cupertino.dart';
import 'package:untitled_flutter_pr/shared/widgets/label/label.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class BaseTextRow extends StatelessWidget {
  final String? title;
  final String? description;
  final TypographyStylesTypes titleStyleType;
  final TypographyStylesTypes descriptionStyleType;

  const BaseTextRow({
    super.key,
    this.title,
    required this.description,
    this.titleStyleType = TypographyStylesTypes.medium,
    this.descriptionStyleType = TypographyStylesTypes.medium,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Label(title ?? "", type: titleStyleType),
        Label(description ?? "", type: descriptionStyleType),
      ],
    );
  }
}
