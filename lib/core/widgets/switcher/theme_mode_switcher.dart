import 'package:material_ui/material_ui.dart';

import 'package:presentation/presentation.dart';

import '../semantics/semantic_action.dart';

/// Round icon button that cycles system → light → dark → system. The icon
/// always shows the mode that is currently applied.
class ThemeModeSwitcher extends StatelessWidget {
  const ThemeModeSwitcher({
    super.key,
    required this.themeMode,
    required this.onThemeChange,
    this.tooltip,
    this.identifier,
  });

  final ThemePreference themeMode;
  final ValueChanged<ThemePreference> onThemeChange;
  final String? tooltip;
  final String? identifier;

  @override
  Widget build(BuildContext context) {
    return SemanticAction(
      identifier: identifier,
      child: IconButton(
        tooltip: tooltip,
        onPressed: () => onThemeChange(themeMode.next),
        icon: Icon(_iconFor(themeMode), size: 20),
      ),
    );
  }

  static IconData _iconFor(ThemePreference mode) {
    switch (mode) {
      case ThemePreference.dark:
        return Icons.nightlight_round;
      case ThemePreference.light:
        return Icons.wb_sunny_rounded;
      case ThemePreference.system:
        return Icons.auto_awesome;
    }
  }
}
