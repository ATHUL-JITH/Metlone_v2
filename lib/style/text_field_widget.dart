import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/colors_class.dart';
import '../style/text_style_class.dart';

class TextFieldWidget extends StatefulWidget {
  final String? name;
  final String? label;
  final Widget? labelWidget;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function? function;
  final FocusNode? focusNode;
  final bool floating;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool? suffixDropDown;
  final Function? onTapFunction;
  final int? maxLine;
  final int? maxLength;
  final EdgeInsets? edgeInsets;
  final Widget? iconWithFunction;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final bool isBorderNeeded;
  final String? Function(String?)? validator;
  const TextFieldWidget({
    Key? key,
    this.isBorderNeeded = true,
    this.validator,
    this.name,
    this.label,
    this.labelWidget,
    required this.controller,
    required this.textInputType,
    this.suffixIcon,
    this.function,
    this.focusNode,
    this.floating = false,
    this.inputFormatters,
    this.textInputAction,
    this.textCapitalization,
    this.suffixDropDown,
    this.readOnly = false,
    this.onTapFunction,
    this.maxLine,
    this.maxLength,
    this.edgeInsets,
    this.iconWithFunction,
    this.prefixWidget,
    required bool obscureText,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.edgeInsets ??
          const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0, right: 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(builder: (context) {
          return TextFormField(
            readOnly: widget.readOnly,
            validator: widget.validator,
            onTap: () {
              if (widget.onTapFunction != null) {
                widget.onTapFunction!();
              }
            },
            inputFormatters: widget.inputFormatters,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            textInputAction: widget.textInputAction ?? TextInputAction.none,
            keyboardType: widget.textInputType,
            controller: widget.controller,
            obscureText: !_passwordVisible &&
                widget.textInputType == TextInputType.visiblePassword,
            enableSuggestions: false,
            autocorrect: false,
            style: TextStyleClass.textFieldStyle,
            focusNode: widget.focusNode,
            maxLines: widget.maxLine ?? 1,
            maxLength: widget.maxLength ?? 500,
            onChanged: (value) {
              if (widget.function != null) {
                widget.function!();
              }
            },
            decoration: InputDecoration(
                label: widget.labelWidget,
                errorText: null,
                isDense: true,
                labelText:
                    widget.maxLine == null ? widget.name ?? widget.label : null,
                hintText: widget.label,
                counterText: "",
                hintStyle: TextStyleClass.hintTextStyle,
                labelStyle: TextStyleClass.labelTextStyle,
                border: widget.isBorderNeeded
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorClass.lightGray.withOpacity(0.7),
                            width: 1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(06),
                        ))
                    : InputBorder.none,
                enabledBorder: widget.isBorderNeeded
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorClass.lightGray.withOpacity(0.7),
                            width: 1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(06),
                        ))
                    : null,
                focusedBorder: widget.isBorderNeeded
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorClass.lightGray.withOpacity(0.7),
                            width: 1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(06),
                        ))
                    : null,
                floatingLabelBehavior:
                    widget.floating ? FloatingLabelBehavior.always : null,
                prefix: widget.prefixWidget,
                suffixIcon:
                    widget.textInputType == TextInputType.visiblePassword
                        ? IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              _passwordVisible = !_passwordVisible;

                              setState(() {});
                            },
                          )
                        : widget.suffixDropDown == true &&
                                widget.iconWithFunction != null
                            ? widget.iconWithFunction
                            : widget.suffixDropDown == true
                                ? const Icon(
                                    Icons.arrow_drop_down_outlined,
                                    size: 25,
                                    color: ColorClass.darkGray,
                                  )
                                : widget.suffixIcon),
          );
        }),
      ),
    );
  }
}
