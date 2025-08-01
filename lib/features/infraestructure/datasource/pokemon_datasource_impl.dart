import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/core/constants/environments.dart';
import 'package:pokedex_app/features/domain/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/features/domain/entities/pokemon_service_entity.dart';
import 'package:pokedex_app/features/infraestructure/mappers/pokemon_services_mapper.dart';

class PokemonDatasourceImpl implements PokemonDataSource{
  final dio = Dio(BaseOptions(
  baseUrl: Environments.pokeApiUrl,
  )
);

  @override
  Future<List<PokemonServiceEntity>> getPokemonList({int offset = 0, int limit = 20}) async{
    try{
      final response = await dio.get('',
      queryParameters: {
        'offset': offset,
        'limit': limit,
      });

      final results = response.data['results'] as List;
      final List<PokemonServiceEntity> detailPokemon = [];

      for(final pokemon in results) {
        try {
          final pokemonUrl = pokemon['url'] as String;
        final id = _extractIdFromUrl(pokemonUrl);

        final detailPokemonEntity = await getPokemonById(id);
        detailPokemon.add(detailPokemonEntity);
        } catch (e) {
          debugPrint('Error $e');
          continue;
      }
    }
    return detailPokemon;
    } on DioException catch (e) {
      throw _handleDioError(e, 'Error al obtener la lista de Pokemons');
    } catch (e) {
      debugPrint('Error $e');
      throw Exception('Error al obtener la lista de Pokemons');
    }
  }

  @override
  Future<PokemonServiceEntity> getPokemonById(int id) async {
    try {
      final response = await dio.get('/pokemon/$id');
      final Map<String, dynamic> data = response.data;
      final pokemonResponse = PokemonServiceMapper.fromJson(data);
      return pokemonResponse;
    } 
    on DioException catch (e) {
      throw _handleDioError(e, 'Error al obtener el Pokémon por ID - $id');
    } catch (e) {
      throw Exception('Error inesperado $e');
    }
  }

  Exception _handleDioError(DioException e, String context) {
    switch(e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      return Exception('$context: Tiempo de respuesta agotado');

      case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      switch (statusCode) {
        case 400:
          return Exception('$context: Recurso no encontrado (400)');
        case 500:
          return Exception('$context: Error interno del servidor (500)');
        case 429:
        return Exception('$context: Demasiadas solicitudes, intente de nuevo más tarde (429)');
        default:
          return Exception('$context: Error de HTTP $statusCode');
      }

      case DioExceptionType.cancel:
        return Exception('$context: Solicitud cancelada');

      default: return Exception('$context: ${e.message ?? 'Error desconocido'}');
    }
  }

  int _extractIdFromUrl(String url) {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }
}