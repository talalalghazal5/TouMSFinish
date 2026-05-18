import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'endpoints.dart';

class ApiService {
  final Dio dio = DioClient.dio;

  Future<dynamic> postRequest({
    required String endpoint,
    dynamic data,
    String? token,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: {if (token != null) 'Authorization': 'Bearer $token'},
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(
          "✅ POST for $endpoint return successfully with response body => ${response.data}",
        );
        return response.data;
      } else {
        throw Exception(
          '❌ POST $endpoint failed with status code: ${response.statusCode}, body: ${response.data}',
        );
      }
    } on DioException catch (e) {
      print('❌ DioException on POST $endpoint => ${e.message}');
      String? errorMessage =
          'please check your internet connection try again later';
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
        print('Response data: $data');
        print('Status code: ${e.response?.statusCode}');
        if (data is Map<String, dynamic> && data.containsKey('message:')) {
          errorMessage = data['message:'];
        }
      }
      return {'errormessage': errorMessage};
    } catch (e) {
      print('❌ Unexpected error on POST $endpoint => $e');
      throw Exception('Unexpected error: $e');
    }
  }

  Future<dynamic> getRequest({required String endpoint, String? token}) async {
    try {
      final response = await dio.get(
        endpoint,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer ${Endpoints.token}',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ GET $endpoint => ${response.data}");
        return response.data;
      } else {
        throw Exception(
          '❌ GET $endpoint failed with status code: ${response.statusCode}, body: ${response.data}',
        );
      }
    } on DioException catch (e) {
      print('❌ DioException on GET $endpoint => ${e.message}');
      String? errorMessage =
          'please check your internet connection try again later';
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
         print('Response data: $data');
        print('Status code: ${e.response?.statusCode}');
        if (data is Map<String, dynamic> && data.containsKey('message')) {
          errorMessage = data['message'];
        }
      }
      return {'errormessage': errorMessage};
    } catch (e) {
      print('❌ Unexpected error on GET $endpoint => $e');
      throw Exception('Unexpected error: $e');
    }
  }

  Future<dynamic> deleteRequest({
    required String endpoint,
    String? token,
  }) async {
    try {
      final response = await dio.delete(
        endpoint,
        options: Options(
          headers: {if (token != null) 'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("✅ DELETE $endpoint => ${response.data}");
        return response.data ?? {'message': 'Deleted successfully'};
      } else {
        throw Exception(
          '❌ DELETE $endpoint failed with status code: ${response.statusCode}, body: ${response.data}',
        );
      }
    } on DioException catch (e) {
      print('❌ DioException on DELETE $endpoint => ${e.message}');
      String? errorMessage =
          'please check your internet connection try again later';
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
         print('Response data: $data');
        print('Status code: ${e.response?.statusCode}');
        if (data is Map<String, dynamic> && data.containsKey('message:')) {
          errorMessage = data['message:'];
        }
      }
      return {'errormessage': errorMessage};
    } catch (e) {
      print('❌ Unexpected error on DELETE $endpoint => $e');
      throw Exception('Unexpected error: $e');
    }
  }

  Future<dynamic> login(Map<String, dynamic> data) async {
    return await postRequest(endpoint: Endpoints.login, data: data);
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    return await postRequest(endpoint: Endpoints.register, data: data);
  }

  Future<dynamic> postProfile(Map<String, dynamic> data) async {
    return await postRequest(
      endpoint: Endpoints.postProfile,
      data: data,
      token: Endpoints.token,
    );
  }

  Future<dynamic> updateProfile(FormData data) async {
    return await postRequest(
      endpoint: Endpoints.updateProfile,
      data: data,
      token: Endpoints.token,
    );
  }

  Future<dynamic> getProfile() async {
    return await getRequest(
      endpoint: Endpoints.getProfile,
      token: Endpoints.token,
    );
  }

  Future<dynamic> getDestinationByType(String type) async {
    final endpoint = '/destinations/$type';
    return await getRequest(endpoint: endpoint, token: Endpoints.token);
  }

  Future<dynamic> getMyTours() async {
    return await getRequest(
      endpoint: Endpoints.getallTours,
      token: Endpoints.token,
    );
  }

  Future<dynamic> getFaqSupports() async {
    return await getRequest(
      endpoint: Endpoints.getFaqSupport,
      token: Endpoints.token,
    );
  }

  Future<dynamic> addtofavorite(int tourId) async {
    final endpoint = '/tours/$tourId/favorite';
    return await postRequest(endpoint: endpoint, token: Endpoints.token);
  }

  Future<dynamic> removefromFavorite(int tourId) async {
    final endpoint = '/tours/$tourId/favorite';
    return await deleteRequest(endpoint: endpoint, token: Endpoints.token);
  }

  Future<dynamic> getFromFavorite() async {
    return await getRequest(
      endpoint: Endpoints.getFromFavorite,
      token: Endpoints.token,
    );
  }

  Future<dynamic> postToGetBookingId(Map<String, dynamic> data) async {
    return await postRequest(
      endpoint: Endpoints.postTogetBookingId,
      data: data,
      token: Endpoints.token,
    );
  }

  Future<dynamic> storeCar(Map<String, dynamic> data) async {
    return await postRequest(
      endpoint: Endpoints.storeCar,
      data: data,
      token: Endpoints.token,
    );
  }

  Future<dynamic> storeHotel(Map<String, dynamic> data, int hotelId) async {
    final endpoint = '/hotels/$hotelId/bookings';
    return await postRequest(
      endpoint: endpoint,
      data: data,
      token: Endpoints.token,
    );
  }

  Future<dynamic> getDestinationsToEachTour(String tourName) async {
    final endpoint = '/toursDestinations/$tourName';
    return await getRequest(endpoint: endpoint, token: Endpoints.token);
  }

  Future<dynamic> getOffers() async {
    return await getRequest(
      endpoint: Endpoints.getOffers,
      token: Endpoints.token,
    );
  }

  Future<dynamic> getHotels() async {
    return await getRequest(
      endpoint: Endpoints.getHotels,
      token: Endpoints.token,
    );
  }
}
