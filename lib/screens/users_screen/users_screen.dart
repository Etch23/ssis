import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/create_user_screen/create_user_screen.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
import 'package:sprinkler_system/screens/users_screen/local_widgets/user_card.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/utils/gaps.dart';
import 'package:sprinkler_system/utils/util_values.dart';
import 'package:sprinkler_system/widgets/primary_button.dart';
import 'package:sprinkler_system/widgets/logout_button.dart';

import '../../widgets/custom_app_bar.dart';

class UsersScreen extends StatefulWidget {
  static const String routeName = '/users';

  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  CollectionReference info = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Users',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const LogoutButton(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: info.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Text("Error");
                }

                return ListView.separated(
                  physics: UtilValues.scrollPhysics,
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, i) {
                    final userProfile = snapshot.data!.docs[i];
                    return UserCard(
                        id: userProfile.id.substring(0, 10),
                        imageUrl: userProfile['imageUrl'],
                        name: userProfile['firstName'],
                        phone: userProfile['phoneNumber'],
                        email: userProfile['emailAddress'],
                        onTap: () {
                          Navigator.of(context).pushNamed(MainScreen.routeName);
                        });
                  },
                  separatorBuilder: (context, index) => Gaps.gap16,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: PrimaryButton(
              label: 'Create New User',
              onPressed: () {
                Navigator.of(context).pushNamed(CreateUserScreen.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}
