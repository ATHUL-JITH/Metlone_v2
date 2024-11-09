import 'package:flutter/material.dart';

import '../style/colors_class.dart';
import '../style/text_style_class.dart';

class DropDownTextField extends StatefulWidget {
  const DropDownTextField(
      {super.key,
      this.labelText,
      required this.hintText,
      required this.itemList,
      required this.onChanged,
      this.value,
      this.isNeededShortLable = false,
      this.hideBorder = false,
      Iterable<Null>? items});
  final String? labelText;
  final String hintText;
  final bool hideBorder;
  final bool isNeededShortLable;
  final List<DropdownMenuItem> itemList;
  final String? value;
  final Function(dynamic)? onChanged;
  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: widget.value,
        decoration: InputDecoration(
          isDense: true,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: widget.isNeededShortLable
              ? TextStyleClass.hintTextStyle.copyWith(
                  fontSize: 9,
                  fontWeight: FontWeight.w200,
                )
              : TextStyleClass.hintTextStyle,
          labelStyle: TextStyleClass.labelTextStyle,
          disabledBorder: widget.hideBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorClass.lightGray.withOpacity(0.7), width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(06),
                  )),
          border: widget.hideBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorClass.lightGray.withOpacity(0.7), width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(06),
                  )),
          enabledBorder: widget.hideBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorClass.lightGray.withOpacity(0.7), width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(06),
                  )),
          focusedBorder: widget.hideBorder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorClass.lightGray.withOpacity(0.7), width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(06),
                  )),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        items: widget.itemList,
        onChanged: widget.onChanged);
  }
}
