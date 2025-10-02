import 'package:flutter/material.dart';
import 'package:moorland_fix/app/shared/services/index.dart';

// theme
import 'package:moorland_fix/app/theme/index.dart';

// shared
import 'package:moorland_fix/app/shared/index.dart';

import '../../../auth/domain/entities/user_entity.dart';

class CompactLayout extends StatefulWidget {
  const CompactLayout({super.key});

  @override
  State<CompactLayout> createState() => _CompactLayoutState();
}

class _CompactLayoutState extends State<CompactLayout> {
  int currentPageIndex = 0;
  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  void getUserProfile() async {
    final userProfile = UserProfile();
    UserEntity? userEntity = await userProfile.getUserProfile();
    setState(() {
      currentUser = userEntity;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(currentUser == null) return Center(child: CircularProgressIndicator());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if(currentUser!.photoUrl.isNotEmpty)
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  currentUser!.photoUrl,
                ),
                onBackgroundImageError: (_, __) {
                  // handle error if needed
                },
              ),
            const SizedBox(height: Constants.spaceMedium),
            Text("${currentUser?.name}"),
            const SizedBox(height: Constants.spaceSmall),
            Text("${currentUser?.email}"),
            const SizedBox(height: Constants.spaceSmall),
            Text("Is Admin : ${currentUser?.isAdmin == true ? "Yes" : "No"}")

          ]
        )
      ),
    );
  }
}
