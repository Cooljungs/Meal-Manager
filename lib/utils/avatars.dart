import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_manager/constants/asset_path.dart';
import 'package:meal_manager/utils/providers.dart';
import 'package:provider/provider.dart';

avatarPainter(context, int avatar, double size) {
  return Stack(
    children: [
      SvgPicture.asset(
        "$avatars/head.svg",
        width: size,
        height: size,
        color: Theme.of(context).colorScheme.primaryVariant,
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
