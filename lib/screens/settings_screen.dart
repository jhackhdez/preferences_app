import 'package:flutter/material.dart';

import '../widgets/side_menu.dart';

class SettingsScreen extends StatelessWidget {
  static const String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ajustes',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                  value: true,
                  title: const Text('Darkmode'),
                  onChanged: (value) {}),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  title: const Text('Maculino'),
                  groupValue: 1,
                  onChanged: (value) {}),
              const Divider(),
              RadioListTile<int>(
                  value: 2,
                  title: const Text('Femenino'),
                  groupValue: 1,
                  onChanged: (value) {}),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: 'Jorgitin',
                  decoration: const InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre de usuario'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
