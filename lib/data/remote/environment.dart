class Environments {
  static const String PRODUCTION = 'https://kitsu.io/api/edge';
  static const String DEV = '';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.PRODUCTION;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': '',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://kitsu.io/api/edge/',
    },
  ];

  static String? getEnvironments() {
    return _availableEnvironments
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
