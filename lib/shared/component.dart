import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';


Widget defaultFormField({
  required context,
  TextEditingController? controller,
  dynamic label,
  IconData ? prefix,
  String ? initialValue,
  TextInputType ?keyboardType,
  Function(String)? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData ?suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: onSubmit,
      enabled: enabled,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      style:Theme.of(context).textTheme.bodyText1,
      initialValue:initialValue ,
      //textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
      hintText: label,
        border:UnderlineInputBorder(),
        prefixIcon: Icon(prefix,),
        suffixIcon: suffix != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

      ),
    );

Widget defaultButton({
  required VoidCallback onTap,
  required String text,
  double? width = double.infinity,

}) => Container(
  height: 40,
  width: width,
  decoration: BoxDecoration(

    color: Colors.red,
  ),
  child: ElevatedButton(
    onPressed: onTap,
    child: Text(
      '$text',
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
    ),
  ),
);


Widget buildIconWithNumber({
  required bool condition,
  number,
  icon,
  iconColor,
  double size = 24,
  double radius = 6,
  double fontSize = 11,
  VoidCallback? onPressed,
  alignment = const Alignment(1.6, -0.8),
}) =>
    Column(
      children: [
        Stack(
          alignment: alignment,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: iconColor,
                size: size,
              ),
            ),
            if (condition)
              CircleAvatar(
                radius: radius,
                backgroundColor: Colors.black.withOpacity(.6),
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
Widget primaryButton({
  required String text,
  required VoidCallback onPressed,
  double height = 60,
  double width = double.infinity,
  Color? background,
  Color? textColor,
  double radius = 30,
  bool isUpperCase = true,
  double fontSize = 18,
  colors,
}) =>
    Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(radius),

      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            fontSize: fontSize,
          ),
        ),
      ),
    );