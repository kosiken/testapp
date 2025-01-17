import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testapp/widgets/typography.dart';

enum AppIconButtonVariant { filled, outline, iconOnly }
class AppIconButton extends StatelessWidget {
  final String? assetName;
  final IconData? icon;
  final AppIconButtonVariant variant;
  final Color color;
  final VoidCallback? onTap;
  final double size;
  final int badgeCount;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showBadge;

  const AppIconButton({super.key, this.badgeTextColor, this.badgeColor,  this.showBadge = false, this.badgeCount = 0, this.size = 48, this.assetName,this.icon, this.variant = AppIconButtonVariant.filled, this.color = Colors.white, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Stack(clipBehavior: Clip.none,children: [

        Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: variant == AppIconButtonVariant.filled ? color : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: variant == AppIconButtonVariant.outline ? color : Colors.transparent,
          width: variant == AppIconButtonVariant.iconOnly ? 0 : 2.2,
        ),
        
      ),
      child: Center(
        child: assetName != null
            ? SvgPicture.asset(
                assetName!,
                colorFilter:  ColorFilter.mode(  variant == AppIconButtonVariant.filled   ? Colors.black : color, BlendMode.srcIn) ,
                height: variant == AppIconButtonVariant.iconOnly ? size : size / 2 ,
                width: variant == AppIconButtonVariant.iconOnly ? size : size / 2,
              )
            : Icon(
                icon,
                size: variant == AppIconButtonVariant.iconOnly ? size : size / 2 ,
                color: variant == AppIconButtonVariant.filled   ? Colors.black :  color,
              ),
      ),
    ),
           if (showBadge) Positioned(
            right: -6,top: 0,
            child:  Container(width: 16, height: 13, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: badgeColor ?? const Color(0xFFB5B2FF)
            ),
        child: badgeCount == 0 ? null : Center(child: AppTypography(
          '$badgeCount',
          fontSize: 7,
          fontWeight: FontWeight.bold,
          color: badgeTextColor ?? const Color(0xFF0F1115),
        ),),
        )),
      ],));
  }
}