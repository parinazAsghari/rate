import 'package:eom_parinaz_asghari_sample/di/di_setup.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/use_cases/add_user_use_case.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(height: 100.0),

             TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 20.0),
             TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              child: const Text('submit'),
              onPressed: () async {
                var result = await getIt<AddUserUseCase>().call(UserEntity(userName: userNameController.text,password: passController.text));
                setState(() {
                  userNameController.clear();
                  passController.clear();
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}