class TimeUtils {
  static String timeAgo(Object value) {
    late final DateTime date;

    if (value is String) {
      date = DateTime.parse(value);
    } else if (value is DateTime) {
      date = value;
    } else {
      throw ArgumentError('Expected String or DateTime');
    }

    return _timeAgo(date);
  }

  static String _timeAgo(DateTime date) {
    date = date.toLocal();
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inSeconds < 60) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()}mo';
    return '${(diff.inDays / 365).floor()}y';
  }
}
