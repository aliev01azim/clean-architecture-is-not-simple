import 'package:auth/src/bloc/auth_bloc.dart';
import 'package:auth/src/screens/auth_screen.dart';
import 'package:auth/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:auth/src/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/helpers.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(this.user, {super.key});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success screen'),
        actions: [
          IconButton(
            key: key,
            icon: const Icon(Icons.info),
            onPressed: () => showInfo(context, key,
                'Здесь я показал аксесс и рефреш токены, \n говоря о том что если вы \n ставили галочку вначале то вы  прошли \n и логин,ведь токены оттуда'),
          ),
          w10,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h8,
              InfoField('USERNAME - ${user.username}'),
              h16,
              InfoField('FIRSTNAME - ${user.firstName}'),
              h16,
              InfoField('LASTNAME - ${user.lastName}'),
              h16,
              InfoField('ACTIVATIONCODE - ${user.activationCode}'),
              h16,
              InfoField('EMAIL - ${user.email}'),
              h16,
              InfoField('PHONE - ${user.phone}'),
              h16,
              InfoField('ID - ${user.id}'),
              h16,
              InfoField('PASSWORD - ${user.password}'),
              h16,
              InfoField('ISACTIVE - ${user.isActive}'),
              h16,
              InfoField('REFRESHTOKEN - ${user.refreshToken}'),
              h16,
              InfoField('ACCESSTOKEN - ${user.accessToken}'),
              h16,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AuthBloc>().add(AuthLogoutEvent());
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AuthScreen()),
            (_) => false,
          );
        },
        child: const Icon(Icons.logout_rounded),
      ),
    );
  }
}
