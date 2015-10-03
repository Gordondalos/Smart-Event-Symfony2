<?php

namespace Blog\SliderBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('BlogSliderBundle:Default:index.html.twig');
    }
}
