import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/datasources/mock_data_source.dart';
import 'package:food_delivery/data/repostitory/app_repository.dart';
import 'package:food_delivery/data/repostitory/app_repository_impl.dart';

import 'application.dart';

void main() {
  runApp(
    RepositoryProvider<AppRepository>(
        create: (context) {
          return AppRepositoryImpl(MockDataSource(DefaultAssetBundle.of(context)));
        },
      child: Application(),
    )
  );
}
