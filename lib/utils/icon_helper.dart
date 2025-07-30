import 'package:flutter/material.dart';

class IconHelper {
  // Map emojis to Material Icons as fallbacks
  static const Map<String, IconData> _emojiToIcon = {
    // Hindu symbols
    '🕉️': Icons.self_improvement,
    '🏔️': Icons.landscape,
    '🌊': Icons.waves,
    
    // Islamic symbols
    '🕌': Icons.mosque,
    '☪️': Icons.nightlight,
    '⭐': Icons.star,
    '🌙': Icons.nightlight,
    
    // Christian symbols
    '⛪': Icons.church,
    '✝️': Icons.add_circle_outline,
    
    // Sikh symbols
    '🏛️': Icons.account_balance,
    '🙏': Icons.favorite,
    '☬': Icons.merge_type,
    
    // Buddhist symbols
    '🧘': Icons.self_improvement,
    '☸️': Icons.track_changes,
    
    // Jain symbols
    '🏯': Icons.temple_buddhist,
    '⛩️': Icons.temple_buddhist,
    
    // Others
    '🪷': Icons.local_florist,
    
    // Default fallback
    'default': Icons.place,
  };

  static const Map<String, Color> _religionColors = {
    'Hinduism': Colors.orange,
    'Islam': Colors.teal,
    'Christianity': Colors.blue,
    'Sikhism': Colors.amber,
    'Buddhism': Colors.purple,
    'Jainism': Colors.cyan,
    'Others': Colors.green,
  };

  /// Get Material Icon for emoji with fallback
  static IconData getIconForEmoji(String emoji) {
    return _emojiToIcon[emoji] ?? _emojiToIcon['default']!;
  }

  /// Get color for religion
  static Color getColorForReligion(String religion) {
    return _religionColors[religion] ?? Colors.grey;
  }

  /// Check if emoji is supported (basic check)
  static bool isEmojiSupported(String emoji) {
    // Simple check - in a real app, you might want a more sophisticated check
    return emoji.isNotEmpty && emoji.length <= 4;
  }

  /// Get display widget for emoji with fallback to icon
  static Widget getDisplayWidget(String emoji, {
    double size = 24,
    Color? color,
    Color? backgroundColor,
  }) {
    try {
      // Try to display emoji first
      return Container(
        width: size + 16,
        height: size + 16,
        decoration: BoxDecoration(
          color: backgroundColor?.withOpacity(0.1),
          borderRadius: BorderRadius.circular((size + 16) / 2),
        ),
        child: Center(
          child: Text(
            emoji,
            style: TextStyle(
              fontSize: size,
              fontFamily: 'NotoColorEmoji', // Try emoji font first
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } catch (e) {
      // Fallback to Material Icon
      return Container(
        width: size + 16,
        height: size + 16,
        decoration: BoxDecoration(
          color: backgroundColor?.withOpacity(0.1),
          borderRadius: BorderRadius.circular((size + 16) / 2),
        ),
        child: Center(
          child: Icon(
            getIconForEmoji(emoji),
            size: size,
            color: color,
          ),
        ),
      );
    }
  }
}
