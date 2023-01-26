import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saldochecker/models/ticket_information.dart';
import 'package:saldochecker/services/http_service.dart';

import 'http_service_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Get ticket information', () {
    test(
        'returns the ticket information if the http call completes successfully',
        () async {
      final client = MockClient();
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse(
              'https://www.delijn.be/api/saldo-checker/D0021B698F5BBC2C')))
          .thenAnswer((_) async => http.Response(
              '{"id":"D0021B698F5BBC2C","smartticketLineJsonList":[{"timestamp":1670683731806,"value":9},{"timestamp":1670683733004,"value":8},{"timestamp":1671885338496,"value":7},{"timestamp":1671899534292,"value":6},{"timestamp":1672140337210,"value":5},{"timestamp":1672163866819,"value":4},{"timestamp":1674204467333,"value":3},{"timestamp":1674216165887,"value":2}],"timestamp":1674216165887,"validationStatus":"OK","value":2}',
              200));
      expect(await HttpService.getTicketInformation(client, "D0021B698F5BBC2C"),
          isA<TicketInformation>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse(
              'https://www.delijn.be/api/saldo-checker/D0021B698F5BBC2C')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(HttpService.getTicketInformation(client, "D0021B698F5BBC2C"),
          throwsException);
    });
  });
}
