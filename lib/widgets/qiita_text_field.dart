import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';
import 'package:flutter_qiita_app/extensions/listenable_extension.dart';

class QiitaTextField extends HookWidget {
  const QiitaTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.hintText,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final (
      finalController,
      isEmpty,
    ) = (controller ?? useTextEditingController()).listenableSelector(
      (controller) {
        return controller.text.isEmpty;
      },
    );
    final finalFocusNode = focusNode ?? useFocusNode();
    return TextField(
      controller: finalController,
      focusNode: finalFocusNode,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: isEmpty
            ? null
            : GestureDetector(
                onTap: () {
                  finalController.clear();
                  finalFocusNode.requestFocus();
                },
                child: const Icon(Icons.close),
              ),
      ),
      textInputAction: textInputAction,
      style: TextStyle(color: context.themeColor.highEmphasis),
      onSubmitted: onSubmitted,
      cursorWidth: 1,
      cursorColor: context.themeColor.highEmphasis,
    );
  }
}