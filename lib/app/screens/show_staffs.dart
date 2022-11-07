import 'package:flutter/material.dart';
import '../widgets/circular_profile_image.dart';

class ShowStaffs extends StatelessWidget {
  const ShowStaffs({super.key});

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
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              leading: CircularProfileImage(
                imageUrl:
                    'https://static.remove.bg/remove-bg-web/ea3c274e1b7f6fbbfe93fad8b2b13d7ef352f09c/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg',
              ),
              title: Text(
                'Dnalf  fadlksdsaf sdfasdf adf asdf adfsdafads fasdfaf',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
