<?php
include_once("includes/logged.php");
$_SESSION["delcat"]="";
if(isset($_GET["id"])){
    include_once("includes/conn.php");
    $id= $_GET["id"];
    try{
        $sql = "DELETE FROM `categories` WHERE `id`=? and NOT EXISTS (SELECT * FROM `cars` WHERE `cat_id`= ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id, $id]);
        if($stmt->rowcount() > 0){
            $_SESSION["delcat"]= "Deleted successfully";
           }else{
            $_SESSION["delcat"]= "Category is not empty";
           }
    }catch(PDOException $e){
        $_SESSION["delcat"]= "Connection failed: " . $e->getMessage();   
}}else{
    $_SESSION["delcat"]="Invalid request";
}
header("Location: categories.php");
      die();
?>