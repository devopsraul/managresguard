import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return PopScope(
          canPop: false, // Define si el pop está permitido
          onPopInvoked: (bool didPop) {
            // Este callback se invoca después de que se maneja el pop.
            // `didPop` es false si el pop fue bloqueado.
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.9),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
