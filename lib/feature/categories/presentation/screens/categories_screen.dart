import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ComicsScreen extends StatelessWidget {
  const ComicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Comics Screen"));
  }
}
