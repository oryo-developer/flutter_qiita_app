import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_qiita_app/extensions/build_context_extension.dart';

class QiitaTextField extends HookWidget {
  const QiitaTextField({
    super.key,
    this.textInputAction,
    this.onSubmitted,
    this.hintText,
    this.prefixIcon,
  });

  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final isEmpty = useListenableSelector(controller, () {
      return controller.text.isEmpty;
    });

    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      style: TextStyle(color: context.themeColor.highEmphasis),
      onSubmitted: onSubmitted,
      cursorWidth: 1,
      cursorColor: context.themeColor.highEmphasis,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: isEmpty
            ? null
            : GestureDetector(
                onTap: () {
                  controller.clear();
                  focusNode.requestFocus();
                },
                child: const Icon(Icons.close),
              ),
      ),
    );
  }
}
