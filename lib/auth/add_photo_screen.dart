import 'package:flutter/material.dart';
import 'package:teentaj/models/user_registration.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({super.key, required this.userRegistration});
  final UserRegistration userRegistration;

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final picker = ImagePicker();
  String? _imagePath;

  bool _isLoading = false;
  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  void registerUser(context) async {
    setState(() {
      _isLoading = true;
    });

    await _userProvider
        .registerUser(widget.userRegistration, _imagePath, context)
        .then((response) {
      if (response is Success) {
        Navigator.pop(context);
        Navigator.pushNamed(context, BottomNavigationScreen.id);
      }
    });

    setState(() {
      _isLoading = false;
    });
  }

  Future pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
          title: Text(
            'Profile Picture',
            style: TextStyle(color: yellow),
          ),
        ),
        body: CustomModalProgressHUD(
          inAsyncCall: _isLoading,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add photo',
                style: TextStyle(color: yellow, fontSize: 30),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: _imagePath == null
                              ? const ImagePortrait(imageType: ImageType.NONE)
                              : ImagePortrait(
                                  imagePath: _imagePath,
                                  imageType: ImageType.FILE_IMAGE,
                                ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: _imagePath == null
                                ? RoundedIconButton(
                                    onPressed: pickImageFromGallery,
                                    iconData: Icons.add,
                                    buttonColor: Colors.grey,
                                    iconSize: 20,
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CRoundButton(
                function: () {
                  print(widget.userRegistration.localProfilePhotoPath);
                  _imagePath == null
                      ? showSnackBar('please select the image', context)
                      : registerUser(context);
                },
                text: 'Sign Up',
                color: yellow,
                textColor: black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
