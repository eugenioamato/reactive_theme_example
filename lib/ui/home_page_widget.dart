import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_theme_example/ui/selection_button.dart';
import 'package:reactive_theme_example/services/app_theme_notifier.dart';
import 'package:reactive_theme_example/services/brighness_mode_enum.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late AppThemeNotifier _appThemeStateProvider;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    _appThemeStateProvider = context.read(appThemeStateProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _appThemeStateProvider.refresh(_appThemeStateProvider.getState());
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final _themeMode = _appThemeStateProvider.getState();
    final height = MediaQuery.of(context).size.height;
    int vstep = (height < 500) ? 2 : 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reactive Theme Example',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 500,
              ),
              child: Flex(direction: Axis.vertical, mainAxisAlignment: MainAxisAlignment.center, children: [
                Spacer(
                  flex: 6 ~/ vstep,
                ),
                Flexible(
                  flex: 4 ~/ vstep,
                  child: PinnedButton(
                    text: 'Light App Theme',
                    icon: Icons.light_mode,
                    maxWidth: 600,
                    callBack: () => _appThemeStateProvider.setAppTheme(context, BrightnessMode.Light),
                    isActive: _themeMode == BrightnessMode.Light,
                  ),
                ),
                Spacer(
                  flex: vstep,
                ),
                Flexible(
                  flex: 4 ~/ vstep,
                  child: PinnedButton(
                    text: 'Dark App Theme',
                    icon: Icons.dark_mode,
                    maxWidth: 600,
                    callBack: () => _appThemeStateProvider.setAppTheme(context, BrightnessMode.Dark),
                    isActive: _themeMode == BrightnessMode.Dark,
                  ),
                ),
                Spacer(
                  flex: vstep,
                ),
                Flexible(
                  flex: 4 ~/ vstep,
                  child: PinnedButton(
                    text: 'Default App Theme',
                    icon: Icons.smartphone,
                    maxWidth: 600,
                    callBack: () => _appThemeStateProvider.setAppTheme(context, BrightnessMode.Default),
                    isActive: _themeMode == BrightnessMode.Default,
                  ),
                ),
                Container(
                  child: _themeMode == BrightnessMode.Default
                      ? Flexible(
                          flex: 4 ~/ vstep,
                          child: Text(
                            'Os mode: ' + SchedulerBinding.instance!.window.platformBrightness.toString(),
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Flexible(flex: 4 ~/ vstep, child: Text('')),
                ),
                Spacer(
                  flex: 6 ~/ vstep,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
