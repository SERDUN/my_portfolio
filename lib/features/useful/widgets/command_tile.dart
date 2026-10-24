import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';
import 'package:my_portfolio/app/keys.dart';
import 'package:my_portfolio/core/core.dart';

/// One command: its purpose, the command line in a code box, and a copy
/// button that confirms for a moment.
class CommandTile extends StatefulWidget {
  const CommandTile({super.key, required this.title, required this.command});

  final String title;
  final String command;

  @override
  State<CommandTile> createState() => _CommandTileState();
}

class _CommandTileState extends State<CommandTile> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.command));
    if (!mounted) return;
    setState(() => _copied = true);
    SemanticsService.sendAnnouncement(
      View.of(context),
      context.l10n.useful_semanticsLabel_copied(widget.title),
      Directionality.of(context),
    );
    await Future<void>.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: textTheme.titleSmall),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(color: palette.chip, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.fromLTRB(14, 6, 6, 6),
          child: Row(
            children: [
              Expanded(
                child: SelectableText(
                  widget.command,
                  style: GoogleFonts.jetBrainsMono(fontSize: 14, height: 1.5, color: palette.ink),
                ),
              ),
              const SizedBox(width: 8),
              SemanticAction(
                label: _copied
                    ? context.l10n.useful_semanticsLabel_copied(widget.title)
                    : context.l10n.useful_semanticsLabel_copy(widget.title),
                identifier: usefulCopyId(widget.command),
                child: TextButton.icon(
                  onPressed: _copy,
                  style: TextButton.styleFrom(
                    foregroundColor: _copied ? palette.accent : palette.muted,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  icon: Icon(_copied ? Icons.check_rounded : Icons.copy_rounded, size: 18),
                  label: ExcludeSemantics(child: Text(_copied ? l10n.useful_copied : l10n.useful_copy)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
