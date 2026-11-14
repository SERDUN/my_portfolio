import 'package:domain/domain.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:presentation/presentation.dart';

/// A rounded label for a skill or a technology. Flutter's `TagChip`: a soft
/// fill by default, a hairline when [outlined], smaller when [small].
Component tagChip(String label, {bool outlined = false, bool small = false}) => span(
  classes: [
    'tag-chip',
    if (outlined) 'tag-chip--outlined',
    small ? 'tag-chip--small t-label-small' : 't-label-medium',
  ].join(' '),
  [.text(label)],
);

/// The platform of a project as a small uppercase tag: Flutter in the accent,
/// Android in ink. Flutter's `PlatformTag`.
Component platformTag(ProjectPlatform platform) =>
    span(classes: 'platform-tag platform-tag--${platform.name} t-label-small', [.text(platform.label.toUpperCase())]);
