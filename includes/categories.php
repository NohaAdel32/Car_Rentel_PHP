<?php
$counter = 0;
try{
  $sql = "SELECT * FROM `categories`";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
}catch(PDOException $e){
  echo "Connection failed: " . $e->getMessage();
}
?>
<div class="sidebar-box">
              <div class="categories">
                <h3>Categories</h3>
                <?php 
                foreach($stmt->fetchAll() as $row){
                           $category=$row["category"];
                           $id=$row["id"];
                           try{
                            $sqlcar = "SELECT * FROM `cars` WHERE cat_id=?";
                            $stmtcar = $conn->prepare($sqlcar);
                            $stmtcar->execute([$id]);
                          }catch(PDOException $e){
                            echo "Connection failed: " . $e->getMessage();
                          }
                          foreach($stmtcar->fetchALL() as $result){
                            $counter++;
                          }
                            ?>
                <li><a href="#"><?php echo $category ?> <span>(<?php echo $counter ?>)</span></a></li>
                <?php
                $counter=0;
                } ?>
              </div>
            </div>