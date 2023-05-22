import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/loader.dart';
import '../../auth/controller/auth_countroller.dart';
import '../../models/user_model.dart';
import '../widgets/bottom_chat_field.dart';
import '../widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final name = routeArgs['name'];
    final Uid = routeArgs['uid'];
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(Uid!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!),
                  Text(
                    snapshot.data!.isOnline ? 'online' : 'offline',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          ChatList(
            recieverUserId: Uid,
          ),
          BottomChatField(
            recieverUserId: Uid,
          ),
        ],
      ),
    );
  }
}
