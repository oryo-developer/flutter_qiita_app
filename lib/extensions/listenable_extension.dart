import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension ListenableExtension<T extends Listenable> on T {
  void autoDisposeAddListener(void Function(T listenable) listener) {
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

  (T, R) listenableSelector<R>(R Function(T listenable) selector) {
    final selectorResult = useListenableSelector(this, () {
      return selector(this);
    });
    return (this, selectorResult);
  }
}
