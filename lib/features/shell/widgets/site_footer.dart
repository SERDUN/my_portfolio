import 'package:material_ui/material_ui.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:domain/domain.dart';

import 'package:my_portfolio/app/navigation.dart';
import 'package:my_portfolio/core/core.dart';
import 'package:my_portfolio/localization/localization.dart';
import 'package:my_portfolio/style/style.dart';

import 'package:my_portfolio/app/contacts/contacts.dart';
import 'package:my_portfolio/app/keys.dart';

/// Dark footer band: "Let's talk", the email, the social links as pills, and
/// the bottom line with the flag and secondary navigation.
class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  static const String _sourceUrl = 'https://github.com/SERDUN/my_portfolio';

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      color: palette.footer,
      child: ContentWidth(
        padding: EdgeInsets.only(top: isMobile ? 40 : 80, bottom: isMobile ? 28 : 40),
        child: BlocBuilder<ContactsCubit, ContactsState>(
          buildWhen: (previous, current) => previous.contacts != current.contacts,
          builder: (context, state) {
            final email = state.contacts.where((c) => c.isEmail).firstOrNull;
            final socials = state.contacts.where((c) => !c.isEmail).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ContactBlock(email: email, socials: socials),
                SizedBox(height: isMobile ? 24 : 56),
                const _BottomLine(sourceUrl: _sourceUrl),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ContactBlock extends StatelessWidget {
  const _ContactBlock({required this.email, required this.socials});

  final ContactModel? email;
  final List<ContactModel> socials;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final textTheme = Theme.of(context).textTheme;
    final isWide = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final heading = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Eyebrow(context.l10n.shell_navContacts, color: palette.footerAccent),
        const SizedBox(height: 18),
        Text(
          context.l10n.shell_footerTitle,
          style: (isMobile ? textTheme.headlineLarge : textTheme.displayMedium)?.copyWith(color: palette.footerText),
        ),
        if (email != null) ...[
          const SizedBox(height: 18),
          SemanticAction.link(
            identifier: shellFooterEmailId,
            child: InkWell(
              onTap: () => openExternalUrl(email!.link),
              child: Text(
                email!.displayValue,
                style: GoogleFonts.fraunces(
                  fontSize: isMobile ? 20 : 28,
                  color: palette.footerText,
                  decoration: TextDecoration.underline,
                  decorationColor: palette.footerAccent,
                  decorationThickness: 1.5,
                ),
              ),
            ),
          ),
        ],
      ],
    );

    final pills = Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: isWide ? WrapAlignment.end : WrapAlignment.start,
      children: [for (final contact in socials) _SocialPill(contact: contact)],
    );

    if (!isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [heading, const SizedBox(height: 24), pills],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(flex: 7, child: heading),
        const SizedBox(width: 40),
        Expanded(flex: 5, child: pills),
      ],
    );
  }
}

class _SocialPill extends StatelessWidget {
  const _SocialPill({required this.contact});

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SemanticAction(
      identifier: shellFooterSocialId(contact.title),
      child: OutlinedButton(
        onPressed: () => openExternalUrl(contact.link),
        style: OutlinedButton.styleFrom(
          foregroundColor: palette.footerText,
          side: BorderSide(color: palette.footerLine),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          minimumSize: const Size(44, 44),
        ),
        child: Text(contact.title),
      ),
    );
  }
}

class _BottomLine extends StatelessWidget {
  const _BottomLine({required this.sourceUrl});

  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = context.l10n;
    final linkStyle = Theme.of(context).textTheme.bodySmall?.copyWith(color: palette.footerMuted);

    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    final glory = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _UkraineFlag(),
        const SizedBox(width: 10),
        Text(l10n.shell_footerGlory, style: linkStyle),
      ],
    );
    final links = Wrap(
      spacing: 22,
      runSpacing: 4,
      alignment: isMobile ? WrapAlignment.start : WrapAlignment.end,
      children: [
        _FooterLink(
          identifier: shellFooterProjectsId,
          label: l10n.shell_navProjects,
          style: linkStyle,
          onTap: context.openProjects,
        ),
        _FooterLink(
          identifier: shellFooterUsefulId,
          label: l10n.useful_title,
          style: linkStyle,
          onTap: context.openUseful,
        ),
        _FooterLink(
          identifier: shellFooterSourceId,
          label: l10n.shell_footerSource,
          style: linkStyle,
          onTap: () => openExternalUrl(sourceUrl),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: palette.footerLine)),
      ),
      child: isMobile
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [links, const SizedBox(height: 12), glory])
          : Row(
              children: [
                glory,
                const SizedBox(width: 24),
                Expanded(child: links),
              ],
            ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.identifier, required this.label, required this.onTap, this.style});

  final String identifier;
  final String label;
  final VoidCallback onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SemanticAction.link(
      identifier: identifier,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          // 22 px of text plus 24 px of padding keeps the target at least 44 px tall.
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: Text(label, style: style),
        ),
      ),
    );
  }
}

class _UkraineFlag extends StatelessWidget {
  const _UkraineFlag();

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: SizedBox(
          width: 18,
          height: 12,
          child: Column(
            children: [
              Expanded(child: Container(color: const Color(0xFF3A7BD5))),
              Expanded(child: Container(color: const Color(0xFFF2C94C))),
            ],
          ),
        ),
      ),
    );
  }
}
