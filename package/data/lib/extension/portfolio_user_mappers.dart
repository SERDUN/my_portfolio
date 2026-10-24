import 'package:domain/domain.dart';

import '../dto/portfolio_user_dto.dart';
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
  );
}
