import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
import 'package:flutter/material.dart';

class CityDisabiguationSheet extends StatelessWidget {
  final List<GeocodingModel> cities;
  final Function(GeocodingModel) onSelect;

  const CityDisabiguationSheet({
    super.key,
    required this.cities,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A2E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Qual cidade você deseja ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            itemCount: cities.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.white10),
            itemBuilder: (context, index) {
              final city = cities[index];
              return ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  "${city.name}, ${city.state ?? ''}",
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  city.country,
                  style: const TextStyle(color: Colors.white54),
                ),
                onTap: () {
                  onSelect(city);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
