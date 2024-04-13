<?php
include_once("includes/logged.php");
$_SESSION["delcar"]="";
if(isset($_GET["id"])){
    include_once("includes/conn.php");
    $id= $_GET["id"];
    try{
        $sql = "DELETE FROM `cars` WHERE id=?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id]);
        if($stmt->rowcount() > 0){
            $_SESSION["delcar"]= "Deleted successfully";
           }else{
            $_SESSION["delcar"]= "Invalid Data";
           }
    }catch(PDOException $e){
      $_SESSION["delcar"]= "Connection failed: " . $e->getMessage();   
}}else{
    $_SESSION["delcar"]="Invalid request";
}
header("Location: cars.php");
      die();
?>