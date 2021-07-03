<h1>Conexão PDO via Docker - PostgreSQL</h1>
<?php
try {
    $dbh = new PDO('pgsql:host=postgres;dbname=testes', 'super', 'super');
    print 'Conectou';
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>
<h1>Conexão PDO via Docker - MariaDB</h1>
<?php
try {
    $dbh = new PDO('mysql:host=maria;dbname=testes', 'super', 'super');
    print 'Conectou';
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>

