import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  // Esta línea garantiza la iniciualización de todos los widgets para evitar el crash de 'SharedPreferences.getInstance()'
  WidgetsFlutterBinding.ensureInitialized();
  // De esta forma haciendo el main async, se puede inicializar las Preferences
  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      // Esto permite saber desde el Provider el theme guardado
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarmode: Preferences.isDarkmode))
    ],
    // Luego se manda a correr la app
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
