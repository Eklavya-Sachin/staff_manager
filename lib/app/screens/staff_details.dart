import 'package:flutter/material.dart';
import 'package:staff_manager/app/models/firestore_user_model.dart';
import 'package:staff_manager/app/widgets/circular_profile_image.dart';

class StaffDetails extends StatelessWidget {
  const StaffDetails({
    super.key,
    required this.staffDetails,
  });

  final FirestoreUserModel staffDetails;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Staff Details'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: const BackButton(),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 160,
                child: CircularProfileImage(
                  imageUrl: staffDetails.profilePic,
                  imageSize: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Text(
                  staffDetails.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Age: ${staffDetails.age}',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),
              Text(
                'Mobile: ${staffDetails.phoneNumber}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Text(
                  'Department: ${staffDetails.department}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
