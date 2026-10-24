# Shared widgets

Everything under `lib/core/widgets/`, exported from `package:my_portfolio/core/core.dart`.
Check this list before building a widget: a second copy of something listed here is a
bug. A widget used by two features moves here in the same change, and gets a row.

| Widget | File | Use it for |
|---|---|---|
| `PillButton` | `button/pill_button.dart` | Every button: `filled`, `ink`, `outline`, `ghost`; optional icon before or after the label |
| `TagChip` | `chip/tag_chip.dart` | A skill or a technology: soft fill or hairline outline |
| `PlatformTag` | `chip/platform_tag.dart` | The Flutter / Android tag on project cards and the project hero |
| `LoadStatusView` | `holder/load_status_view.dart` | A page's primary data: spinner, error with retry, banner over kept content |
| `StatusMessage` | `holder/status_message.dart` | Centered icon, message and action: errors, empty states, the 404 page |
| `NotFoundScreen` | `holder/not_found_page.dart` | The router's fallback for unknown paths |
| `PhoneFrame` | `image/phone_frame.dart` | A screenshot in a phone bezel rising out of a soft well |
| `blurHashPlaceholderBuilder` | `image/blur_hash_placeholder.dart` | BlurHash placeholder and error builders for `OctoImage` |
| `ContentWidth` | `layout/content_width.dart` | Centers a section in the 1200 px column with the page gutter |
| `ResponsiveGrid` | `layout/responsive_grid.dart` | Equal-width columns with equal-height rows; 3 / 2 / 1 by breakpoint |
| `PageScaffold` | `page/page_scaffold.dart` | The scrolling body of every page; shows the footer from `PageFooterScope` |
| `PageFooterScope` | `page/page_scaffold.dart` | Set once by the shell: the footer every `PageScaffold` below renders |
| `ProjectCard` | `project/project_card.dart` | A project, vertical (home) or `.horizontal` (list); `onOpen` decides where a tap goes |
| `LanguageToggle` | `switcher/language_toggle.dart` | EN / UK as two pills, or `.compact` as one round button |
| `ThemeModeSwitcher` | `switcher/theme_mode_switcher.dart` | Round button cycling system → light → dark |
| `SemanticAction` | `semantics/semantic_action.dart` | Name + automation id + action on ONE merged node; `.button` / `.link` add the role to bare tap targets |
| `SemanticId` | `semantics/semantic_action.dart` | An automation id that changes nothing else: screen anchors |
| `Eyebrow` | `text/eyebrow.dart` | Small-caps accent label above a section title |
| `SectionHeader` | `text/section_header.dart` | Eyebrow + display title with an optional description or action |

Shared state lives in `lib/app/`, not here: `AppSettingsCubit` (language, theme) and
`ContactsCubit` (the contacts the footer and the contacts page share). Navigation goes
through `context.openProject(id)` and friends: import `package:my_portfolio/app/navigation.dart`
directly, never the `app.dart` barrel (it exports the router, which imports every feature).

## Accessibility rules

- Every interactive control has a name (its visible text, a tooltip, or a `label` from l10n
  under `<feature>_semanticsLabel_<control>`) and an id from `lib/app/keys.dart`, both on the
  node that carries the tap: wrap it in `SemanticAction`, or pass `identifier:` to a shared
  widget that does (`PillButton`, `ProjectCard`, `ThemeModeSwitcher`).
- Never put an id on a plain `Semantics` around a tap target: the id lands on a node above the
  action, and automation finds a node it cannot activate.
- When a `label` replaces what the control shows, wrap the visible text in `ExcludeSemantics`,
  or it is read after the label.
- Every page root carries its screen id through `SemanticId`.
- Ids are never literals in widgets. Repeated controls build theirs from data with the helpers
  in `keys.dart` (`projectsCardId(project.id)`).
