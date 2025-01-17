import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormfield extends StatelessWidget {
  const CustomFormfield(
      {super.key,
      required this.name,
      required this.controller,
       this.validator,
      this.size = 20,
      this.inputTextColor,
      this.fontSize,
      this.obscureText = false,
      this.focusNode,
      this.suffix,
      this.prefix,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      this.textInputAction = TextInputAction.next,
      this.onChanged});
  final String name;
  final double size;
  final double? fontSize;
  final Color? inputTextColor;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: KStyle.content(
        letterSpace: .4,
        size: 13,
      ),
      obscureText: obscureText,
      inputFormatters: inputFormatters,

      keyboardType: keyboardType,
//inputs
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: name,
        hintStyle: KStyle.content(color: Colors.grey, size: 13),
        contentPadding: const EdgeInsets.only(left: 20, top: 10),
        // labelText: name,

        fillColor: Colors.grey.withOpacity(.08),
        focusColor: Colors.grey.withOpacity(0.3),
        filled: true,
//border elements like error border, focus border  and enable border
//it include radius and border color
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),

//error  view
        errorMaxLines: 1,
        errorStyle: KStyle.content(
            color: Colors.red.withOpacity(.9),
            size: 10,
            lineHeight: 0.1,
            letterSpace: .4),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.5),
          ),
          gapPadding: 2,
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      //it is a focus node like submit a field after going to next feild
      //help of this parameter
      focusNode: focusNode,
      onChanged: onChanged, textInputAction: textInputAction,
    );
  }
}


class KStyle {
  //---------------content text style---------------//
  static TextStyle content({
    double size = 12,
    double? lineHeight,
    double? letterSpace,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.black,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: decoration,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpace,
        overflow: TextOverflow.ellipsis);
  }

//---------------title text style---------------//
  static TextStyle title({
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.black,
    double? lineHeight,
    double letterSpace = 0.2,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: decoration,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpace,
        overflow: TextOverflow.ellipsis);
  }

//---------------heading text style---------------//

  static TextStyle heading({
    double size = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black,
    TextDecoration decoration = TextDecoration.none,
    double? lineHeight,
    double? letterSpace,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        decoration: decoration,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpace,
        overflow: TextOverflow.ellipsis);
  }
}