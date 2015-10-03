<?php

namespace Blog\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class AdminController extends Controller
{
    public function indexAction()
    {
        return $this->render('BlogAdminBundle:Admin:index.html.twig');

    }

    public function indexAdminAction()
    {
        return $this->render('BlogAdminBundle:Admin:indexAdmin.html.twig');
    }
}
