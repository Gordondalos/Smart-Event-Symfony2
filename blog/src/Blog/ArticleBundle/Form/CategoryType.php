<?php

namespace Blog\ArticleBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CategoryType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('categoryName',  'text', array('label' => 'Название Раздела', 'attr' => array('class' => 'form-control')))
            ->add('categoryDescription', 'textarea',array('label' => 'Описание Раздела', 'attr' => array('class' => 'form-control tinymce', 'required' => 'false')))
            ->add('categorySort', 'text',array('label' => 'Сортировочный индекс'))
            ->add('categoryShowLeftMenu', 'checkbox',array('label' => 'Показывать в левом меню'));

    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'BlogArticleBundle\Entity\Category'
        ));
    }

    public function getName()
    {
        return 'blog_articlebundle_category';
    }

}
