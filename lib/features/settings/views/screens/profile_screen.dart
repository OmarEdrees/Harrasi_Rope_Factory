import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/dash_board/views/widgets/item_of_settings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height * 0.04,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.02),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'Active',
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: CircleAvatar(
                radius: SizeConfig.width * 0.07,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.02),
              child: Text(
                'Full Name',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
            ItemOfSettings(
              leading: Icons.person,
              title: 'Omar',
            ),
            SizedBox(height: 25),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.02),
              child: Text(
                'Email',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
            ItemOfSettings(
              leading: Icons.mail,
              title: 'edreesomar2007@gmail.com',
            ),
            SizedBox(height: 25),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.02),
              child: Text(
                'Phone Number',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
            ItemOfSettings(
              leading: Icons.call,
              title: '01110780935',
            ),
            SizedBox(height: 25),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.02),
              child: Text(
                'His job',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
            ItemOfSettings(
              leading: Icons.work,
              title: 'Manufacturing',
            )
          ],
        ),
      ),
    ));
  }
}
