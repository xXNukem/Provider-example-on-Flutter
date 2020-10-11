import 'package:flutter/material.dart';
import 'package:provider_example/core/models/user.dart';
import 'package:provider_example/core/viewmodels/user_pofile_view_model.dart';
import 'package:provider_example/ui/views/base_view.dart';

class UserProfileView extends StatefulWidget {
  final User user;

  UserProfileView({@required this.user});

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<UserProfileViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('User Profile View'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('El usuario seleccionado es : ${this.widget.user.nombre}'),
            Text('La id del usuario es: ${this.widget.user.id}'),
          ],
        ),
      ),
    );
  }
}
