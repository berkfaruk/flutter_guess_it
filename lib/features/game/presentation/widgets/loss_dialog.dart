import 'package:flutter/material.dart';
import 'package:flutter_guess_it/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class LossDialog extends StatelessWidget {
  final String word;
  const LossDialog({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColors.red,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sentiment_very_dissatisfied,
            size: 60,
            color: Theme.of(context).colorScheme.surface,
          ),
          SizedBox(height: 20),
          Text(
            'You Loss!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
          SizedBox(height: 10),
          Text(
            'The correct answer: $word!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.pop();
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Home',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.red,
                      fontSize: 16,
                    ),
              ))
        ],
      ),
    );
  }
}
