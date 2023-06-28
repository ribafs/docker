<?php
declare(strict_types = 1);

namespace App\Controllers;

use App\Models\Product;
// fetchAll to fetchAll
// fetch to fetch
class ProductController
{
    public function index()
    {
        $Product = new Product('products');
        $fetchAll = $Product->index();

        // Load the view. With views we can show $fetchAll
        require_once APP . 'views/templates/header.php';
        require_once APP . 'views/templates/menu.php';                
        require_once APP . 'views/products/index.php';
        require_once APP . 'views/templates/footer.php';
    }
    
    public function create()
    {
        $Product = new Product('products');
        if (isset($_POST['submit_create_product'])) {
            $Product->create($_POST['name'], $_POST['price']);
	        header('location: ' . URL . 'product/index');	
        }

        // Load view.
        require_once APP . 'views/templates/header.php';
        require_once APP . 'views/templates/menu.php';                                
        require_once APP . 'views/products/create.php';
        require_once APP . 'views/templates/footer.php';
    }

    public function edit($field_id)
    {
        if (isset($field_id)) {
            $Product = new Product('products');
            $fetchAll = $Product->index();
            $fetch = $Product->fetch($field_id);

            if ($fetch === false) {
                $error = new \Core\ErrorController();
                $error->index();
            } else {
                require_once APP . 'views/templates/header.php';
			    require_once APP . 'views/templates/menu.php';                        
                require_once APP . 'views/products/edit.php';
                require_once APP . 'views/templates/footer.php';
            }
        } else {
            header('location: ' . URL . 'product/index');
        }
    }

    public function update()
    {
        if (isset($_POST['submit_update_product'])) {
          $Product = new Product('products');
          $Product->update($_POST['name'], $_POST['price'], $_POST['field_id']);
        }
        header('location: ' . URL . 'product/index');
    }

    public function delete($field_id)
    {
        if (isset($field_id)) {
            $Product = new Product('products');
            $Product->delete($field_id);
        }
        header('location: ' . URL . 'product/index');
    }
    
    public function search()
    {
        if (isset($_GET["submit_search_product"])) {
            $Product = new Product();
            $products = $Product->search($_GET['keyword']);

            require_once APP . 'views/templates/header.php';
            require_once APP . 'views/products/search.php';
        //    require_once APP . 'views/templates/footer.php';
        }

        header('location: ' . URL . 'product/index');
    }
    
    
}
