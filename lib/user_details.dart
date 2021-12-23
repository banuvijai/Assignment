import 'package:assignment/Core/user_model.dart';
import 'package:assignment/utils/app_colors.dart';
import 'package:assignment/utils/app_constants.dart';
import 'package:flutter/material.dart';


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
        ///Removed Back Button
        backgroundColor: primaryColor,
        title: AppConstants.userDetailHeading,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListView.builder(
              ///if removing shrinkwrap and physics attributes, cannot able to scroll the list
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:20,
                itemBuilder: (BuildContext context, int index) {
                  UserDetailResponse u = widget.userDetailResponse!.elementAt(index);
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    padding:EdgeInsets.all(15.0),
                    height: MediaQuery.of(context).size.height/4,
                    decoration: BoxDecoration(color:Colors.grey[200],borderRadius:BorderRadius.circular(10.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            AppConstants.userDetailId,
                            SizedBox(width:120),
                            Text(u.id.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            AppConstants.userDetailTitle,
                            SizedBox(width:100),
                            ///Removed the Scroll option of Axis.horizontal
                            ///using Flexible to prevent text overflowing
                            Flexible(child: Text(u.title!)),
                          ],
                        ),
                        Row(
                          children: [
                            AppConstants.userDetailThumbnail,
                            SizedBox(width:40),
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
    );
  }
}
