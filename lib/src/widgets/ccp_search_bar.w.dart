import 'package:fl_country_code_picker/src/constants.dart';
import 'package:flutter/material.dart';

/// {@template ccp_search_bar}
/// The default modal search bar widget that can be customized by supplying
/// the [decoration] parameter.
/// {@endtemplate}
class CcpSearchBar extends StatefulWidget {
  /// {@macro search_bar}
  const CcpSearchBar({
    this.onChanged,
    this.decoration,
    this.style,
    this.padding,
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

  @override
  State<CcpSearchBar> createState() => _CcpSearchBarState();
}

class _CcpSearchBarState extends State<CcpSearchBar> {
  final _searchBarTextController = TextEditingController();
  var _isClearTextBtnVisible = false;

  @override
  void initState() {
    _searchBarTextController.addListener(() {
      if (_searchBarTextController.text.isNotEmpty && !_isClearTextBtnVisible) {
        setState(() {
          _isClearTextBtnVisible = true;
        });
      } else if (_searchBarTextController.text.isEmpty &&
          _isClearTextBtnVisible) {
        setState(() {
          _isClearTextBtnVisible = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
      child: TextField(
        controller: _searchBarTextController,
        onChanged: widget.onChanged,
        decoration: (widget.decoration ?? kInputDecoration).copyWith(
          suffixIcon: _isClearTextBtnVisible
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 24, 0),
                  child: GestureDetector(
                    onTap: () {
                      _searchBarTextController.clear();
                      widget.onChanged?.call('');
                    },
                    child: const Icon(
                      Icons.clear_rounded,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                )
              : null,
        ),
        keyboardType: TextInputType.text,
        style: widget.style,
      ),
    );
  }
}
