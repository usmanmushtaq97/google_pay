# google_pay

A new Flutter project.

## Getting Started

I read given Documents that you send yesterday.  it is about token integration and plan. Basically, Google Pay securely returns a payment token along with details about the purchase, which detail need send our backend. 
I understand how we Can Implement. I want to know scenario where you want to add and some discussion need.
Need the below Details: 
Integration Requirement:
we need the below json request.
We can load  from Api or locally from json assets.
Json request:
{
  "apiVersion": 2,
  "apiVersionMinor": 0,
  "merchantInfo": {
    "merchantName": "Example Merchant"
  },
  "allowedPaymentMethods": [
    {
      "type": "CARD",
      "parameters": {
        "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
        "allowedCardNetworks": ["AMEX", "DISCOVER", "INTERAC", "JCB", "MASTERCARD", "VISA"]
      },
      "tokenizationSpecification": {
        "type": "PAYMENT_GATEWAY",
        "parameters": {
          "gateway": "example",
          "gatewayMerchantId": "exampleGatewayMerchantId"
        }
      }
    }
  ],
  "transactionInfo": {
    "totalPriceStatus": "FINAL",
    "totalPrice": "12.34",
    "currencyCode": "USD"
  }
}


The above json asset we need to get from our Business Google Pay console Account.
The below link  as reference.
https://pay.google.com/business/console/

After this request we will be get response from Google Pay This response consists Token with details.
See the below Response object Example:

{
  "apiVersion": 2,
  "apiVersionMinor": 0,
  "paymentMethodData": {
    "type": "CARD",
    "description": "Visa •••• 1234",
    "info": {
      "cardNetwork": "VISA",
      "cardDetails": "1234"
    },
    "tokenizationData": {
      "type": "PAYMENT_GATEWAY",
      "token": "examplePaymentMethodToken"
    }
  }
  {
  "name": "John Doe",
  "address1": "c/o Google LLC",
  "address2": "1600 Amphitheatre Pkwy",
  "address3": "Building 40",
  "locality": "Mountain View",
  "administrativeArea": "CA",
  "countryCode": "US",
  "postalCode": "94043",
  "sortingCode": ""
}
{
  "cardNetwork": "VISA",
  "cardDetails": "1234",
  "assuranceDetails": {
    "cardHolderAuthenticated": false,
    "accountVerified": true
  }
}
The above response needs to send our backend service or Payment Service Provider (PSP).
Need API, which send above response to our backend (Database)
The below link for backend:
https://developers.google.com/pay/api/android/reference/response-objects

Google Pay Integration in Flutter (android app) 
In Flutter have pay: ^1.0.11 package which is official developed by Google. we will be using this package.
Note: The google pay will be run greater then Android 4.4 (API level 19) API LEVEL means after KitKat OS

