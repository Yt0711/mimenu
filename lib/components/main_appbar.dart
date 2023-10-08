import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_restaurant/pages/home/bloc/restaurant_bloc.dart';

import '../pages/home/bloc/manager_bloc.dart';
import '../src/models/restaurant.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantLoaded) {
            final restaurant = state.restaurant;
            return Text(restaurant.name.toUpperCase());
          }
          return const Text('Error');
        },
      ),
      actions: [
        BlocBuilder<ManagerBloc, ManagerState>(
          builder: (context, state) {
            if (state is ManagerLoaded) {
              final restaurants = state.restaurants;
              return DropdownButton<Restaurant>(
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Cambiar restaurante',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                items: restaurants
                    .map((e) => DropdownMenuItem<Restaurant>(
                        value: e,
                        child: Text(
                          e.name,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        )))
                    .toList(),
                onChanged: (Restaurant? value) {
                  if (value != null) {
                    context.read<RestaurantBloc>().add(RestaurantLoad(value));
                  }
                },
              );
            }
            return const Text('Error');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
