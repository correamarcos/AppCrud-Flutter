import 'package:app_crud/data/dummy_users.dart';
import 'package:app_crud/provider/users_provider.dart';
import 'package:app_crud/routes/app.routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lista de Usuarios"),
        actions: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRouts.USER_FORM,
                );
              },
              icon: Icon(Icons.add)
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: users.count,
            itemBuilder: (context, index){
              return ListTile(
                  leading: users.byIndex(index).avatarUrl == null
                      || users.byIndex(index).avatarUrl.isEmpty
                      ? CircleAvatar(child: Icon(Icons.person))
                      : CircleAvatar(backgroundImage: NetworkImage(users.byIndex(index).avatarUrl)),
                  title: Text(users.byIndex(index).name),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: (){
                              Navigator.of(context).pushNamed(
                                AppRouts.USER_FORM,
                                arguments: users.byIndex(index),
                              );
                            }
                        ),
                        IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Excluir Usuario'),
                                    content: Text('Tem certeza que deseja excluir o usuario ' + users.byIndex(index).name.toUpperCase() + ' ?'),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Não'),
                                      ),
                                      TextButton(
                                          onPressed: (){
                                            Provider.of<UsersProvider>(context, listen: false).remove(users.byIndex(index));
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Sim'),
                                      ),
                                    ],
                                  )
                              );
                            }
                        ),
                      ],
                    ),
                  ),
                );
            }
        ),
      ),
    );
  }
}
