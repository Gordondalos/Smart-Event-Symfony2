<?php

namespace Blog\ArticleBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="category")
 */
class Category
{
    /**
     * @var integer
     *
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $categoryId;
    /**
     * @var string
     *
     * @ORM\Column(type="string", length=100)
     */
    protected $categoryName;
    /**
     * @var string
     *
     * @ORM\Column(type="text")
     */
    protected $categoryDescription;

    /**
     * Get categoryId
     *
     * @return integer 
     */
    public function getCategoryId()
    {
        return $this->categoryId;
    }

    /**
     * Set categoryName
     *
     * @param string $categoryName
     * @return Category
     */
    public function setCategoryName($categoryName)
    {
        $this->categoryName = $categoryName;

        return $this;
    }

    /**
     * Get categoryName
     *
     * @return string 
     */
    public function getCategoryName()
    {
        return $this->categoryName;
    }

    /**
     * Set categoryDescription
     *
     * @param string $categoryDescription
     * @return Category
     */
    public function setCategoryDescription($categoryDescription)
    {
        $this->categoryDescription = $categoryDescription;

        return $this;
    }

    /**
     * Get categoryDescription
     *
     * @return string 
     */
    public function getCategoryDescription()
    {
        return $this->categoryDescription;
    }
    /**
     * @var integer
     */
    private $categoryParent;


    /**
     * Set categoryParent
     *
     * @param integer $categoryParent
     * @return Category
     */
    public function setCategoryParent($categoryParent)
    {
        $this->categoryParent = $categoryParent;

        return $this;
    }

    /**
     * Get categoryParent
     *
     * @return integer 
     */
    public function getCategoryParent()
    {
        return $this->categoryParent;
    }
    /**
     * @var integer
     */
    private $categorySort;


    /**
     * Set categorySort
     *
     * @param integer $categorySort
     * @return Category
     */
    public function setCategorySort($categorySort)
    {
        $this->categorySort = $categorySort;
    
        return $this;
    }

    /**
     * Get categorySort
     *
     * @return integer 
     */
    public function getCategorySort()
    {
        return $this->categorySort;
    }
    /**
     * @var boolean
     */
    private $categoryShowLeftMenu;


    /**
     * Set categoryShowLeftMenu
     *
     * @param boolean $categoryShowLeftMenu
     * @return Category
     */
    public function setCategoryShowLeftMenu($categoryShowLeftMenu)
    {
        $this->categoryShowLeftMenu = $categoryShowLeftMenu;
    
        return $this;
    }

    /**
     * Get categoryShowLeftMenu
     *
     * @return boolean 
     */
    public function getCategoryShowLeftMenu()
    {
        return $this->categoryShowLeftMenu;
    }
}
