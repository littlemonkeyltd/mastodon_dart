import '../library.dart';
import '../mock/mixins/search.dart';

// mixin Statuses on Authentication, Utilities implements MockStatusesMixin {

mixin Search on Authentication, Utilities implements MockSearchMixin {
  /// GET /api/v2/search
  ///
  /// - authenticated
  /// - read read:search
  ///
  /// https://docs.joinmastodon.org/api/rest/search/#get-api-v2-search
  Future<Results> search(String q, {bool resolve = false}) async {
    final response = await request(
      Method.get,
      "/api/v2/search",
      authenticated: true,
      payload: {
        "q": q,
        "resolve": resolve.toString(),
      },
    );

    return Results.fromJson(json.decode(response.body));
  }
}
