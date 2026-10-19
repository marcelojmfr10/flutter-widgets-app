import 'package:flutter_riverpod/flutter_riverpod.dart';

// final counterProvider = Provider<int>((ref) => 5);

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 5;

  void increment() => state++;
}
