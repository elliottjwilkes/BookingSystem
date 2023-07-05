<!DOCTYPE html>
<html lang='en-GB'>
  <head>
    <title>Session Booking</title>
  </head>
  <body>
    <?php      
  
      //Database information
      $db_hostname = "studdb.csc.liv.ac.uk";
      $db_database = "sgewilke";
      $db_username = "sgewilke";
      $db_password = "Wolves34!";
      $db_charset = "utf8mb4";
      
      //PDO creation
      $dsn = "mysql:host=$db_hostname;dbname=$db_database;charset=$db_charset";
      $opt = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false
      );
      $pdo = new PDO($dsn, $db_username, $db_password, $opt);

      //Selecting Module codes from table with free spaces
      $stmt = $pdo->query("SELECT DISTINCT module_code FROM sessions WHERE taken_spaces < capacity");
      $modules = $stmt->fetchAll();
      
      //If a module is selected fetch sessions with spaces
      if (isset($_POST['select_module'])) {
        $selected_module = htmlspecialchars($_POST['module']);
        $stmt = $pdo->prepare("SELECT * FROM sessions WHERE taken_spaces < capacity AND module_code = :module_code ORDER BY day, time");
        $stmt->bindParam(':module_code', $selected_module);
        $stmt->execute();
        $sessions = $stmt->fetchAll();
      }
          
      //If form is submitted, go through steps to book session   
      if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['session']) && !isset($_POST['select_module']) && isset($_POST['submit'])){
      
        $name = htmlspecialchars($_POST['name']);
        $email = htmlspecialchars($_POST['email']);
        $session_id = htmlspecialchars($_POST['session']);
        
        //Input Validation
        if (!name_check($name)) {
          echo "<p>Error: Invalid name</p>";
        } else if(!email_check($email)){
          echo "<p>Error: Invalid email address</p>";
        } else {
          try {
          //Database transaction to add booking to db
            echo "<p>Booking Successful</p>";
            $pdo->beginTransaction();
            $pdo->exec("LOCK TABLES sessions WRITE, bookings WRITE");
      
            //Fetch currently selected module      
            $stmt = $pdo->prepare("SELECT taken_spaces, capacity FROM sessions WHERE id = :session_id");
            $stmt->bindParam(':session_id', $session_id);
            $stmt->execute();
            $session_info = $stmt->fetch();
            
            //Check space
            if ($session_info['taken_spaces'] < $session_info['capacity']) {
            //Insertion of information to bookings
              $stmt = $pdo->prepare("INSERT INTO bookings (session_id, name, email) VALUES (:session_id, :name, :email)");
              $stmt->bindParam(':session_id', $session_id);
              $stmt->bindParam(':name', $name);
              $stmt->bindParam(':email', $email);
              $stmt->execute();
            //Increment taken spaces
              $stmt = $pdo->prepare("UPDATE sessions SET taken_spaces = taken_spaces + 1 WHERE id = :session_id");
              $stmt->bindParam(':session_id', $session_id);
              $stmt->execute();
      
              $pdo->commit();
              $pdo->exec("UNLOCK TABLES");
            } else {
              echo "<p>Session is fully booked</p>";
            }
          } catch (PDOException $e) {
          //If error rollback
              $pdo->rollBack();
              $pdo->exec("UNLOCK TABLES");
              echo "<p>Database Error</p>";
              exit("PDO Error: ".$e->getMessage()."<br>");
          }
        }
      } else {
      
    ?>
          <h1>Make a Booking</h1>
          <?php if (!empty($modules)) : ?>
          <form method="post">
            <label for="module">Choose a module:</label>
            <select name="module" id="module">
            //Show module dropdown
              <option value="">Select a module</option>
              <?php
              foreach ($modules as $module) {
                $selected = isset($selected_module) && $selected_module == $module['module_code'] ? "selected" : "";
                echo "<option value='{$module['module_code']}' {$selected}>{$module['module_code']}</option>";
              }
              ?>
            </select>
            <input type="submit" name="select_module" value="Select Module"><br><br>
            <!-- Show sessions once module is selected -->
            <?php if (isset($selected_module)) : ?>
              <label for="session">Choose a session:</label>
              <select name="session" id="session">
                <?php
                foreach ($sessions as $session) {
                  echo "<option value='{$session['id']}'>{$session['day']} - {$session['time']} - Lab {$session['lab']}</option>";
                }endif;
                ?>
              </select><br><br>
            <?php endif; ?>
            <label for="name">Name:</label>
            <input type="text" name="name" id="name"><br><br>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email"><br><br>
            <input type="submit" name="submit" value="Submit">
          </form>
    <?php
      }
      //Functions for name and email validation
      function name_check($name){
        if(preg_match('/^[a-zA-Z\'\s-]+$/', $name) && preg_match('/^[a-zA-Z]/', $name) && !preg_match('/--/', $name) && !preg_match('/\'\'/', $name)){
          return true;
        }else{
          return false;
        }
      }
      
      function email_check($email){
        if(preg_match('/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/', $email) && !preg_match('/\.\./', $email) && !preg_match('/\.$/', $email) && !preg_match('/-$/', $email)){
          return true;
        }else{
          return false;
        }
      }
      ?>
  </body>
</html>