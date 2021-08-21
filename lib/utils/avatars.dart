import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_manager/constants/asset_path.dart';

class Avatar extends StatelessWidget {
  final int avatar;
  final double size;

  Avatar(this.avatar, this.size);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "$avatars/head.svg",
          width: size,
          height: size,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        SvgPicture.asset(
          "$avatars/hair/$avatar.svg",
          width: size,
          height: size,
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
