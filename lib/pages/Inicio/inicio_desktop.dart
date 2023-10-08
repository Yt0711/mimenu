import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_restaurant/pages/Inicio/info_order/info_order.dart';
import 'package:home_restaurant/pages/Inicio/zones/zone_desktop.dart';
import 'package:home_restaurant/pages/home/bloc/restaurant_bloc.dart';
import 'package:home_restaurant/src/repositories/firestore_repository.dart';

import 'bloc/table_bloc.dart';

class InicioDesktop extends StatelessWidget {
  const InicioDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoaded) {
              return BlocProvider(
                create: (context) => TableBloc(
                    state.restaurant.reference?.id ?? '',
                    context.read<FireStoreRepository>()),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: ZoneDesktop()),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Expanded(child: InfoOrder())],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
