import 'package:flutter/material.dart';

TextStyle styleText({color, fontWeight, fontSize}) {
  return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 25.00,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontFamily: 'Lato');
}
Decoration decoration() {
  return BoxDecoration(
      color: Colors.purple.shade50,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 20),
      ]);
}
Widget leadIcon() {
  return Container(
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
      padding: const EdgeInsets.all(2),
      child: const Icon(
        Icons.done,
        color: Colors.white,
        size: 15,
      ));
}