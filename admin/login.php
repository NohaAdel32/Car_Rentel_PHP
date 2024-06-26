<?php
$ps="";
$acc="";
session_start();
if(isset($_SESSION["logged"]) && $_SESSION["logged"] ){
  header("Location: users.php");
  die();
} 
if($_SERVER["REQUEST_METHOD"]==="POST"){
  include_once("includes/conn.php");
  $pass=$_POST["password"];
  $username=$_POST["username"];
  try{
    $sql = "SELECT `password` ,`id`,`fullname` FROM `users` WHERE `username`= ? and `active`=1";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$username]);
    if($stmt->rowcount() > 0){
      $result =$stmt->fetch();
      $id=$result["id"];
      $fullname=$result["fullname"];
      $hash=$result["password"];
      $verity=password_verify($pass, $hash);
      if($verity){
        $_SESSION["logged"]= true;
        $_SESSION['username']=$fullname;
        header("Location: users.php");
      die();
      }else{
       $ps= "password is incorrect";
      }
    }else{
     $acc= "Not Account Found";
    }
}catch(PDOException $e){
    echo "Connection failed: " . $e->getMessage();
}
}

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Rent Car Admin | Login/Register</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
          <font color="red"><?php echo $acc ?></font>
            <form action="" method="POST" name="log">
              <h1>Login Form</h1>
              <div>
                <input type="text" class="form-control" name="username" placeholder="Username" required="" />
              </div>
              <div>
                <input type="password" class="form-control" name="password" placeholder="Password" required="" />
                <font color="red"><?php echo $ps ?></font>
              </div>
              <div>
                <a class="btn btn-default submit" href="#" onclick="document.forms['log'].submit();">Log in</a>
                <a class="reset_pass" href="#">Lost your password?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-car"></i></i> Rent Car Admin</h1>
                  <p>©2016 All Rights Reserved. Rent Car Admin is a Bootstrap 4 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form action="registration.php" method="POST" name="reg">
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" name="fullname" placeholder="Fullname" required="" />
              </div>
              <div>
                <input type="text" class="form-control" name="username" placeholder="Username" required="" />
              </div>
              <div>
                <input type="email" class="form-control" name="email" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" name="password" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="#" onclick="document.forms['reg'].submit();">Submit</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-car"></i></i> Rent Car Admin</h1>
                  <p>©2016 All Rights Reserved. Rent Car Admin is a Bootstrap 4 template. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
