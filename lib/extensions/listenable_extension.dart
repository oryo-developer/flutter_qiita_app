import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension ListenableExtension<T extends Listenable> on T {
  T autoDisposeListener(void Function(T) listener) {
    useEffect(() {
      void listenerThis() {
        listener(this);
      }

      addListener(listenerThis);
      return () {
        removeListener(listenerThis);
      };
    }, const []);
    return this;
  }

  (T, R) listenableSelector<R>(R Function(T) selector) {
    final selectorResult = useListenableSelector(this, () {
      return selector(this);
    });
    return (this, selectorResult);
  }
}
