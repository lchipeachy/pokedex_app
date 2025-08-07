import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteServices {
  static const String _favoriteKey = 'pokemon_favorites';

  static Future<List<int>> getFavorites() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      final favoritesString = prefs.getString(_favoriteKey);
      if (favoritesString == null || favoritesString.isEmpty) {
        return [];
      }
      final List<dynamic> favoritesList = jsonDecode(favoritesString);
      return favoritesList.cast<int>();
    } catch (e) {
      debugPrint('''
        Archivo: favorite_services
        Método: getFavorites
        Error: $e
  ''');
      return [];
    }
  }

  static Future<bool> addFavorites(int pokemonId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentFavorites = await getFavorites();
      if(!currentFavorites.contains(pokemonId)) {
        currentFavorites.add(pokemonId);

        final favoritesString = jsonEncode(currentFavorites);
        await prefs.setString(_favoriteKey, favoritesString);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('''
        Archivo: favorite_services
        Método: addFavorites
        Error: $e
  ''');
      return false;
    }
  }

  static Future<bool> removeFavorites(int pokemonId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentFavorites = await getFavorites();
      if(currentFavorites.contains(pokemonId)) {
        currentFavorites.remove(pokemonId);

        final favoritesString = jsonEncode(currentFavorites);
        await prefs.setString(_favoriteKey, favoritesString);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('''
        Archivo: favorite_services
        Método: removeFavorites
        Error: $e
  ''');
      return false;
    }
  }

  static Future<bool> toggleFavorites(int pokemonId) async {
    try {
      final isFav = await isFavorites(pokemonId);
      if(isFav) {
        return await removeFavorites(pokemonId);
      } else {
        return await addFavorites(pokemonId);
      }
    } catch (e) {
      debugPrint('''
        Archivo: favorite_services
        Método: toggleFavorite
        Error: $e
  ''');
      return false;
    }
  }

  static Future<bool> isFavorites(int pokemonId) async {
    try {
      final favorites = await getFavorites();
      return favorites.contains(pokemonId);

    } catch (e) {
      debugPrint('''
        Archivo: favorite_services
        Método: isFavorites
        Error: $e
  ''');
      return false;
    }
  }

  static Future<bool> clearAllFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_favoriteKey);
      return true;
    } catch (e) {
      debugPrint('''
        Archivo: favorite_services
        Método: clearAllFavorites
        Error: $e
  ''');
      return false;
    }
  }

  static Future<int> getFavoritesCount() async {
    try {
      final favorites = await getFavorites();
      return favorites.length;
    } catch (e) {
      debugPrint('''
        Archivo: favorite_services
        Método: getFavoritesCount
        Error: $e
  ''');
      return 0;
    }
  }
}