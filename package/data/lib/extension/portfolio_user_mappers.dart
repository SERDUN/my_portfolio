import 'package:domain/domain.dart';

import '../dto/dto.dart';
import 'uri_parsing.dart';

extension PortfolioUserDtoMapper on PortfolioUserDTO {
  /// Missing text fields read as empty strings so the UI never branches on
  /// null for copy that is simply absent in one locale.
  PortfolioUserModel toDomain() => PortfolioUserModel(
    firstName: firstName ?? '',
    secondName: secondName ?? '',
    position: position ?? '',
    intro: intro ?? '',
    avatar: parseWebUri(avatarUrl, field: 'avatar_url'),
    cv: parseWebUri(cvUrl, field: 'cv_url'),
    location: location ?? '',
    headline: headline ?? '',
    headlineAccent: headlineAccent ?? '',
    experienceSince: experienceSince,
    experience: [
      for (final item in experience ?? const <ExperienceDTO>[])
        if ((item.company ?? '').isNotEmpty) item.toDomain(),
    ],
  );
}

extension ExperienceDtoMapper on ExperienceDTO {
  /// Callers drop entries without a company first; the rest read as empty.
  ExperienceModel toDomain() => ExperienceModel(
    company: company ?? '',
    role: role ?? '',
    period: period ?? '',
    terms: terms ?? '',
    summary: summary ?? '',
    highlights: [
      for (final line in highlights ?? const <String>[])
        if (line.trim().isNotEmpty) line,
    ],
  );
}
