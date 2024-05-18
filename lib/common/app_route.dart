import 'package:flutter/material.dart';

import '../features/destination/domain/entities/destination_entity.dart';
import '../features/destination/presentation/pages/dashboard.dart';
import '../features/destination/presentation/pages/detail_destination_page.dart';
import '../features/destination/presentation/pages/search_destination_page.dart';

class AppRoute {
  static const dashboard = '/';
  static const detailDestination = '/destination/detail';
  static const searchDestination = '/destination/search';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );
      case detailDestination:
        final destination = settings.arguments;
        if (destination == null || destination is! DestinationEntity) {
          return _invalidArgumentPage;
        }
        return MaterialPageRoute(
          builder: (context) => DetailDestinationPage(
            destination: destination,
          ),
        );
      case searchDestination:
        return MaterialPageRoute(
          builder: (context) => const SearchDestinationPage(),
        );
      default:
        return _notFoundPage;
    }
  }

  static MaterialPageRoute get _notFoundPage => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        ),
      );

  static MaterialPageRoute get _invalidArgumentPage => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Invalid Argument'),
          ),
        ),
      );
}
