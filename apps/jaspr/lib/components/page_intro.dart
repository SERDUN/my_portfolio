import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'layout.dart';

/// The opening of a top-level page: eyebrow, the statement as the page's
/// heading, and a muted description at most 640 px wide. The copy column of
/// Flutter's projects, contacts and useful pages.
Component pageIntro({required String eyebrowText, required String title, required String description}) =>
    div(classes: 'page-intro', [
      eyebrow(eyebrowText),
      h1(classes: 'page-intro__title t-headline-large t-tablet-display-medium', [.text(title)]),
      p(classes: 'page-intro__description t-body-medium', [.text(description)]),
    ]);
