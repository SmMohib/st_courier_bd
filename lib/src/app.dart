import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_curier_bd/src/component/colors/colors.dart';
import 'package:st_curier_bd/src/screens/home_screen.dart';
import 'package:st_curier_bd/src/services/auth/loginScreen.dart';
import 'package:st_curier_bd/src/services/auth/otp_screen.dart';
import 'package:st_curier_bd/src/services/auth/registrationScreen.dart';
import 'package:st_curier_bd/src/widgets/custom_gridview.dart';

class App extends StatelessWidget {
  App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: primaryColor),
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(fontSize: 16.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        //GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/registrationScreen", page: () => RegistrationScreen()),
        //GetPage(name: "/", page: () => LoginScreen())
      ],
      // home: CustomGridView(),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';

    return const MaterialApp(
      title: appName,
      home: MyHomePage(
        title: appName,
      ),
    );
  }
}

//////---------------------------------/////////////
class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            'Text with a background color',
            // TRY THIS: Change the Text value
            //           or change the Theme.of(context).textTheme
            //           to "displayLarge" or "displaySmall".
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          // TRY THIS: Change the seedColor to "Colors.red" or
          //           "Colors.blue".
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
