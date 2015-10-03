<?php

namespace Blog\SliderBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Article
 */
class Article
{
    /**
     * @var string
     */
    private $articleText;

    /**
     * @var \DateTime
     */
    private $articleDate;

    /**
     * @var boolean
     */
    private $articleIspublished;

    /**
     * @var string
     */
    private $articleTitle;

    /**
     * @var integer
     */
    private $articleCategoryId;

    /**
     * @var integer
     */
    private $articleId;


    /**
     * Set articleText
     *
     * @param string $articleText
     * @return Article
     */
    public function setArticleText($articleText)
    {
        $this->articleText = $articleText;

        return $this;
    }

    /**
     * Get articleText
     *
     * @return string 
     */
    public function getArticleText()
    {
        return $this->articleText;
    }

    /**
     * Set articleDate
     *
     * @param \DateTime $articleDate
     * @return Article
     */
    public function setArticleDate($articleDate)
    {
        $this->articleDate = $articleDate;

        return $this;
    }

    /**
     * Get articleDate
     *
     * @return \DateTime 
     */
    public function getArticleDate()
    {
        return $this->articleDate;
    }

    /**
     * Set articleIspublished
     *
     * @param boolean $articleIspublished
     * @return Article
     */
    public function setArticleIspublished($articleIspublished)
    {
        $this->articleIspublished = $articleIspublished;

        return $this;
    }

    /**
     * Get articleIspublished
     *
     * @return boolean 
     */
    public function getArticleIspublished()
    {
        return $this->articleIspublished;
    }

    /**
     * Set articleTitle
     *
     * @param string $articleTitle
     * @return Article
     */
    public function setArticleTitle($articleTitle)
    {
        $this->articleTitle = $articleTitle;

        return $this;
    }

    /**
     * Get articleTitle
     *
     * @return string 
     */
    public function getArticleTitle()
    {
        return $this->articleTitle;
    }

    /**
     * Set articleCategoryId
     *
     * @param integer $articleCategoryId
     * @return Article
     */
    public function setArticleCategoryId($articleCategoryId)
    {
        $this->articleCategoryId = $articleCategoryId;

        return $this;
    }

    /**
     * Get articleCategoryId
     *
     * @return integer 
     */
    public function getArticleCategoryId()
    {
        return $this->articleCategoryId;
    }

    /**
     * Get articleId
     *
     * @return integer 
     */
    public function getArticleId()
    {
        return $this->articleId;
    }
}
