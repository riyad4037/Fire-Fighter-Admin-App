import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../common/utils/utils.dart';
import '../features/models/user_model.dart';

final firestore = FirebaseFirestore.instance;

class EmergencySentScreen extends StatelessWidget {
  const EmergencySentScreen({super.key});

  void emergencyChatOpen(BuildContext context) async {
    try {
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        String emergencyPhoneNumber = '01755973848';
        String selectedPhoneNum = emergencyPhoneNumber.replaceAll(
          ' ',
          '',
        );
        if (selectedPhoneNum.substring(selectedPhoneNum.length - 10) ==
            userData.phoneNumber.substring(userData.phoneNumber.length - 10)) {
          isFound = true;
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamed(
            '/chatScreen',
            arguments: {
              'name': userData.name,
              'uid': userData.uid,
            },
          );
        }
      }

      if (!isFound) {
        showSnackBar(
          context: context,
          content: 'This number does not exist on this app.',
        );
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Messege Sent'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'আপনার জন্য জরুরী সাহায্য চাওয়া হয়েছে।',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.chat,
                          color: Colors.amber,
                        ),
                        iconSize: 80,
                        onPressed: () {
                          emergencyChatOpen(context);
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Open Emergency Chat",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.punch_clock,
                          color: Colors.amber,
                        ),
                        iconSize: 80,
                        onPressed: () {}),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "সতর্কতা",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
