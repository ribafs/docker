<?php
try {
    $dbh = new PDO('mysql:host=maria;dbname=testes', 'ribafs', 'ribafs');
    print 'Conectou';
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

