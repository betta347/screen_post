part of "../splash_screen.dart";

mixin SplashMixin on State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
    Future.delayed(
      const Duration(seconds: 2),
      () {
        nextToNavigation();
      },
    );
  }

  void nextToNavigation() {
    if (!mounted) {
      return;
    }
    context.goNamed(Routes.home);
    return;
  }
}
