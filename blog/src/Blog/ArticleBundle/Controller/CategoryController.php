<?php

namespace Blog\ArticleBundle\Controller;

use Blog\ArticleBundle\Form\CategoryType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Blog\ArticleBundle\Entity\Category;
use Symfony\Component\HttpFoundation\Request;

class CategoryController extends Controller
{

    // данный метод выводит в админке все категории
    public function indexAction()
    {
        $repository = $this->getDoctrine()->getRepository('BlogArticleBundle:Category');
        if ( !$repository ) {
            throw $this->createNotFoundException("Категории не найдены");
        } else {
            $em = $this->getDoctrine()->getManager();
            $query = $em->createQuery(
                'SELECT u FROM BlogArticleBundle:Category u WHERE u.categoryParent = 48 ORDER BY u.categorySort ASC'
            );


            $category = $query->getResult();

        }

        return $this->render('BlogArticleBundle:Category:index.html.twig', array('category' => $category));
    }

// данный метод выводит ве категории которые
// необходимы для новых статей, категорий и внесения в них изменений
    public function allCategoryAction($em)
    {

        $repository = $em->getRepository('BlogArticleBundle:Category');
        if ( !$repository ) {
            throw $this->createNotFoundException("Категории не найдены");
        } else {

            $query = $em->createQuery(
                'SELECT u FROM BlogArticleBundle:Category u'
            );


            $categorys = $query->getResult();

        }


        return array('categorys' => $categorys);
    }


    //выводит все статьи вместе с пагинатором в категории с заданным id
    public function postAction($id, Request $request)
    {

        $em = $this->getDoctrine()->getManager();

        $post = $em->getRepository('BlogArticleBundle:Category')->find($id);

        if ( !$post ) {
            return $this->redirect($this->generateUrl('blog_article_homepage'));
        }

        $em = $this->get('doctrine.orm.entity_manager');
        $dql = (
            'SELECT u FROM BlogArticleBundle:Article u WHERE u.articleIspublished = true AND u.articleCategoryId = ' . $id . ' ORDER BY u.articleDate DESC'
        );

        $query = $em->createQuery($dql);
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1)/*page number*/,
           5/*limit per page*/
        );


        return $this->render('BlogArticleBundle:Category:post.html.twig', array(
            'post' => $post,
            'pagination' => $pagination
        ));
    }

// создание категории
    public function createAction(Request $request)
    {
        $category = new Category();
        $em = $this->getDoctrine()->getManager();
        $ct = new CategoryController();
        $categorys = $ct->allCategoryAction($em);


        $categor = array();
        foreach ( $categorys as $value ) {

            foreach ( $value as $val ) {
                $arr = (array)($val);
                $categoryId = array_shift($arr);
                $categoryName = array_shift($arr);
                $categor += [$categoryId => $categoryName];

            }
        }

        $form = $this->createForm(new CategoryType(), $category);

        $form->add('categoryParent', 'choice', array('label' => 'Выберете раздел',
            'multiple' => false,
            'choices' => $categor,
            'attr' => array('style' => 'width:300px', 'customattr' => 'customdata')

        ));


        $form->add('submit', 'submit', array(
            'label' => 'Создать Раздел',
        ));

        $form->handleRequest($request);

        if ( $request->getMethod() == 'POST' ) {
            if ( $form->isValid() ) {
                $em = $this->getDoctrine()->getManager();
                $em->persist($category);
                $em->flush();


                // выполняем прочие действие, например, сохраняем задачу в базе данных
                return $this->redirect($this->generateUrl('blog_category_homepage'));
            }
            echo "Форма не валидна";
        }


        return $this->render('BlogArticleBundle:Category:new.html.twig', array(
            'category' => $category,
            'createform' => $form->createView(),
        ));

    }


    // удаляем категории
    public function deleteAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $category = $em->getRepository('BlogArticleBundle:Category')->find($id);
        if ( !$category ) {
            throw $this->createNotFoundException('category not found');
        }

        $deleteform = $this->createFormBuilder($category)
            ->add('submit', 'submit', array('label' => 'Удалить категорию'))
            ->getForm();
        $deleteform->handleRequest($request);

        if ( $deleteform->isValid() ) {
            $em->remove($category);
            $em->flush();
            return $this->redirect($this->generateUrl('blog_category_homepage'));
        }

        return $this->render('BlogArticleBundle:Category:delete.html.twig', array(
            'category' => $category,
            'deleteform' => $deleteform->createView(),
        ));

    }

    // изменяем категории

    public function editAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $categorys = $this->allCategoryAction($em);
        $categor = array();

        foreach ( $categorys as $value ) {

            foreach ( $value as $val ) {
                $arr = (array)($val);
                $categoryId = array_shift($arr);
                $categoryName = array_shift($arr);
                $categor += [$categoryId => $categoryName];

            }
        }


        $category = $em->getRepository('BlogArticleBundle:Category')->find($id);
        if ( !$category ) {
            throw $this->createNotFoundException('category not found');
        }


        $editform = $this->createForm(new CategoryType(), $category);
        $editform->add('categoryParent', 'choice', array('label' => 'Выберете раздел',
            'multiple' => false,
            'choices' => $categor,
            'attr' => array('style' => 'width:300px', 'customattr' => 'customdata')

        ));

        $editform->add('submit', 'submit', array('label' => 'Изменить Раздел'));
        $editform->handleRequest($request);


        if ( $editform->isValid() ) {
            // выполняем прочие действие, например, сохраняем задачу в базе данных
            $em->flush();
            return $this->redirect($this->generateUrl('blog_category_homepage'));
        }

        return $this->render('BlogArticleBundle:Category:edit.html.twig', array(
            'category' => $category,
            'editform' => $editform->createView(),

        ));


    }


//    public function allAction()
//    {
//        $repository = $this->getDoctrine()->getRepository('BlogArticleBundle:Article');
//        if ( !$repository ) {
//            throw $this->createNotFoundException("Статьи не найдены");
//        } else {
//            $em = $this->getDoctrine()->getManager();
//            $query = $em->createQuery(
//                'SELECT u FROM BlogArticleBundle:Article u'
//            );
//
//
//            $articles = $query->getResult();
//
//        }
//        return $this->render('BlogArticleBundle:Article:all.html.twig', array('articles' => $articles));
//    }

//    public function allIsPublishedAction()
//    {
//        $repository = $this->getDoctrine()->getRepository('BlogArticleBundle:Article');
//        if ( !$repository ) {
//            throw $this->createNotFoundException("Статьи не найдены");
//        } else {
//            $em = $this->getDoctrine()->getManager();
//            $query = $em->createQuery(
//                'SELECT u FROM BlogArticleBundle:Article u WHERE u.articleIspublished = true ORDER BY u.articleDate DESC'
//            );
//
//
//            $articles = $query->getResult();
//
//        }
//
//        return $this->render('@BlogArticle/Article/allIsPubloshed.html.twig', array('articles' => $articles));
//    }


    // Данный способ выводит все категории у пользователя
    public function all_allCategoryAction()
    {
        $em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository('BlogArticleBundle:Category');
        if ( !$repository ) {
            throw $this->createNotFoundException("Категории не найдены");
        } else {
            $query = $em->createQuery(
                'SELECT u FROM BlogArticleBundle:Category u WHERE u.categoryShowLeftMenu=1 ORDER BY u.categorySort ASC'
            );
            $categorys = $query->getResult();

        }

        return $this->render('BlogArticleBundle:Category:allCategory.html.twig', array('category' => $categorys));

    }


    // Данный метод выводит все дочерние категории у пользователя
//    public function doterCategoryAction($categoryId)
//    {
//        $em = $this->getDoctrine()->getManager();
//        $query = $em->createQuery(
//            'SELECT u FROM BlogArticleBundle:Category u WHERE u.categoryParent=' . $categoryId . ' ORDER BY u.categorySort ASC'
//        );
//        $categorys = $query->getResult();
//        return $this->render('BlogArticleBundle:Category:doterCategory.html.twig', array('categorys' => $categorys));
//
//    }
// Данный метод выводит дочерние категории у админа
    public function doterCategoryAdminAction($categoryId)
    {
        $em = $this->getDoctrine()->getManager();
        $query = $em->createQuery(
            'SELECT u FROM BlogArticleBundle:Category u WHERE u.categoryParent =' . $categoryId . 'AND u.categoryParent <> 48 ORDER BY u.categorySort ASC'
        );
        $categorys = $query->getResult();
        return $this->render('BlogArticleBundle:Category:doterCategoryAdmin.html.twig', array('categorys' => $categorys));
    }
    // Данный метод выводит все дочерние категории у пользователя
    public function doterCategoryMenuAction($categoryId)
    {
       $em = $this->getDoctrine()->getManager();
        $query = $em->createQuery(
            'SELECT u FROM BlogArticleBundle:Category u WHERE u.categoryParent=' . $categoryId . ' ORDER BY u.categorySort ASC'
        );
        $categorys = $query->getResult();
        return $this->render('BlogArticleBundle:Category:doterCategoryMenu.html.twig', array('categorys' => $categorys));

    }


}
