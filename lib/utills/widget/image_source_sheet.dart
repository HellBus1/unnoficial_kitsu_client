import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceBottomSheet extends StatefulWidget {
  final double? maxHeight;

  final double? maxWidth;

  final int? imageQuality;
  final CameraDevice preferredCameraDevice;
  final void Function(Uint8List)? onImage;
  final void Function(File)? onImageSelected;

  final Widget? cameraIcon;
  final Widget? galleryIcon;
  final Widget? cameraLabel;
  final Widget? galleryLabel;
  final EdgeInsets? bottomSheetPadding;

  ImageSourceBottomSheet({
    Key? key,
    this.maxHeight,
    this.maxWidth,
    this.imageQuality,
    this.preferredCameraDevice = CameraDevice.rear,
    this.onImage,
    this.onImageSelected,
    this.cameraIcon,
    this.galleryIcon,
    this.cameraLabel,
    this.galleryLabel,
    this.bottomSheetPadding,
  })  : assert(null != onImage || null != onImageSelected),
        super(key: key);

  @override
  _ImageSourceBottomSheetState createState() => _ImageSourceBottomSheetState();
}

class _ImageSourceBottomSheetState extends State<ImageSourceBottomSheet> {
  bool _isPickingImage = false;

  Future<void> _onPickImage(ImageSource source) async {
    if (_isPickingImage) return;
    _isPickingImage = true;
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: source,
      maxHeight: widget.maxHeight,
      maxWidth: widget.maxWidth,
      imageQuality: widget.imageQuality,
      preferredCameraDevice: widget.preferredCameraDevice,
    );
    _isPickingImage = false;
    if (null != pickedFile) {
      if (kIsWeb) {
        if (null != widget.onImage) {
          widget.onImage!(await pickedFile.readAsBytes());
        }
      } else {
        if (null != widget.onImageSelected) {
          // Warning:  this will not work on the web platform because pickedFile
          // will instead point to a network resource.
          final imageFile = File(pickedFile.path);
          // assert(null != imageFile);
          widget.onImageSelected!(imageFile);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !_isPickingImage,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 20, top: 20),
          padding: widget.bottomSheetPadding,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: widget.cameraIcon,
                title: widget.cameraLabel,
                onTap: () => _onPickImage(ImageSource.camera),
              ),
              ListTile(
                leading: widget.galleryIcon,
                title: widget.galleryLabel,
                onTap: () => _onPickImage(ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
