import 'package:eom_parinaz_asghari_sample/add_user_page.dart';
import 'package:eom_parinaz_asghari_sample/common.dart';
import 'package:eom_parinaz_asghari_sample/di/di_setup.dart';
import 'package:eom_parinaz_asghari_sample/dialog_widget.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/user_entity.dart';
import 'package:eom_parinaz_asghari_sample/feature/rating/vote_entity.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/use_cases/add_vote_use_case.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/use_cases/get_user_use_case.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/use_cases/get_vote_use_case.dart';
import 'package:eom_parinaz_asghari_sample/local_db/domain/use_cases/is_voted_by_who_is_voting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.userEntity,
    required this.role,
  }) : super(key: key);
  final UserEntity userEntity;
  final RoleEnum role;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<UserEntity> userList ;
  @override
  void initState() {
      getIt<GetUserUseCase>().call().then((value) {
        userList = value;
        userList.removeWhere((item) => item.id == widget.userEntity.id);
        setState(() {

        });
      });
    super.initState();
  }
bool isDisabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            widget.role == RoleEnum.admin
                ? Row(
                    children: [
                      Tooltip(
                        message: 'اضافه کردن کارمندان',
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddUserPage()),
                            );
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        body:widget.role == RoleEnum.user? Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index)  {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('${userList[index].userName}'),
                      const SizedBox(
                        height: 10,
                      ),
                      RatingBar(
                        initialRating: 0,
                        itemCount: 3,
                        ratingWidget: RatingWidget(
                          full:  Icon(
                            Icons.star,
                            color: isDisabled ? Colors.grey :Colors.amber,
                          ),
                          empty: const Icon(
                            Icons.star,
                            color: Colors.grey,
                          ),
                          half: const Icon(
                            Icons.star,
                            color: Colors.greenAccent,
                          ),
                        ),
                        onRatingUpdate:  (double value) async {
                        bool? result =  await getIt<IsVotedByWhoIsVotingUseCase>().call(widget.userEntity.id!, userList[index].id!);
                        if(result == false){
                          await getIt<AddVoteUseCase>().call(
                              VoteEntity(
                                  whoIsVoted: userList[index].id,
                                  whoIsVoting: widget.userEntity.id,
                                  rate: value
                              )
                          );
                          isDisabled = false;
                          setState(() {

                          });
                        }else{
                          isDisabled = true;
                          setState(() {

                          });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const MessageDialogWidget(
                                dismissible: true,
                                title: '',
                                body: 'شما قبلا به این کاربر رای داده اید',
                              );
                            },
                          );

                        }
                         // var result  = await getIt<GetVoteUseCase>().call();

                        }
                      ),
                    ],
                  ),
                );
              }),
        ) :Container()
    );
  }
}
