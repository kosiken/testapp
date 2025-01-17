import 'package:flutter/material.dart';
import 'package:testapp/gen/fonts.gen.dart';

enum TypographyVatiant { body, header, small }

class AppTypography extends StatelessWidget {
  final TextAlign? textAlign;
  final TypographyVatiant variant;
  final double? height;
  final TextStyle? textStyle;
  final double? fontSize;
  final String text;
  final FontWeight? fontWeight;
  final bool italics;

  final Color color;
  final Map<TypographyVatiant, TextStyle> styles = const {
    TypographyVatiant.body: TextStyle(fontSize: 14, inherit: true),
    TypographyVatiant.header: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, inherit: true),
    TypographyVatiant.small: TextStyle(fontSize: 12, inherit: true)
  };

  const AppTypography(this.text,
      {super.key,
      this.textAlign,
      this.textStyle,
      this.fontSize,
      this.variant = TypographyVatiant.body,
      this.height,
      this.fontWeight,
      this.italics = false,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    TextStyle style = styles[variant]!.merge(
      
        TextStyle( 
          fontStyle: this.italics? FontStyle.italic : FontStyle.normal,
          fontSize: fontSize, fontFamily: FontFamily.proximaNova, color: color, fontWeight: fontWeight, height: height, inherit: true));
    if (textStyle != null) {
      style = style.merge(textStyle);
    }
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: style,
      textAlign: textAlign,
    );
  }
}
