<?php
if($_SERVER["REQUEST_METHOD"]==="POST"){
  include_once("includes/conn.php");
  $fullname=$_POST["fullname"];
  $username=$_POST["username"];
  $pass=password_hash($_POST["password"], PASSWORD_DEFAULT);
  $email=$_POST["email"];
  try{
    $sql = "INSERT INTO `users`(`email`, `fullname`, `password`, `username`) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$email, $fullname, $pass, $username]);
    echo "Data inserted successfully";
    header("Location: login.php");
    die();
}catch(PDOException $e){
    echo "Connection failed: " . $e->getMessage();
}
}
?>