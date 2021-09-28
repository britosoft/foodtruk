import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    @required this.controller,
    @required this.placeholder,
    @required this.validator,
    @required this.title,
    this.obscureText,
    this.inputFormatters,
    this.keyboardType,
    this.lines,
    this.capitalization,
    this.onTap,
    this.widget,
  }) : super(key: key);
  final String? placeholder;
  final Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? title;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? lines;
  final TextCapitalization? capitalization;
  final Function? onTap;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title', style: Theme.of(context).textTheme.bodyText1),
          if (widget == null)
            CupertinoTextFormFieldRow(
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
              padding: EdgeInsets.all(0),
              textInputAction: TextInputAction.done,
              textCapitalization: capitalization ?? TextCapitalization.none,
              controller: controller,
              obscureText: obscureText ?? false,
              cursorColor: Colors.green,
              inputFormatters: inputFormatters ?? [],
              keyboardType: keyboardType,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.fromBorderSide(
                  BorderSide(color: Colors.grey.shade300),
                ),
              ),
              readOnly: onTap != null,
              onTap: onTap != null ? () => onTap!() : () {},
              placeholder: placeholder ?? 'Insert',
              enableInteractiveSelection: true,
              validator: (value) => validator!(value),
              maxLines: lines ?? 1,
            )
          else
            widget!
        ],
      ),
    );
  }
}
