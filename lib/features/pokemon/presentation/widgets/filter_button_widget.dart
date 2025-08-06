import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool showChevron;

  const FilterButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _getButtonWidth(context), 
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF333333),
          borderRadius: BorderRadius.circular(49),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Expanded(
              child: Text(
                text,
                style: textStyle.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, 
                overflow: TextOverflow.ellipsis, 
              ),
            ),
            if (showChevron) ...[
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 16,
              ),
            ],
          ],
        ),
      ),
    );
  }

  double _getButtonWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 32; 
    final buttonWidth = (availableWidth - 12) / 2; 
    
    return buttonWidth;
  }
} 