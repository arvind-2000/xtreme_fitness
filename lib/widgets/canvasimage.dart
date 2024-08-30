import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CorsImage extends StatefulWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const CorsImage({
    Key? key,
    required this.imageUrl,
    this.width = 200.0,
    this.height = 200.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  _CorsImageState createState() => _CorsImageState();
}

class _CorsImageState extends State<CorsImage> {
  Uint8List? _imageBytes;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchImage();
  }

  Future<void> _fetchImage() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // Use a CORS proxy to bypass restrictions
      final proxyUrl = 'https://cors-anywhere.herokuapp.com/';
      final response = await http.get(
        Uri.parse('$proxyUrl${widget.imageUrl}'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _imageBytes = response.bodyBytes;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      print('Error fetching image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_hasError || _imageBytes == null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Icon(Icons.error, color: Colors.red),
        ),
      );
    }

    return Image.memory(
      _imageBytes!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }
}
