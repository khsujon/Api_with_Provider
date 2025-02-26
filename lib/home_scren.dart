import 'package:api_with_provider/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: userProvider.Users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userProvider.Users[index].name.toString()),
                    subtitle: Text(userProvider.Users[index].email.toString()),
                    leading: CircleAvatar(
                      child: Text(userProvider.Users[index].id.toString()),
                    ),
                    trailing: Text(
                        userProvider.Users[index].company!.name.toString()),
                  );
                });
          }
        },
      ),
    );
  }
}
