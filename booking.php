<?php 
include_once 'config/Database.php';
include_once 'class/Booking.php';
include_once 'class/Rooms.php';

$database = new Database();
$db = $database->getConnection();

$booking = new Booking($db);
$rooms = new Rooms($db);



include('inc/header4.php');

$_SESSION['arrival'] = date("Y/m/d");
$_SESSION['departure'] =  date("Y/m/d");

if(isset($_GET['view']) && $_GET['view'] == 'process_cart' && isset($_GET['id'])){	
	$booking->room_id = $_GET['id'];
    $booking->removeFromCart();
}

if (isset($_POST['emptyCart'])){
   unset($_SESSION['pay']);
   unset($_SESSION['booking_cart']);   
}

if(isset($_POST['book_now'])){	
	$days = 5;
	$totalPrice = 5;
	if($days <= 0){
		$totalPrice = $_POST['room_price'] *5;
		$days = 5;
	} else {
		$totalPrice = $_POST['room_price'] * $days;
		$days = $days;
	}
	$booking->room_id = $_POST['room_id'];
	$booking->days = $days;
	$booking->total_price = $totalPrice;	
	$booking->addToCart();
}
?>
<title>Reservación</title>
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
<link rel="stylesheet" type="text/css" href="styles/custom-navbar.css">
<link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
<script src="js/general.js"></script>
<?php include('inc/container4.php');?>
<div class="container">		
	<div class="row">
		<div class="col">
			<div class="row">   
				<?php include('menus.php');?>
			</div>
			<div class="row">   
				<h1>Carrito de reservación</h1> 
			</div> 
			<div class="row">   
				<table class="table" id="table">
					<thead>
					<tr  bgcolor="#999999">				
						<th align="center" width="120">Departamento</th>
						<th align="center" width="120">Check In</th>
						<th align="center" width="120">Check Out</th> 
						<th  width="120">Precio</th> 
						<th align="center" width="120">Noches</th> 
						<th align="center" >Cantidad</th>
						<th align="center" width="90">Action</th> 
					</tr> 
					</thead>				
					<tbody>
						<?php
						$payable = 0;
						if (isset( $_SESSION['booking_cart'])){
							$cartCount = count($_SESSION['booking_cart']);
							for ($i=0; $i < $cartCount  ; $i++) {								
								$rooms->room_id = $_SESSION['booking_cart'][$i]['bookingroomid'];
								$roomsResult = $rooms->getRoomDetails();
								while ($room = $roomsResult->fetch_assoc()) { 				
								?>
								<tr>
									<td><?php echo $room['description']; ?></td>
									<td><?php echo date_format(date_create($_SESSION['booking_cart'][$i]['bookingcheckin']),"d/m/Y"); ?></td>
									<td><?php echo date_format(date_create($_SESSION['booking_cart'][$i]['bookingcheckin']),"d/m/Y"); ?></td>
									<td>$<?php echo $room['price']; ?></td>
									<td><?php echo $_SESSION['booking_cart'][$i]['bookingday']; ?></td>
									<td><?php echo $_SESSION['booking_cart'][$i]['bookingroomprice']; ?></td>
									<td><a href="booking.php?view=process_cart&id=<?php echo $room['id']; ?>">Remove</a></td>
								</tr>
						<?php 
								}
								$payable += $_SESSION['booking_cart'][$i]['bookingroomprice'];
							}
							$_SESSION['pay'] = $payable;
						} 
						?>
					</tbody>				
					<tfoot>
						<tr>
							<td colspan="6"><h4 align="right">Total:</h4></td>
							<td colspan="4">
								<h4><b><span id="sum"><?php  echo isset($_SESSION['pay']) ?  '$'.$_SESSION['pay'] :'El carro esta vacio.';?></span></b></h4>
							</td>
						</tr>
					</tfoot> 				
				</table>				
			</div>
			
			<form method="post" action="">
				<div class="row" >
				<?php
				if (isset($_SESSION['booking_cart'])){
				?> 
					<button type="submit" class="button" name="emptyCart">Vaciar Carrito</button> 
					<?php

					if (isset($_SESSION['GUESTID'])){
					?>
						<div  class="button"><a href="booking.php?view=payment" name="continue">Continuar Agendando</a></div>
					<?php 
					} else { ?>
						<div  class="button"><a href="/Login/index.php"  name="continue">Continuar Agendando</a></div>
					<?php
					}
				}
				?>
				</div>
			</form>				
		</div>
	</div>
</div>
<?php include('inc/footer4.php');?>