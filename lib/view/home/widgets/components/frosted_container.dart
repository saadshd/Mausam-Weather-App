import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedContainer extends StatelessWidget {
  final Widget child;
  final double height;

  const FrostedContainer({super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: height,
          color: Colors.transparent,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.07),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ]),
                ),
              ),
              Center(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
