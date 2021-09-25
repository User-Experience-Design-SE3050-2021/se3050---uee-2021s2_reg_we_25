import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nolimit/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    if (error.length < 1)
      return Row();

    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 16,
          width: 16,
        ),
        SizedBox(
          width: 12,
        ),
        Text(error)
      ],
    );
  }

  Row formErrorText({ required String error }) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 16,
          width: 16,
        ),
        SizedBox(
          width: 12,
        ),
        Text(error)
      ],
    );
  }
}