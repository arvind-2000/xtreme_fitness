
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;

String recognizeImageFormat(Uint8List bytes) {
  // Check for JPEG magic numbers
  if (bytes.length > 3 && bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
    return 'JPEG';
  }

  // Check for PNG magic numbers
  if (bytes.length > 8 &&
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47 &&
      bytes[4] == 0x0D &&
      bytes[5] == 0x0A &&
      bytes[6] == 0x1A &&
      bytes[7] == 0x0A) {
    return 'PNG';
  }

  return 'Unknown format';
}

  Future<Uint8List> resizeImage(Uint8List bytes,int width,int height) async {

    // Decode the image
    img.Image originalImage = img.decodeImage(bytes)!;

  
    // Resize the image to a width of 100 and height of 100
    img.Image resizedImage = img.copyResize(originalImage, width: width, height: height);

  // Compress the image
    Uint8List compressedImage = Uint8List.fromList(
    img.encodeJpg(resizedImage, quality: 50),
  );
    // Encode the image to Uint8List


    // Update the state with the resized image bytes

      return  compressedImage;
  }

Future<bool> isImageSizeExceeds(Uint8List imageData, {double widthThreshold = 500, double heightThreshold = 500}) async {
  Completer<bool> completer = Completer();

  final image = Image.memory(imageData);
  final imageStream = image.image.resolve(ImageConfiguration());

  imageStream.addListener(ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
    final width = imageInfo.image.width.toDouble();
    final height = imageInfo.image.height.toDouble();
    print("In image picker width: $width   height:$height");
    // Check if the image dimensions exceed the threshold values
    final exceedsSize = width > widthThreshold && height > heightThreshold;

    completer.complete(exceedsSize);
  }));

  return completer.future;
}


Future<void> uploadBytes(Uint8List bytes, String fileName) async {
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('https://your-api-endpoint.com/upload'), // Replace with your API endpoint
  );

  // Add the bytes to the request
  request.files.add(http.MultipartFile.fromBytes(
    'file', // The field name that the API expects
    bytes,
    filename: fileName,
  ));

  // Send the request
  final response = await request.send();

  if (response.statusCode == 200) {
    print('Bytes uploaded successfully');
  } else {
    print('Bytes upload failed with status code: ${response.statusCode}');
  }
}