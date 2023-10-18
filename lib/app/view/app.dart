import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ubenwa_nkechi/app/app.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    initialization();
    super.initState();
  }

  Future <void> initialization() async {
    await Future.delayed(const Duration(seconds: 2),
        FlutterNativeSplash.remove,);
  }

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}




class AppView extends StatefulHookConsumerWidget  {
  const AppView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppViewState();
}

class _AppViewState extends ConsumerState<AppView> {
  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            theme: AppTheme.light,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            routerConfig: appRouter,
          );
          },);
  }
}
