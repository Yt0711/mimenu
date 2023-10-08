import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_restaurant/pages/home/bloc/restaurant_bloc.dart';

import '../../src/repositories/firestore_repository.dart';
import 'bloc/manager_bloc.dart';

//Cargamos el bloc y repositorio segun el estado del usuario

class HomePageWrapper extends StatelessWidget {
  final Widget child;
  final currentUser = FirebaseAuth.instance.currentUser;
  final instance = FirebaseFirestore.instance;
  HomePageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FireStoreRepository(instance),
      child: BlocProvider(
        create: (context) => ManagerBloc(context.read<FireStoreRepository>())
          ..add(ManagerLoad(currentUser!.uid)),
        child: BlocBuilder<ManagerBloc, ManagerState>(
          builder: (context, state) {
            if (state is ManagerInitial || state is ManagerLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ManagerLoaded) {
              return BlocProvider(
                create: (context) => RestaurantBloc()
                  ..add(
                    RestaurantLoad(state.restaurants.first),
                  ),
                child: child,
              );
            } else if (state is ManagerError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<ManagerBloc>()
                              .add(ManagerLoad(currentUser!.uid));
                        },
                        child: const Text('Reintentar')),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text('Logout'),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}
