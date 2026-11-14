import 'package:domain/domain.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_test/server_test.dart';
import 'package:my_portfolio_jaspr/app/app.dart';
import 'package:my_portfolio_jaspr/app/site_content.dart';
import 'package:my_portfolio_jaspr/services/file_asset_loader.dart';

void main() {
  late Map<Language, SiteContent> content;

  setUpAll(() async {
    Jaspr.initializeApp();
    content = await loadSiteContent(const FileAssetLoader('../../package/data'));
  });

  testServer('the home page renders the content in English at the root', (tester) async {
    tester.pumpComponent(App(content: content));

    final response = await tester.request('/');
    final document = response.document!;
    final user = content[Language.en]!.user;

    expect(response.statusCode, 200);
    expect(document.querySelector('html')!.attributes['lang'], 'en');
    expect(document.querySelector('title')!.text, user.name);
    expect(document.querySelector('h1')!.text, user.headline);
    expect(document.querySelector('.hero__accent')!.text, user.headlineAccent);
    expect(document.querySelectorAll('.experience-row'), hasLength(user.experience.length));
    expect(
      document.querySelectorAll('.project-card'),
      hasLength(content[Language.en]!.home.featuredProjects.take(3).length),
    );
    expect(document.querySelector('.nav-link--selected')!.text, content[Language.en]!.strings.shell_navHome);
  });

  testServer('the Ukrainian home page lives under /uk and links back to English', (tester) async {
    tester.pumpComponent(App(content: content));

    final document = (await tester.request('/uk')).document!;
    final uk = content[Language.uk]!;

    expect(document.querySelector('html')!.attributes['lang'], 'uk');
    expect(document.querySelector('h1')!.text, uk.user.headline);
    expect(document.querySelector('.site-footer__title')!.text, uk.strings.shell_footerTitle);
    final english = document.querySelector('.language-toggle__pill[hreflang="en"]')!;
    expect(english.attributes['href'], '/');
    final alternates = document.querySelectorAll('link[rel="alternate"]').map((l) => l.attributes['hreflang']);
    expect(alternates, containsAll(['en', 'uk', 'x-default']));
  });
}
