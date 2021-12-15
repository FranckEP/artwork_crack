import 'package:artwork_crack/data/services/artwork_api.dart';
import 'package:artwork_crack/domain/models/artwork_state_model.dart';
import 'package:artwork_crack/ui/pages/content/arte_social/widgets/socialcard.dart';
import 'package:flutter/material.dart';

class arteSocial extends StatefulWidget {
  const arteSocial({Key? key}) : super(key: key);

  @override
  _arteSocialState createState() => _arteSocialState();
}

class _arteSocialState extends State<arteSocial> {

  @override
  Widget build(BuildContext context) {
    ArtWorkPoolService service = ArtWorkPoolService();
    Future<List<ArtWorkModel>> futureArtworks = service.fecthData();
    return FutureBuilder<List<ArtWorkModel>>(
      future: futureArtworks,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              ArtWorkModel artwork = items[index];
              return socialCard(
                title: "${artwork.title}",
                contenido: "Titulo largo: ${artwork.longTitle}.\n Artista: ${artwork.artist}.\n Lugar de produccion: ${artwork.productionPlaces.isNotEmpty?artwork.productionPlaces.first:"unknown"}.",
                imagenicon:  '',
                imagen: artwork.imageUrl,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}