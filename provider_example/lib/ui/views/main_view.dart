import 'package:flutter/material.dart';
import 'package:provider_example/app/routes.dart';
import 'package:provider_example/app/viewstate.dart';
import 'package:provider_example/core/viewmodels/main_view_model.dart';
import 'package:provider_example/ui/views/base_view.dart';
import 'package:provider_example/ui/views/user_profile_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Main View'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Hola'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      onPressed: () {
                        model.getUsersFromApi();
                      },
                      child: Text('Ir a lista de usuarios')),
            ),
            model.userList == null
                ? SizedBox.shrink()
                : Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: model.userList.length,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      userProfileViewRoute,
                                      arguments: model.userList[index]);
                                },
                                child: Text(
                                  model.userList[index].nombre.toString(),
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              )
                            ],
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
