<?php
session_start();

  require 'database.php';
 


  if (isset($_SESSION['user_id'])) {
    $records = $conn->prepare('SELECT id, email, password FROM hotel_user WHERE id = :id');
    $records->bindParam(':id', $_SESSION['user_id']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $user = null;

    if (count($results) > 0) {
      $user = $results;
    }
  }

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Inicia sesion</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body>
    <?php require 'partials/header.php' ?>

    <?php if(!empty($user)): ?>
      <br> Bienvenido. <?= $user['email']; ?>
      <br>Has iniciado sesion correctamente!
      <a href="logout.php">
        Cerrar Sesion
      </a>
    <?php else: ?>
      <h1>Porfavor Inicia Sesion o Registrate</h1>
      <div><img src="images/login.JPG"></div>
      <br>
      
      <a href="login.php">Iniciar Sesion</a> o
      <a href="signup.php">Registrarse</a>
    <?php endif; ?>
  </body>
</html>
