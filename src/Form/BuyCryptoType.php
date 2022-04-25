<?php

namespace App\Form;

use App\Entity\Cryptolist;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use App\Entity\Mycrypto;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BuyCryptoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('crypto', EntityType::class, [
                'class' => Cryptolist::class,
                'choice_label' => 'name',])
            ->add('quantity', NumberType::class, [
                'required' => true,
                'scale' => 0,
                'html5' => true,
                'attr' => [
                    'min' => 1,
//                    'step' => 0.01,
                ],
            ])
            ->add('price', NumberType::class, [
                'required' => true,
                'scale' => 2,
                'html5' => true,
                'attr' => [
                    'min' => 0.01,
                    'step' => 0.01,
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Mycrypto::class,
        ]);
    }
}
