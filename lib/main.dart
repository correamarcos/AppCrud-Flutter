import 'package:app_crud/provider/users_provider.dart';
import 'package:app_crud/routes/app.routs.dart';
import 'package:app_crud/views/user_form.dart';
import 'package:app_crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new UsersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Page Principal",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: {
          AppRouts.HOME: (_) => UserList(),
          AppRouts.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
