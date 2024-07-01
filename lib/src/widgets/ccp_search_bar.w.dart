import 'package:fl_country_code_picker/src/constants.dart';
import 'package:flutter/material.dart';

/// {@template ccp_search_bar}
/// The default modal search bar widget that can be customized by supplying
/// the [decoration] parameter.
/// {@endtemplate}
class CcpSearchBar extends StatelessWidget {
  /// {@macro search_bar}
  const CcpSearchBar({
    this.onChanged,
    this.decoration,
    this.style,
    this.padding,
    this.controller,
    super.key,
  });

  /// Callback function on query changed.
  final void Function(String)? onChanged;

  /// {@macro search_bar_decoration}
  final InputDecoration? decoration;

  /// {@macro search_bar_text_style}
  final TextStyle? style;

  /// Padding around the search bar
  final EdgeInsetsGeometry? padding;

  /// Controller for input text
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: decoration ?? kInputDecoration,
        keyboardType: TextInputType.text,
        style: style,
      ),
    );
  }
}
