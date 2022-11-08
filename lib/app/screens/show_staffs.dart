import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staff_manager/app/models/firestore_user_model.dart';
import 'package:staff_manager/app/screens/staff_details.dart';
import '../widgets/circular_profile_image.dart';

class ShowStaffs extends StatelessWidget {
  ShowStaffs({super.key});
  final _staffCollection = FirebaseFirestore.instance.collection('staffs');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Staff Manager',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder(
          
          stream: _staffCollection.snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot<Object?>> staffsList =
                  snapshot.data?.docs ?? [];

              return ListView.builder(
                itemCount: staffsList.length,
                itemBuilder: (context, index) {
                  final staff = FirestoreUserModel.fromDocument(
                    staffsList[index],
                  );

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StaffDetails(
                            staffDetails: staff,
                          ),
                        ),
                      );
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProfileImage(imageUrl: staff.profilePic),
                    ),
                    title: Text(
                      staff.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'No Staff is Available!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
