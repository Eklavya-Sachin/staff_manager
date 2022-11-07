import 'package:flutter/material.dart';
import 'package:staff_manager/app/widgets/circular_profile_image.dart';

class StaffDetails extends StatelessWidget {
  const StaffDetails({super.key});

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
            children: const [
              SizedBox(
                height: 50,
              ),
              CircularProfileImage(
                imageUrl: '',
                imageSize: 150,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Text(
                  'Sanoj Rajfasdfa sdfasdfasdf asdf adsf sda',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Age: 16',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),
              Text(
                'Mobile: 9549559453',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Text(
                  'Department: IT',
                  style: TextStyle(
                    fontSize: 30,
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
