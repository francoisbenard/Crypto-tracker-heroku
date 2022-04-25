<?php

namespace App\Rentability;

use App\API\APIdata;
use App\Entity\Mycrypto;
use Doctrine\Persistence\ManagerRegistry;

class RentabilityCounting
{
    public function getRentability(ManagerRegistry $doctrine): float
    {
        $APIdata = new APIdata();
        $dataAPI = $APIdata->getAPI();
        $myCryptos = $doctrine->getRepository(Mycrypto::class)->findAll();
        $totalWithMyCryptoPrice = 0;
        $TotalWithApiPrice = 0;
        foreach ($myCryptos as $crypto) {
            $totalWithMyCryptoPrice += $crypto->getPrice() * $crypto->getQuantity();
            foreach ($dataAPI as $key => $value) {
                if ($value["symbol"] === $crypto->getCrypto()->getSymbol()) {

                    $TotalWithApiPrice += $value["quote"]["EUR"]["price"] * $crypto->getQuantity();
                }
            }
        }
        $rentability = round($totalWithMyCryptoPrice - $TotalWithApiPrice);
        return $rentability;
    }

}