<?php
try{
    $sql = "SELECT * FROM `cars` WHERE `active` = 1";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
  }catch(PDOException $e){
    echo "Connection failed: " . $e->getMessage();
  }
?>
<div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-7">
            <h2 class="section-heading"><strong>Car Listings</strong></h2>
            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>    
          </div>
        </div>
        
        <div class="row">
        <?php
                foreach($stmt->fetchAll() as $result){
                    $title = $result["title"];
	                $image = $result["image"];
	                $Luggage = $result["Luggage"];
	                $Doors = $result["Doors"];
                    $id = $result["id"];
	                $Passengers = $result["Passengers"];
	                $price = $result["price"];
                    $content = $result["content"];
                ?>
          <div class="col-md-6 col-lg-4 mb-4">

            <div class="listing d-block  align-items-stretch">
              <div class="listing-img h-100 mr-4">
                <img src="images/<?php echo $image ?>" alt="<?php echo $title ?>" class="img-fluid">
              </div>
              <div class="listing-contents h-100">
                <h3><?php echo $title ?></h3>
                <div class="rent-price">
                  <strong>$<?php echo $price ?></strong><span class="mx-1">/</span>day
                </div>
                <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                  <div class="listing-feature pr-4">
                    <span class="caption">Luggage:</span>
                    <span class="number"><?php echo $Luggage ?></span>
                  </div>
                  <div class="listing-feature pr-4">
                    <span class="caption">Doors:</span>
                    <span class="number"><?php echo $Doors ?></span>
                  </div>
                  <div class="listing-feature pr-4">
                    <span class="caption">Passenger:</span>
                    <span class="number"><?php echo $Passengers ?></span>
                  </div>
                </div>
                <div>
                  <p><?php echo $content ?>.</p>
                  <p><a href="single.php?id=<?php echo $id ?>" class="btn btn-primary btn-sm">Rent Now</a></p>
                </div>
              </div>

            </div>
          </div>
          <?php
                } ?>
        </div>
        
      </div>
    </div>