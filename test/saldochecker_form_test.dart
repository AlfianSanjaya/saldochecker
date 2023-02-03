import 'package:flutter_test/flutter_test.dart';
import 'package:saldochecker/widgets/saldochecker_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  late SaldoCheckerFormState state;
  setUp(() {
    const widget = SaldoCheckerForm();
    final element = widget.createElement();
    state = element.state as SaldoCheckerFormState;
  });
  group('Validate textfield', () {
    // TODO: fix tests
    // test(
    //   'when input is null',
    //   () {
    //     String? input;
    //     dynamic result = state.validateTicketID(input);
    //     expect(result, AppLocalizations.of(state.context)!.inputIsEmptyMessage);
    //   },
    // );
    // test(
    //   'when input is empty string',
    //   () {
    //     dynamic result = state.validateTicketID('');
    //     expect(result, strings.inputIsEmptyMessage);
    //   },
    // );
    // test(
    //   'when input is < 16 characters',
    //   () {
    //     dynamic result = state.validateTicketID('D');
    //     expect(result, strings.inputIsInvalidMessage);
    //     result = state.validateTicketID('D0021B698F5BBC2');
    //     expect(result, strings.inputIsInvalidMessage);
    //   },
    // );
    // test(
    //   'when input is > 16 characters',
    //   () {
    //     dynamic result = state.validateTicketID('D0021B698F5BBC2CD');
    //     expect(result, strings.inputIsInvalidMessage);
    //     result = state.validateTicketID('D0021B698F5BBC2CDEIODKEO');
    //     expect(result, strings.inputIsInvalidMessage);
    //   },
    // );
    // test(
    //   'when input contains lower case characters',
    //   () {
    //     dynamic result = state.validateTicketID('gogogagagigi1gi1');
    //     expect(result, strings.inputIsInvalidMessage);
    //   },
    // );
    // test(
    //   'when input contains invalid characters',
    //   () {
    //     dynamic result = state.validateTicketID('!0021B68F5BBC2CD');
    //     expect(result, strings.inputIsInvalidMessage);
    //   },
    // );
  });
}
