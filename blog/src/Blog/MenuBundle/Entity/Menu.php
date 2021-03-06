<?php

namespace Blog\MenuBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Menu
 */
class Menu
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $menuName;

    /**
     * @var string
     */
    private $menuHref;

    /**
     * @var integer
     */
    private $menuParent;

    /**
     * @var string
     */
    private $menuType;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set menuName
     *
     * @param string $menuName
     * @return Menu
     */
    public function setMenuName($menuName)
    {
        $this->menuName = $menuName;
    
        return $this;
    }

    /**
     * Get menuName
     *
     * @return string 
     */
    public function getMenuName()
    {
        return $this->menuName;
    }

    /**
     * Set menuHref
     *
     * @param string $menuHref
     * @return Menu
     */
    public function setMenuHref($menuHref)
    {
        $this->menuHref = $menuHref;
    
        return $this;
    }

    /**
     * Get menuHref
     *
     * @return string 
     */
    public function getMenuHref()
    {
        return $this->menuHref;
    }

    /**
     * Set menuParent
     *
     * @param integer $menuParent
     * @return Menu
     */
    public function setMenuParent($menuParent)
    {
        $this->menuParent = $menuParent;
    
        return $this;
    }

    /**
     * Get menuParent
     *
     * @return integer 
     */
    public function getMenuParent()
    {
        return $this->menuParent;
    }

    /**
     * Set menuType
     *
     * @param string $menuType
     * @return Menu
     */
    public function setMenuType($menuType)
    {
        $this->menuType = $menuType;
    
        return $this;
    }

    /**
     * Get menuType
     *
     * @return string 
     */
    public function getMenuType()
    {
        return $this->menuType;
    }
    /**
     * @var integer
     */
    private $menuSort;


    /**
     * Set menuSort
     *
     * @param integer $menuSort
     * @return Menu
     */
    public function setMenuSort($menuSort)
    {
        $this->menuSort = $menuSort;
    
        return $this;
    }

    /**
     * Get menuSort
     *
     * @return integer 
     */
    public function getMenuSort()
    {
        return $this->menuSort;
    }
}
