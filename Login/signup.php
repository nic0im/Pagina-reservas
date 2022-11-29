<?php

  require 'database.php';

  $message = 'Rellena los campos vacios';

  if (!empty($_POST['email']) && !empty($_POST['password'])) {
    $sql = "INSERT INTO hotel_user (email, password) VALUES (:email, :password)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $stmt->bindParam(':password', $password);

    if ($stmt->execute()) {
      $message = 'Usuario creado con exito!';
    } else {
      $message = 'Error al crear un usuario';
    }
  }
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Registrarse</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body>

    <?php require 'partials/header.php' ?>

    

    <h1>Registrarse</h1>
    <span>o <a href="login.php">Iniciar Sesion</a></span>

    <form action="signup.php" method="POST">
      <input name="email" type="text" placeholder="Ingresar Correo">
      <input name="password" type="password" placeholder="Ingresar contraseña">
      <input name="Nombre" type="text" placeholder="Nombre">
      <input name="Apellido" type="text" placeholder="Apellido">
      <input name="Dirreción" type="text" placeholder="Dirección">
      <a>Fecha de nacimiento</a>
      <input name="Fecha_nac" type="date" placeholder="Fecha de nacimiento">
      <br><br>
      <input type="submit" value="Submit">
      <?php if(!empty($message)): ?>
      <p> <?= $message ?></p>
    <?php endif; ?>
    </form>

  </body>
</html>
