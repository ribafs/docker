# Exemplos de conexão com PDO no docker

Num container o host é o nome do container do mysql e não o IP ou nome do host

Não usamos

host = localhost ou 172.26.0.2

Usamos

host=mysql 

ou

host=maria

    <?php

    $conn = new PDO("mysql:host=maria;dbname=testes", 'root', 'root');

    $query = 'SELECT * From Person';
    $result = $conn->query($conn, $query);
    $execute = $result->execute();

    echo '<table class="table table-striped">';
    echo '<thead><tr><th></th><th>id</th><th>name</th></tr></thead>';
    while($value = $result->fetch_array(MYSQLI_ASSOC)){
        echo '<tr>';
        echo '<td><a href="#"><span class="glyphicon glyphicon-search"></span></a></td>';
        foreach($value as $element){
            echo '<td>' . $element . '</td>';
        }

        echo '</tr>';
    }
    echo '</table>';
    ?>

Na conexão com o banco de dados

- Host = mysql

docker run --add-host=docker:172.26.0.3 --rm -it debian
ping docker

mysql://host.docker.internal:3306/my_awesome_database

docker run -it --net=host  myimage

ifconfig

docker exec -it postgresql bash

docker-compose run --service-ports db

mysql -h 127.0.0.1 -P 3306 -u root

mysql -h localhost -P 3306 -u root

sudo docker exec -it <CONTAINER_ID> mysql -u root -p

mysql -h localhost -P 3306 --protocol=tcp -u root

PDO

$db = new PDO('mysql:host=mysql;port=3306;dbname=testapp', 'root', 'secret');

Because you named as so the MySQL compose service:

    mysql: # Por causa deste nome de serviço
      build:
        context: ./mysql

