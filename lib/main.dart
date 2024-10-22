import 'package:expenses_tracker/presentations/choose_mode/bloc/choose_mode_cubit.dart';
import 'package:expenses_tracker/presentations/dashboard/bloc/dashboard_cubit.dart';
import 'package:expenses_tracker/presentations/splash/ui/splash_screen.dart';
import 'package:expenses_tracker/sevice_locator.dart';
import 'package:expenses_tracker/utils/const/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //initial Bloc
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
  );

  //initial Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initial dependencies
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_) => ChooseModeCubit()),
        BlocProvider(create: (_) => DashboardCubit())

      ],
      child: BlocBuilder<ChooseModeCubit, ThemeMode>(
        builder: (context, mode) {
          print("Current theme mode: $mode");
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      )
    );
  }

}
