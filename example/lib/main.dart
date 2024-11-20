import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'example.dart';
import 'full_map_example.dart';

final List<Example> _allPages = <Example>[
  FullMapExample(),
];

class MapsDemo extends StatelessWidget {
  void _pushPage(BuildContext context, Example page) async {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(page.title)),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MapboxMaps examples')),
      body: ListView.separated(
        itemCount: _allPages.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, int index) {
          final example = _allPages[index];
          return ListTile(
            leading: example.leading,
            title: Text(example.title),
            subtitle: (example.subtitle?.isNotEmpty == true)
                ? Text(
                    example.subtitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
            onTap: () => _pushPage(context, _allPages[index]),
          );
        },
      ),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const token = '';
  const endpoint = '';
  if (token == '' || endpoint == '') {
    throw Exception(['設定してないよ！！！']);
  }
  MapboxOptions.setAccessToken(token);
  MapboxMapsOptions.setBaseUrl(endpoint);
  runApp(MaterialApp(home: MapsDemo()));
}
