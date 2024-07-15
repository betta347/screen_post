part of "package:screen_post/core/theme/themes.dart";

/// A set of colors for the entire app.
const ColorScheme colorLightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF222831),
  secondary: Color(0xFF393E46),
  onPrimary: Color(0xFF00ADB5),
  surface: Color(0xFFEEEEEE),
  onSurface: Colors.white,
  onSecondary: Color(0xFF36FF00),
  error: Color(0xFFFF6C6C),
  onError: Colors.red,
  surfaceContainerHighest: Color(0xFFFFB500),
  secondaryContainer: Color(0xFF000000),
);

///
// const ColorScheme colorDarkScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFF222831),
//   secondary: Color(0xFF393E46),
//   onPrimary: Color(0xFF00ADB5),
//   surface: Color(0xFFEEEEEE),
//   onSurface: Colors.white,
//   onSecondary: Color(0xFF36FF00),
//   error: Color(0xFFFF6C6C),
//   onError: Colors.red,
//   surfaceContainerHighest: Color(0xFFFFB500),
//   secondaryContainer: Color(0xFF000000),
// );

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.black,
    required this.grey,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.grey4,
    required this.green,
    required this.white,
    required this.whiteSmoke,
    required this.telegram,
    required this.telegramAppBarColor,
    required this.instagram,
    required this.twitter,
  });

  final Color black;
  final Color grey;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final Color grey4;
  final Color green;
  final Color white;
  final Color whiteSmoke;
  final Color telegram;
  final Color telegramAppBarColor;
  final Color instagram;
  final Color twitter;

  static const ThemeColors light = ThemeColors(
    black: Color(0xFF222831),
    grey: Color(0xFF393E46),
    grey1: Color(0xFF77797B),
    grey2: Color(0xFFABABAB),
    grey3: Color(0xFFD9D9D9),
    grey4: Color(0xFFEDEDED),
    green: Color(0xFF00ADB5),
    white: Color(0xFFEEEEEE),
    whiteSmoke: Color(0xFFEDEDED),
    telegram: Color(0xFF0088CC),
    telegramAppBarColor: Color(0xFF222D3D),
    instagram: Color(0xFFC13584),
    twitter: Color(0xFF1DA1F2),
  );

  // static const ThemeColors dark = ThemeColors(
  //   telegram: Color(0xFF0088CC),
  //   tgAppBarColor: Color(0xFF222D3D),
  //   instagram: Color(0xFFC13584),
  //   twitter: Color(0xFF1DA1F2),
  //   black: Color(0xFF222831),
  //   grey: Color(0xFF393E46),
  //   grey1: Color(0xFF77797B),
  //   grey2: Color(0xFFABABAB),
  //   grey3: Color(0xFFD9D9D9),
  //   grey4: Color(0xFFEDEDED),
  //   green: Color(0xFF00ADB5),
  //   white: Color(0xFFEEEEEE),
  //   whiteSmoke: Color(0xFFEDEDED),
  // );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? black,
    Color? grey,
    Color? grey1,
    Color? grey2,
    Color? grey3,
    Color? grey4,
    Color? green,
    Color? white,
    Color? whiteSmoke,
    Color? telegram,
    Color? telegramAppBarColor,
    Color? instagram,
    Color? twitter,
  }) =>
      ThemeColors(
        black: black ?? this.black,
        grey: grey ?? this.grey,
        grey1: grey1 ?? this.grey1,
        grey2: grey2 ?? this.grey2,
        grey3: grey3 ?? this.grey3,
        grey4: grey4 ?? this.grey4,
        green: green ?? this.green,
        white: white ?? this.white,
        whiteSmoke: whiteSmoke ?? this.whiteSmoke,
        telegram: telegram ?? this.telegram,
        telegramAppBarColor: telegramAppBarColor ?? this.telegramAppBarColor,
        instagram: instagram ?? this.instagram,
        twitter: twitter ?? this.twitter,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      black: Color.lerp(black, other.black, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      grey4: Color.lerp(grey4, other.grey4, t)!,
      green: Color.lerp(green, other.green, t)!,
      white: Color.lerp(white, other.white, t)!,
      whiteSmoke: Color.lerp(whiteSmoke, other.whiteSmoke, t)!,
      telegram: Color.lerp(telegram, other.telegram, t)!,
      telegramAppBarColor: Color.lerp(telegramAppBarColor, other.telegramAppBarColor, t)!,
      instagram: Color.lerp(instagram, other.instagram, t)!,
      twitter: Color.lerp(twitter, other.twitter, t)!,
    );
  }
}
