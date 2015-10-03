<?php

namespace Blog\ArticleBundle\Controller;

use Blog\ArticleBundle\Form\ArticleType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Blog\ArticleBundle\Entity\Article;

use Symfony\Component\HttpFoundation\Request;

class ArticleController extends Controller
{
    public function indexAction()
    {
        $repository = $this->getDoctrine()->getRepository('BlogArticleBundle:Article');
        if ( !$repository ) {
            throw $this->createNotFoundException("Статьи не найдены");
        } else {
            $em = $this->getDoctrine()->getManager();
            $query = $em->createQuery(
                'SELECT u FROM BlogArticleBundle:Article u WHERE u.articleIspublished = true AND u.main = true ORDER BY u.articleDate DESC'
            )->setMaxResults(3);


            $articles = $query->getResult();

        }

        return $this->render('BlogArticleBundle:Article:index.html.twig', array('articles' => $articles));
    }

    public function postAction($id)
    {

        $em = $this->getDoctrine()->getManager();

        $post = $em->getRepository('BlogArticleBundle:Article')->find($id);

        if ( !$post ) {
            return $this->redirect($this->generateUrl('blog_article_homepage'));
        }

        return $this->render('BlogArticleBundle:Article:post.html.twig', array('post' => $post));
    }

    public function sucessAction()
    {
        return $this->render('BlogArticleBundle:Article:sucess.html.twig');
    }


    public function createAction(Request $request)
    {
        $article = new Article();

        $article->setArticleDate(new \DateTime('today'));
        $article->setArticleIspublished(true);

        $em = $this->getDoctrine()->getManager();
        $ct = new CategoryController();
        $category = $ct->allCategoryAction($em);
        $categorys = array();
        foreach ( $category as $value ) {

            foreach ( $value as $val ) {
                $arr = (array)($val);
                $categoryId = array_shift($arr);
                $categoryName = array_shift($arr);
                $categorys += [$categoryId => $categoryName];
               // $categorys[$categoryId] = [$categoryName];


            }

        }


        $form = $this->createForm(new ArticleType(), $article);

        $form->add('articleCategoryId', 'choice', array('label' => 'Выберете раздел',
            'multiple' => false,
            'choices' => $categorys,
            'attr' => array('style' => 'width:300px', 'customattr' => 'customdata')

        ));


        $form->add('submit', 'submit', array(
            'label' => 'Создать статью',
        ));


        $form->handleRequest($request);

        if ( $request->getMethod() == 'POST' ) {
            // echo 123;

            if ( $form->isValid() ) {
                $em = $this->getDoctrine()->getManager();
                $em->persist($article);
                $em->flush();


                // выполняем прочие действие, например, сохраняем задачу в базе данных
                return $this->redirect($this->generateUrl('blog_article_sucsses'));
            }
            echo "Форма не валидна";
        }
//        $em = $this->getDoctrine()->getManager();
//        $ct = new CategoryController();
//        $categorys = $ct->allCategoryAction($em);
//
        return $this->render('BlogArticleBundle:Article:new.html.twig', array(
            'article' => $article,
            'createform' => $form->createView(),
        ));

    }


    public function deleteAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $article = $em->getRepository('BlogArticleBundle:Article')->find($id);
        if ( !$article ) {
            throw $this->createNotFoundException('article not found');
        }

        $deleteform = $this->createFormBuilder($article)
            ->add('submit', 'submit', array('label' => 'Удалить статью'))
            ->getForm();
        $deleteform->handleRequest($request);

        if ( $deleteform->isValid() ) {
            $em->remove($article);
            $em->flush();
            return $this->redirect($this->generateUrl('blog_article_all'));
        }

        return $this->render('BlogArticleBundle:Article:delete.html.twig', array(
            'article' => $article,
            'deleteform' => $deleteform->createView(),
        ));

    }

    public function editAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $article = $em->getRepository('BlogArticleBundle:Article')->find($id);
        if ( !$article ) {
            throw $this->createNotFoundException('article not found');
        }
        // var_dump($article); die;

        $editform = $this->createForm(new ArticleType(), $article);


        /////////////////////////////////

        $ct = new CategoryController();
        $category = $ct->allCategoryAction($em);
        $categorys = array();
        foreach ( $category as $value ) {

            foreach ( $value as $val ) {
                $arr = (array)($val);
                $categoryId = array_shift($arr);
                $categoryName = array_shift($arr);
                $categorys += [$categoryId => $categoryName];

            }

        }
//var_dump($categorys); die;


        $editform->add('articleCategoryId', 'choice', array('label' => 'Выберете раздел',
            'multiple' => false,
            'choices' => $categorys,
            'attr' => array('style' => 'width:300px', 'customattr' => 'customdata')

        ));

        //////////////////////////////////////


        $editform->add('submit', 'submit', array('label' => 'Изменить статью'));


        $editform->handleRequest($request);

        if ( $editform->isValid() ) {
            // выполняем прочие действие, например, сохраняем задачу в базе данных
            $em->flush();
            return $this->redirect($this->generateUrl('blog_article_post', array('id' => $id)));
        }

        return $this->render('BlogArticleBundle:Article:edit.html.twig', array(
            'categorys' => $categorys,
            'article' => $article,
            'editform' => $editform->createView(),

        ));


    }


    public function allAction(Request $request)
    {
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
//
//
//        $paginator  = $this->get('knp_paginator');
//        $pagination = $paginator->paginate(
//            $articles,
//            $request->query->getInt('page', 1)/*page number*/,
//            10/*limit per page*/
//        );

        $em    = $this->get('doctrine.orm.entity_manager');
//        $dql   = "SELECT a FROM AcmeMainBundle:Article a";
        $dql   = "SELECT a FROM BlogArticleBundle:Article a ORDER BY a.articleDate Desc";
        $query = $em->createQuery($dql);

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1)/*page number*/,
            10/*limit per page*/
        );

        // var_dump($articles);

        return $this->render('BlogArticleBundle:Article:all.html.twig', array(
            'pagination' => $pagination
//            'articles' => $articles,
//            'pagination' => $pagination

        ));
    }




    public function allIsPublishedAction()
    {
        $repository = $this->getDoctrine()->getRepository('BlogArticleBundle:Article');
        if ( !$repository ) {
            throw $this->createNotFoundException("Статьи не найдены");
        } else {
            $em = $this->getDoctrine()->getManager();
            $query = $em->createQuery(
                'SELECT u FROM BlogArticleBundle:Article u WHERE u.articleIspublished = true ORDER BY u.articleDate DESC'
            );


            $articles = $query->getResult();

        }

        return $this->render('@BlogArticle/Article/allIsPubloshed.html.twig', array('articles' => $articles));
    }

// данный метод выводит одну страницу на главную
    public function generalAction()
    {



        $em = $this->getDoctrine()->getManager();
        $query = $em->createQuery(
            'SELECT u FROM BlogArticleBundle:Article u WHERE u.general = true'
        );


        $post = $query->getResult();

        if ( !$post) {
            throw $this->createNotFoundException("Главная страница не выбрана");
        }
       // print_r($post); die;

        return $this->render('@BlogArticle/Article/general.html.twig', array('post' => $post));
    }


    public function postNumberAction()
    {

        $em = $this->getDoctrine()->getManager();

        $post = $em->getRepository('BlogArticleBundle:Article')->find(19);

        if ( !$post ) {
            return $this->redirect($this->generateUrl('blog_article_homepage'));
        }

        return $this->render('BlogArticleBundle:Article:post18.html.twig', array('post' => $post));
    }

    public function listAction(Request $request)
    {
        $em    = $this->get('doctrine.orm.entity_manager');
//        $dql   = "SELECT a FROM AcmeMainBundle:Article a";
        $dql   = "SELECT a FROM BlogArticleBundle:Article a";
        $query = $em->createQuery($dql);

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1)/*page number*/,
            10/*limit per page*/
        );

        // parameters to template
        return $this->render('BlogArticleBundle:Article:list.html.twig', array('pagination' => $pagination));
    }

    public function indexLeftAction()
    {
        $repository = $this->getDoctrine()->getRepository('BlogArticleBundle:Article');
        if ( !$repository ) {
            throw $this->createNotFoundException("Статьи не найдены");
        } else {
            $em = $this->getDoctrine()->getManager();
            $query = $em->createQuery(
                'SELECT u FROM BlogArticleBundle:Article u WHERE u.articleIspublished = true AND u.main = true ORDER BY u.articleDate DESC'
            )->setMaxResults(5);


            $articles = $query->getResult();

        }

        return $this->render('BlogArticleBundle:Article:indexLeft.html.twig', array('articles' => $articles));
    }




}
