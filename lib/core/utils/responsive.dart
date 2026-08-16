import 'package:material_ui/material_ui.dart';
import 'package:chathub/core/constants/screen_breakpoints.dart';

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < Breakpoints.mobile;
  bool get isTablet =>
      screenWidth >= Breakpoints.mobile && screenWidth < Breakpoints.desktop;
  bool get isDesktop => screenWidth >= Breakpoints.desktop;

  // show two panel layout
  bool get showDualPanel => screenWidth >= Breakpoints.mobile;
}
