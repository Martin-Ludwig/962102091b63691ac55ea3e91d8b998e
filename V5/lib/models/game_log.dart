// Martin Ludwig
// 26.12.2019


class GameLog {
  // singleton
  static GameLog _cachedLog;

  static List<String> _log = List<String>();
  final int maxSize;
  bool _isMuted = false;

  /// maxSize is only set on first call
  factory GameLog({maxSize = 10000}) {
    if (_cachedLog == null) {
      final _cachedLog = GameLog._internal(maxSize);
      return _cachedLog;
    } else {
      return _cachedLog;
    }
  }

  GameLog._internal(this.maxSize);

  void log(String s) {
    if (!isMuted) {
      if (isMaxsize) {
        _log.removeRange(0, size ~/ 100 + 1);
      }

      print(s);
      _log.add(s);
    }
  }

  List<String> get content => _log;
  int get size => _log != null ? _log.length : 0;
  String get lastEntry => _log.last;
  bool get isMaxsize => size == maxSize;

  String entryAt(int index) {
    if (0 <= index && index < size) {
      return _log.elementAt(index);
    } else {
      return "No entry found.";
    }
  }

  get isMuted => _isMuted;
  void mute() { _isMuted = true; }
  void unmute() { _isMuted = false; }


}