import 'package:material_ui/material_ui.dart';

import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import '../../state/load_status.dart';
import '../button/pill_button.dart';
import 'status_message.dart';

/// What a page shows for its primary data:
/// - loaded content, always, once there is any: a failed reload keeps it and
///   adds a banner with a retry instead of wiping the page;
/// - the content on success even when it is empty (the page owns its empty
///   state);
/// - a spinner while the first load is pending;
/// - an error with a retry (or [failureAction]) when the first load failed.
class LoadStatusView extends StatelessWidget {
  const LoadStatusView({
    super.key,
    required this.status,
    required this.hasData,
    required this.builder,
    this.onRetry,
    this.failureMessage,
    this.failureAction,
  });

  final LoadStatus status;
  final bool hasData;
  final WidgetBuilder builder;
  final VoidCallback? onRetry;

  /// Overrides the generic failure text, e.g. for a missing project.
  final String? failureMessage;

  /// Shown instead of the retry button, e.g. a way back when retrying cannot help.
  final Widget? failureAction;

  @override
  Widget build(BuildContext context) {
    final message = failureMessage ?? context.l10n.common_loadFailed;
    if (hasData) {
      if (status != LoadStatus.failure) return builder(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FailureBanner(message: message, onRetry: onRetry),
          builder(context),
        ],
      );
    }
    switch (status) {
      case LoadStatus.success:
        return builder(context);
      case LoadStatus.failure:
        return StatusMessage(
          icon: Icons.cloud_off_rounded,
          message: message,
          action:
              failureAction ??
              (onRetry == null
                  ? null
                  : PillButton(label: context.l10n.common_retry, icon: Icons.refresh_rounded, onPressed: onRetry)),
        );
      case LoadStatus.initial:
      case LoadStatus.loading:
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 120),
          child: Center(child: CircularProgressIndicator()),
        );
    }
  }
}

class _FailureBanner extends StatelessWidget {
  const _FailureBanner({required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Semantics(
      liveRegion: true,
      child: Container(
        color: palette.chip,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Icon(Icons.cloud_off_rounded, size: 18, color: palette.muted),
            const SizedBox(width: 10),
            Expanded(child: Text(message, style: Theme.of(context).textTheme.bodySmall)),
            if (onRetry != null) TextButton(onPressed: onRetry, child: Text(context.l10n.common_retry)),
          ],
        ),
      ),
    );
  }
}
