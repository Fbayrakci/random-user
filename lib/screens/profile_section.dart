import 'package:flutter/material.dart';
import 'package:sample_api/models/user.dart';
import 'package:sample_api/screens/get_location.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key, required this.user});
  final User user;
  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const _profiledetails(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: CircleAvatar(
                      maxRadius: height / 10,
                      minRadius: height / 20,
                      backgroundImage: NetworkImage(widget.user.picture.large),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 100,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          widget.user.dob.age.toString(),
                          style: TextStyle(
                              color: Theme.of(context).cardColor, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
              const _sizedBox(),
              const Text('Name'),
              nametextFormField(Icons.person, widget.user.name.first),
              const _sizedBox(),
              const Text('Surname'),
              surnametextFormField(Icons.person, widget.user.name.last),
              const _sizedBox(),
              const Text('Mail'),
              mailtextFormField(Icons.mail, widget.user.email),
              const _sizedBox(),
              const Text('Gender'),
              gendertextFormField(Icons.mail, widget.user.gender),
              const _sizedBox(),
              getLocation(context, widget.user), // Pass user data here
            ],
          ),
        ),
      ),
    );
  }
}

class _profiledetails extends StatelessWidget {
  const _profiledetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Profile Details");
  }
}

// ignore: camel_case_types
class _sizedBox extends StatelessWidget {
  const _sizedBox();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

Widget nametextFormField(
  IconData chooseIcon,
  String name,
) {
  return TextFormField(
    readOnly: true,
    decoration: InputDecoration(
        suffixIcon: Icon(chooseIcon),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: name,
        label: Text(name),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        filled: true,
        fillColor: Colors.white54),
  );
}

Widget surnametextFormField(
  IconData chooseIcon,
  String surname,
) {
  return TextFormField(
    readOnly: true,
    decoration: InputDecoration(
        suffixIcon: Icon(chooseIcon),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: surname,
        label: Text(surname),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        filled: true,
        fillColor: Colors.white54),
  );
}

Widget mailtextFormField(
  IconData chooseIcon,
  String mail,
) {
  return TextFormField(
    readOnly: true,
    decoration: InputDecoration(
        suffixIcon: Icon(chooseIcon),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: mail,
        label: Text(mail),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        filled: true,
        fillColor: Colors.white54),
  );
}

Widget gendertextFormField(
  IconData chooseIcon,
  String gender,
) {
  return TextFormField(
    readOnly: true,
    decoration: InputDecoration(
        suffixIcon: Icon(chooseIcon),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: gender,
        label: Text(gender),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        filled: true,
        fillColor: Colors.white54),
  );
}

Widget getLocation(BuildContext context, User user) {
  return Center(
    child: ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GetLocation(user: user),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(
        Icons.location_on,
        color: Colors.white,
      ),
      label: const Text(
        'Get Location',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
