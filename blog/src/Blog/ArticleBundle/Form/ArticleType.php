<?php

namespace Blog\ArticleBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ArticleType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('articleTitle',  'text', array('label' => 'Название статьи', 'attr' => array('class' => 'form-control')))
            ->add('shortText', 'textarea',array('label' => 'Короткий текст', 'attr' => array('class' => 'form-control tinymce', 'required' => 'false')))
            ->add('articleText', 'textarea',array('label' => 'Текст статьи', 'attr' => array('class' => 'form-control tinymce', 'required' => 'false')))
            ->add('articleDate', 'date',array('label' => 'Дата публикации'))
            ->add('articleIspublished','checkbox', array('label' => 'Опубликовать?', 'attr' => array('class' => 'checkbox')))
            ->add('main','checkbox', array('label' => 'Опубликовать на главной?', 'attr' => array('class' => 'checkbox')))
            ->add('general','checkbox', array('label' => 'Главная страница', 'attr' => array('class' => 'checkbox')));
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'BlogArticleBundle\Entity\Article'
        ));
    }

    public function getName()
    {
        return 'blog_articlebundle_article';
    }

}
