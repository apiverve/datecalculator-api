# Date Calculator API - Dart/Flutter Client

Date Calculator is a simple tool for calculating date differences. It returns the calculated date difference based on the dates provided.

[![pub package](https://img.shields.io/pub/v/apiverve_datecalculator.svg)](https://pub.dev/packages/apiverve_datecalculator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Date Calculator API](https://apiverve.com/marketplace/datecalculator?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_datecalculator: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_datecalculator/apiverve_datecalculator.dart';

void main() async {
  final client = DatecalculatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'start': '2022-01-01',
      'end': '2024-08-31'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "minutes": 524160,
    "hours": 8736,
    "days": 364,
    "weeks": 52,
    "months": 11,
    "years": 0,
    "start": {
      "date": "2022-01-01",
      "day": "Saturday",
      "month": "January",
      "year": "2022",
      "words": "Saturday, January 1st 2022"
    },
    "end": {
      "date": "2022-12-31",
      "day": "Saturday",
      "month": "December",
      "year": "2022",
      "words": "Saturday, December 31st 2022"
    }
  }
}
```

## API Reference

- **API Home:** [Date Calculator API](https://apiverve.com/marketplace/datecalculator?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/datecalculator](https://docs.apiverve.com/ref/datecalculator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
