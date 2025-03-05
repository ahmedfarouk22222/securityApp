import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:security_app/core/utils/app_router.dart';
import 'package:security_app/core/utils/assets_data.dart';
import 'package:security_app/features/splash/presentation/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AssetsData.splashpic, height: 250, width: 250,fit:  BoxFit.contain),
          SlidingText(slidingAnimation: slidingAnimation,),
          const SizedBox(height: 20),
          // const Text(
          //   "Your Security, Our Priority",
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);

   animationController.forward().then((_) async {
  await Future.delayed(const Duration(seconds: 1));
  navigateToHome();
});
  }

  void navigateToHome() {
    GoRouter.of(context).go(AppRouter.kloginView);
  }
}
