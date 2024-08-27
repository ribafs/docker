<?php
    if(isset($_GET['keyword'])){
        print '<div class="container" align="center">';

        if(count($products) > 0){
    ?>
		<h3>Register(s) found: <?=count($products)?></h3> 
        <div class="container" align="center">
            <table class="table table-striped table-sm table-bordered table-hover"> 
            <tr>
              <th>ID</th><th>Name</th><th>Price</th>
            </tr>
     
        <?php
            foreach ($products as $row){
              print '<tr>';
              print '<td>'.$row->id.'</td><td>'.$row->name.'</td><td>'.$row->price.'</td>';
              print '</tr>';
            } 
            echo "</table>";
        }else{
            print '<h3>Register not found!</h3>';
        }
    }
    require_once APP . 'views/templates/footer.php';        
    exit;
?>
