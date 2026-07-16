# Date Calculator API - PHP Package

Date Calculator is a simple tool for calculating date differences. It returns the calculated date difference based on the dates provided.

## Installation

Install via Composer:

```bash
composer require apiverve/datecalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Datecalculator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'start' => '2022-01-01',
    'end' => '2024-08-31'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Datecalculator\Client;
use APIVerve\Datecalculator\Exceptions\APIException;
use APIVerve\Datecalculator\Exceptions\ValidationException;

try {
    $response = $client->execute(['start' => '2022-01-01', 'end' => '2024-08-31']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/datecalculator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/datecalculator?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/datecalculator?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
