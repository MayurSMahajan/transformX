import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transformx/app_ui/app_ui.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      primaryColor: AppColors.primaryYellow,
      canvasColor: _canvasColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      buttonTheme: _buttonTheme,
      splashColor: AppColors.transparent,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      filledButtonTheme: _filledButtonTheme,
      colorScheme: _colorScheme,
      bottomSheetTheme: _bottomSheetTheme,
      listTileTheme: _listTileTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      navigationBarTheme: _navigationBarTheme,
      chipTheme: _chipTheme,
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primaryYellow,
    ).copyWith(
      background: AppColors.faintYellowBackground,
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.lightBlue.shade300,
      backgroundColor: AppColors.black,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  Color get _backgroundColor => AppColors.faintYellowBackground;

  Color get _canvasColor => AppColors.faintYellowAccent;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      titleTextStyle: _textTheme.titleLarge,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: _canvasColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.onBackground,
    );
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.outlineLight,
      space: AppSpacing.lg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.lg,
      endIndent: AppSpacing.lg,
    );
  }

  TextTheme get _textTheme => uiTextTheme;

  /// The UI text theme based on [UITextStyle].
  static final uiTextTheme = TextTheme(
    displayLarge: UITextStyle.headline1,
    displayMedium: UITextStyle.headline2,
    displaySmall: UITextStyle.headline3,
    headlineMedium: UITextStyle.headline4,
    headlineSmall: UITextStyle.headline5,
    titleLarge: UITextStyle.headline6,
    titleMedium: UITextStyle.subtitle1,
    titleSmall: UITextStyle.subtitle2,
    bodyLarge: UITextStyle.bodyText1,
    bodyMedium: UITextStyle.bodyText2,
    labelLarge: UITextStyle.button,
    bodySmall: UITextStyle.caption,
    labelSmall: UITextStyle.overline,
  ).apply(
    bodyColor: AppColors.liver,
    displayColor: AppColors.liver,
    decorationColor: AppColors.liver,
  );

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      suffixIconColor: AppColors.mediumEmphasisSurface,
      prefixIconColor: AppColors.mediumEmphasisSurface,
      hoverColor: AppColors.inputHover,
      focusColor: AppColors.inputFocused,
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      hintStyle: UITextStyle.headline4.copyWith(
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: const UnderlineInputBorder(),
      errorStyle: UITextStyle.caption,
    );
  }

  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
    );
  }

  FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.overlayYellow,
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(200, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        textStyle: _textTheme.labelLarge,
        backgroundColor: Colors.amber,
        foregroundColor: AppColors.black,
      ),
    );
  }

  OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(80, 50),
        side: BorderSide(color: Colors.grey.shade700, width: 1.25),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        textStyle: _textTheme.labelLarge,
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w400,
        ),
        foregroundColor: AppColors.black,
      ),
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.lg),
          topRight: Radius.circular(AppSpacing.lg),
        ),
      ),
    );
  }

  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: AppColors.onBackground,
      contentPadding: EdgeInsets.all(AppSpacing.lg),
    );
  }

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.primaryYellow,
      circularTrackColor: AppColors.borderOutline,
    );
  }

  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: UITextStyle.button,
      labelColor: AppColors.blueDress,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md + AppSpacing.xxs,
      ),
      unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: AppColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: AppColors.blueDress,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}

InputBorder get _textFieldBorder => const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Colors.grey,
      ),
    );

NavigationBarThemeData get _navigationBarTheme {
  return const NavigationBarThemeData(
    indicatorColor: AppColors.orange,
    backgroundColor: AppColors.primaryYellow,
    iconTheme: MaterialStatePropertyAll(
      IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}

ChipThemeData get _chipTheme {
  return const ChipThemeData(
    backgroundColor: AppColors.transparent,
  );
}

/// {@template app_dark_theme}
/// Dark Mode App [ThemeData].
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  @override
  ThemeData get themeData {
    return super.themeData.copyWith(
          canvasColor: AppColors.darkCanvasColor,
          textTheme: _textTheme,
          navigationBarTheme: _navigationBarTheme,
        );
  }

  @override
  ColorScheme get _colorScheme {
    return const ColorScheme.dark().copyWith(
      primary: AppColors.white,
      secondary: AppColors.secondary,
      background: AppColors.grey.shade900,
    );
  }

  @override
  AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.darkCanvasColor,
    );
  }

  @override
  TextTheme get _textTheme {
    return AppTheme.uiTextTheme.apply(
      bodyColor: AppColors.surface2,
      displayColor: AppColors.surface2,
      decorationColor: AppColors.surface2,
    );
  }

  @override
  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.lightBlue.shade300,
      backgroundColor: AppColors.grey.shade300,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w200,
        ),
        foregroundColor: AppColors.white,
      ),
    );
  }

  @override
  Color get _backgroundColor => AppColors.onDarkBackgroundColor;

  @override
  IconThemeData get _iconTheme {
    return const IconThemeData(color: AppColors.white);
  }

  NavigationBarThemeData get _navigationBarTheme {
    return const NavigationBarThemeData(
      indicatorColor: AppColors.orange,
      backgroundColor: AppColors.darkCanvasColor,
      iconTheme: MaterialStatePropertyAll(
        IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.onBackground,
      space: AppSpacing.lg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.lg,
      endIndent: AppSpacing.lg,
    );
  }
}
