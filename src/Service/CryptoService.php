<?php

namespace App\Service;

use App\Entity\Save;
use App\Rentability\RentabilityCounting;
use Doctrine\Persistence\ManagerRegistry;

class CryptoService
{

    private ManagerRegistry $doctrine;
    private RentabilityCounting $rentabilityCounting;

    public function __construct(ManagerRegistry $doctrine, RentabilityCounting $rentabilityCounting)
    {
        $this->doctrine = $doctrine;
        $this->rentabilityCounting =$rentabilityCounting;
    }

    public function save(): void
    {
        $dailySaved = $this->doctrine->getRepository(Save::class);
        $totalRentability = $this->rentabilityCounting->getRentability($this->doctrine);
        $today = date('Y-m-d');
        // On vérifie qu'il n'y a pas eu déjà une sauvegarde aujourd'hui
        if ($dailySaved->findByDate($today) == null) {
            $saveRentability = new Save();
            $saveRentability->setDate($today);
            $saveRentability->setTotal(round($totalRentability));
            $entityManager = $this->doctrine->getManager();
            $entityManager->persist($saveRentability);
            $entityManager->flush();
        }
    }

}