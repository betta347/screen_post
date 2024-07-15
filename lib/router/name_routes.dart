part of "app_routes.dart";

sealed class Routes {
  Routes._();

  static const String initial = "/";
  static const String home = '/entrance';

  static const String instagram = "/instagramMessage";

  static const String myPost = "/myPost";

  static const String telegram = "/telegramMessage";

  static const String twitter = "/twitterPost";
}
