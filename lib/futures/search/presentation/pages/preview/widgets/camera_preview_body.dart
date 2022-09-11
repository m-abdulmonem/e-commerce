import 'dart:io';

import 'package:ecommerce/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class CameraPreviewBody extends StatefulWidget {
  final String path;
  const CameraPreviewBody(this.path,{Key? key}) : super(key: key);

  @override
  State<CameraPreviewBody> createState() => _CameraPreviewBodyState();
}

class _CameraPreviewBodyState extends State<CameraPreviewBody> {
  CroppedFile? _croppedFile;

  @override
  void initState() {

    super.initState();

    _cropImage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _body()),
      ],
    );
  }



  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _image(),
          ),
          VerticalSpace(Get.height * .1),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      final path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: Image.file(File(path)),
      );
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: Image.file(File(widget.path)),
      );
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            _clear();
            String? path = _croppedFile != null ? _croppedFile?.path : widget.path;
            Get.toNamed("search/result",arguments: {'path' : path});
          },
          backgroundColor: colorPrimary,
          heroTag: "search",
          tooltip: 'Search',
          child: const Icon(Icons.search),
        ),
        if (_croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              heroTag: "crop",
              onPressed: () {
                _cropImage();
              },
              backgroundColor: colorGray,
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }

  Future<void> _cropImage() async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: widget.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop the item',
            toolbarColor: colorPrimary,
            toolbarWidgetColor: colorPrimaryText,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop the item',
        ),
        // WebUiSettings(
        //   context: context,
        //   presentStyle: CropperPresentStyle.dialog,
        //   boundary: const CroppieBoundary(
        //     width: 520,
        //     height: 520,
        //   ),
        //   viewPort:
        //       const CroppieViewPort(width: 480, height: 480, type: 'circle'),
        //   enableExif: true,
        //   enableZoom: true,
        //   showZoomer: true,
        // ),
      ],
    );
    if (croppedFile != null) {
      setState(() {
        _croppedFile = croppedFile;
      });
    }
  }

  void _clear() {
    setState(() {
      _croppedFile = null;
    });
  }
}
