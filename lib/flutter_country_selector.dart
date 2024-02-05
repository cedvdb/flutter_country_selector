library flutter_country_selector;

import 'package:circle_flags/circle_flags.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

export 'src/country_selector_page.dart';
export 'src/country_selector_sheet.dart';

export 'package:phone_numbers_parser/phone_numbers_parser.dart' show IsoCode;

Future<void> preloadFlags(Iterable<IsoCode> isoCodes) {
  return CircleFlag.preload(isoCodes.map((isoCode) => isoCode.name));
}
