import 'package:assignment/Core/user_model.dart';
import 'package:assignment/login.dart';
import 'package:assignment/utils/app_colors.dart';
import 'package:assignment/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/Core/user_repository.dart';

class UserDetails extends StatefulWidget {
  final List<UserDetailResponse>?  userDetailResponse;
  UserDetails({this.userDetailResponse});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(CupertinoIcons.back),onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      LoginPage()));
        },

        ),
        backgroundColor: primaryColor,
        title: AppConstants.userDetailHeading,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:20,
                    itemBuilder: (BuildContext context, int index) {
                      UserDetailResponse u = widget.userDetailResponse!.elementAt(index);
                      return Container(
                        margin: EdgeInsets.all(10.0),
                        padding:EdgeInsets.all(15.0),
                        height: MediaQuery.of(context).size.height/4,
                        width: double.infinity,
                        decoration: BoxDecoration(color:Colors.grey[200],borderRadius:BorderRadius.circular(10.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                AppConstants.userDetailId,
                                Text(u.id.toString()),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection:Axis.horizontal,
                                child: Row(
                                  children: [
                                    AppConstants.userDetailTitle,
                                    Text(u.title!),
                                  ],
                                )),
                            Row(
                              children: [
                                AppConstants.userDetailThumbnail,
                                Image(image: NetworkImage(u.thumbnailUrl!),height: 100,width: 100,),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
