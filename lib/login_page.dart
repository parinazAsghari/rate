import 'package:eom_parinaz_asghari_sample/common.dart';
import 'package:eom_parinaz_asghari_sample/di/di_setup.dart';
import 'package:eom_parinaz_asghari_sample/dialog_widget.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/user_model.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/use_cases/check_user_exist.dart';
import 'package:eom_parinaz_asghari_sample/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var role;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 100.0),
          const Center(
            child: Text(
              'Welcome',
              style: TextStyle(color: Colors.amber,fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ),
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
            child: const Text('Login'),
            onPressed: () async{
              UserEntity userEntity = UserEntity(userName: userNameController.text ,password: passController.text);
              if(userNameController.text == 'parinaz' && passController.text == '123'){
                role  = RoleEnum.admin;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   MainPage(userEntity: userEntity,role: role,),),
                );
              }else{
                UserEntity? user = await getIt<CheckUserExistUseCase>().call(userNameController.text, passController.text);
                if(user==null){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const MessageDialogWidget(
                        dismissible: true,
                        title: '',
                        body: 'لطفا نام کاربری یا گذرواژه صحیح وارد نمایید',
                      );
                    },
                  );
                }else{
                  role  = RoleEnum.user;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>   MainPage(userEntity: user,role: role,),),
                  );
                }

              }
            },
          )
        ],
      ),
    );
  }
}