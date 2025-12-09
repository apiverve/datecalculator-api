/**
 * Date Calculator API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Date Calculator API.
 * API Documentation: https://docs.apiverve.com/ref/datecalculator
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/datecalculator';

/**
 * Make a GET request to the Date Calculator API
 */
async function callDateCalculatorAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            start: &#x27;2022-01-01&#x27;,
            end: &#x27;2024-08-31&#x27;
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callDateCalculatorAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
