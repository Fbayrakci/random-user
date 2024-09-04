import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_api/constant/colors.dart';
import 'package:sample_api/screens/profile_section.dart';
import 'package:sample_api/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserApi>(context, listen: false).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserApi>(context).users;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBar.title,
          style: TextStyle(color: ThemeColors.backgroundColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ThemeColors.appBarColor,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final userColor =
                user.gender == "male" ? ThemeColors.maleColor : ThemeColors.femaleColor;
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileSection(user: user),
                  ),
                );
              },
              leading: CircleAvatar(
                  backgroundColor: userColor, child: Image.network(user.picture.thumbnail)),
              trailing: CircleAvatar(
                backgroundColor: userColor,
                child: Text(user.name.first[0].toUpperCase() + user.name.last[0].toUpperCase()),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.email),
            );
          }),
    );
  }
}

class appBar {
  static String title = "Random User API";
}
