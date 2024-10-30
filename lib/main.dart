import 'package:flutter/material.dart';

import 'package:cc206_benta/features/home_view.dart';

void main() {
  runApp(
      MaterialApp(
          title: 'Benta',
          color: Color.fromRGBO(87, 144, 8, 1),
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primaryColor: Color.fromRGBO(87, 144, 8, 1),
            fontFamily: 'Inter',
              fontFamilyFallback: ['Arial']
          ),
          debugShowCheckedModeBanner: true,
          debugShowMaterialGrid: false,
          home: HomeView()
      )
  );
}
