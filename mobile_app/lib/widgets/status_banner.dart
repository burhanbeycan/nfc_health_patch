import 'package:flutter/material.dart';

class StatusBanner extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color? color;

  const StatusBanner({
    super.key,
    required this.message,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: color ?? Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(child: Text(message)),
        ],
      ),
    );
  }
}
