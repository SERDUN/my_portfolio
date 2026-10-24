/// Stable semantics identifiers for UI automation. Visible text changes with
/// the language and repeats across screens; these never do. Widgets take an
/// id from here, never a literal. A dependency-free leaf: core and features
/// may both import it.
library;

/// `"Lune Café"` → `"lune_cafe"`: lower-case, runs of anything else joined
/// by one underscore, so ids built from data stay stable and readable.
String keySlug(String value) =>
    value.toLowerCase().replaceAll(RegExp('[^a-z0-9]+'), '_').replaceAll(RegExp(r'^_+|_+$'), '');

// Screens: anchor ids on each page root.
const String homeScreenId = 'home_screen';
const String projectsScreenId = 'projects_screen';
const String projectScreenId = 'project_screen';
const String contactsScreenId = 'contacts_screen';
const String usefulScreenId = 'useful_screen';
const String notFoundScreenId = 'not_found_screen';

// Shell: header, mobile menu, footer.
const String shellWordmarkId = 'shell_wordmark';
const String shellNavHomeId = 'shell_nav_home';
const String shellNavProjectsId = 'shell_nav_projects';
const String shellNavContactsId = 'shell_nav_contacts';
const String shellLanguageCompactId = 'shell_language_compact';
String shellLanguageOptionId(String languageCode) => 'shell_language_$languageCode';
const String shellThemeButtonId = 'shell_theme_button';
const String shellMenuButtonId = 'shell_menu_button';
String shellMenuItemId(String destination) => 'shell_menu_${keySlug(destination)}';
const String shellCvButtonId = 'shell_cv_button';
const String shellMenuCvButtonId = 'shell_menu_cv_button';
const String shellFooterEmailId = 'shell_footer_email';
String shellFooterSocialId(String title) => 'shell_footer_social_${keySlug(title)}';
const String shellFooterProjectsId = 'shell_footer_projects';
const String shellFooterUsefulId = 'shell_footer_useful';
const String shellFooterSourceId = 'shell_footer_source';

// Home.
const String homeDownloadCvId = 'home_download_cv';
const String homeSeeProjectsId = 'home_see_projects';
const String homeAllProjectsId = 'home_all_projects';
String homeProjectCardId(String projectId) => 'home_project_${keySlug(projectId)}';

// Projects list.
const String projectsFilterAllId = 'projects_filter_all';
String projectsFilterId(String platform) => 'projects_filter_${keySlug(platform)}';
String projectsCardId(String projectId) => 'projects_card_${keySlug(projectId)}';
const String projectsContactCtaId = 'projects_contact_cta';

// Project page.
const String projectBackId = 'project_back';
const String projectAppStoreId = 'project_app_store';
const String projectGooglePlayId = 'project_google_play';
const String projectGithubId = 'project_github';
const String projectNextId = 'project_next';
const String projectNotFoundBackId = 'project_not_found_back';

// Contacts page.
String contactsCardId(String title) => 'contacts_card_${keySlug(title)}';

// Useful commands page. Built from the command line itself, which is the
// same in every language (titles are translated, often into Cyrillic).
String usefulCopyId(String command) => 'useful_copy_${keySlug(command)}';

// Shared states.
const String statusRetryId = 'status_retry';
const String statusBannerRetryId = 'status_banner_retry';
const String notFoundHomeId = 'not_found_home';
