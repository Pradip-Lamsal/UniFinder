import 'dart:async';

import 'package:bus_application/main.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../../auth/presentation/view/login_view.dart';

class SettingsView extends StatefulWidget {
  final void Function(bool) onThemeChanged;
  const SettingsView({super.key, required this.onThemeChanged});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _isDarkMode = false;
  GyroscopeEvent? _gyroscopeEvent;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    _isDarkMode = MyApp.isDarkModeNotifier.value;

    // Listen to gyroscope events
    _streamSubscriptions.add(
      gyroscopeEventStream().listen(
        (GyroscopeEvent event) {
          setState(() {
            _gyroscopeEvent = event;

            // Toggle theme based on X-axis tilt
            if (event.x > 2 && !_isDarkMode) {
              _isDarkMode = true;
              widget.onThemeChanged(true);
            } else if (event.x < -2 && _isDarkMode) {
              _isDarkMode = false;
              widget.onThemeChanged(false);
            }
          });
        },
        onError: (e) {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Sensor Not Found"),
                content: Text(
                    "It seems that your device doesn't support Gyroscope Sensor"),
              );
            },
          );
        },
        cancelOnError: true,
      ),
    );

    // Listen to theme changes from the global notifier
    MyApp.isDarkModeNotifier.addListener(() {
      setState(() {
        _isDarkMode = MyApp.isDarkModeNotifier.value;
      });
    });
  }

  @override
  void dispose() {
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void _toggleTheme(bool value) {
    setState(() => _isDarkMode = value);
    widget.onThemeChanged(value);
  }

  void _handleLogout() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Theme Mode',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Switch(value: _isDarkMode, onChanged: _toggleTheme),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tilt your device to toggle theme (X-axis)',
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Gyroscope Data:\nX: ${_gyroscopeEvent?.x.toStringAsFixed(1) ?? '0.0'}, '
                      'Y: ${_gyroscopeEvent?.y.toStringAsFixed(1) ?? '0.0'}, '
                      'Z: ${_gyroscopeEvent?.z.toStringAsFixed(1) ?? '0.0'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your privacy matters. We safeguard your data with strict security protocols. '
                      'Only essential information is collected to enhance your app experience.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Us',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'We’re a team passionate about education. Since 2023, we’ve been creating tools '
                      'to make learning accessible and enjoyable for everyone.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _handleLogout,
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
