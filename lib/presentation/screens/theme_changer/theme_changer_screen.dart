import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier).toggle();
              ref.read(themeNotifierProvider.notifier).toogleDarkMode();
            },
            icon: isDarkMode
                ? Icon(Icons.dark_mode_outlined)
                : Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return RadioGroup(
      groupValue: selectedColor,
      onChanged: (value) {
        if (value != null) {
          // ref.read(selectedColorProvider.notifier).select(value);
          ref.read(themeNotifierProvider.notifier).changeColorIndex(value);
        }
      },
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
            value: index,
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.toARGB32()}'),
            activeColor: color,
          );
        },
      ),
    );
  }
}
