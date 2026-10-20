import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// final isDarkModeProvider = Provider((ref) => false);

final isDarkModeProvider = NotifierProvider<DarkModeNotifier, bool>(
  DarkModeNotifier.new,
);

class DarkModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

final colorListProvider = Provider((ref) => colorList);

// final selectedColorProvider = Provider((ref) => 0);

final selectedColorProvider = NotifierProvider<SelectedColorNotifier, int>(
  SelectedColorNotifier.new,
);

class SelectedColorNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void select(int index) => state = index;
}
