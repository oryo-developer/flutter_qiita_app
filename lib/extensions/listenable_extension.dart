import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension ListenableExtension<T extends Listenable> on T {
  void addAutoDisposeListener(void Function(T listenable) listener) {
    useEffect(() {
      void listenerThis() {
        listener(this);
      }

      addListener(listenerThis);
      return () {
        removeListener(listenerThis);
      };
    }, const []);
  }
}
