import 'package:flutter_riverpod/flutter_riverpod.dart';

// final isDarkModeProvider = Provider((ref) => false);

final isDarkModeProvider = NotifierProvider<DarkModeNotifier, bool>(
  DarkModeNotifier.new,
);

class DarkModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}
