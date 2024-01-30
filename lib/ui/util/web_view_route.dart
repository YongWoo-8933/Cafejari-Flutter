

sealed class WebViewRoute {
  final String title;
  final Uri uri;

  WebViewRoute(this.title, this.uri);

  factory WebViewRoute.faq() => _FAQ("FAQ", Uri.parse("https://cafejari.notion.site/FAQ-fe06c2a91b12495095b3908f51e1c555?pvs=4"));
  factory WebViewRoute.guide() => _Guide("가이드", Uri.parse("https://www.notion.so/cafejari/cf3f4cad62174b34acb2be8a88cb90fb?pvs=4"));
  factory WebViewRoute.notification() => _Notification("공지사항", Uri.parse("https://cafejari.notion.site/3ebe53162df04aa79146765424bf5c80?pvs=4"));
  factory WebViewRoute.update() => _Update("업데이트 소식", Uri.parse("https://cafejari.notion.site/a81ea1d045f24d26865b68373e30e15f?pvs=4"));
  factory WebViewRoute.insta() => _Insta("카페자리 인스타", Uri.parse("https://www.instagram.com/cafejari_official/"));
  factory WebViewRoute.blog() => _Blog("카페자리 블로그", Uri.parse("https://blog.naver.com/cafejari22"));
  factory WebViewRoute.privacyPolicy() => _PrivacyPolicy("개인정보 처리방침", Uri.parse("https://cafejari.co.kr/privacy_policy/"));
  factory WebViewRoute.tos() => _TOS("서비스 이용약관", Uri.parse("https://cafejari.co.kr/tos/"));
  factory WebViewRoute.inquiry() => _Inquiry("1:1문의", Uri.parse("https://cafejari.notion.site/FAQ-fe06c2a91b12495095b3908f51e1c555?pvs=4"));
  factory WebViewRoute.userMigration() => _UserMigration("사용자 정보 이전", Uri.parse("https://cafejari.notion.site/71335bdfd0f34ff3b8d96fef97ab9c82?pvs=4"));
  factory WebViewRoute.custom({required String title, required String url}) => _Custom(title, Uri.parse(url));

}

class _FAQ extends WebViewRoute { _FAQ(super.index, super.tag); }
class _Guide extends WebViewRoute { _Guide(super.index, super.tag); }
class _Notification extends WebViewRoute { _Notification(super.index, super.tag); }
class _Update extends WebViewRoute { _Update(super.index, super.tag); }
class _Insta extends WebViewRoute { _Insta(super.index, super.tag); }
class _Blog extends WebViewRoute { _Blog(super.index, super.tag); }
class _PrivacyPolicy extends WebViewRoute { _PrivacyPolicy(super.index, super.tag); }
class _TOS extends WebViewRoute { _TOS(super.index, super.tag); }
class _Inquiry extends WebViewRoute { _Inquiry(super.index, super.tag); }
class _UserMigration extends WebViewRoute { _UserMigration(super.index, super.tag); }
class _Custom extends WebViewRoute { _Custom(super.index, super.tag); }
