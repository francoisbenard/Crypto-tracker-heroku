<?php

namespace App\API;


class APIdata
{

    public function getAPI()
    {
        $url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest';
        $parameters = [
            // on récupère les 10 cryptos les plus courantes.
            'symbol' => 'BTC,ETH,BNB,USDT,SOL,XRP,ADA,USDC,LUNA,AVAX',
            'convert' => 'EUR'
        ];
        $headers = [
            'Accepts: application/json',
            'X-CMC_PRO_API_KEY: a1c49f65-f552-436c-81af-9c9170a7fac9'
        ];
        $qs = http_build_query($parameters); // query string encode the parameters
        $request = "{$url}?{$qs}"; // create the request URL
        $curl = curl_init(); // Get cURL resource
        // Set cURL options
        curl_setopt_array($curl, array(
            CURLOPT_URL => $request,            // set the request URL
            CURLOPT_HTTPHEADER => $headers,     // set the headers
            CURLOPT_RETURNTRANSFER => 1         // ask for raw response instead of bool
        ));
        $response = curl_exec($curl); // Send the request, save the response
        curl_close($curl); // Close request
        $dataAPI = json_decode($response, true);// print json decoded response
        return $dataAPI['data'];
    }

}