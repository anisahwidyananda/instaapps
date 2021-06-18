<?php

    if (isset($_POST['submit'])) {
			$pdo = new PDO ('mysql:host=localhost;dbname=instaapp','root','');
			$pdo ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			try {
				$query = $pdo->prepare('SELECT * FROM  users WHERE username = :username and pwd = SHA2(:password,0)');
				$query->bindValue(':username', $_POST['username']);
				$query->bindValue(':password', $_POST['password']);
				$query->execute();
				if($query->rowCount()>0){
                     foreach ($query as $row) { //Mengambil beberapa data pada db
			            $session = $row['id']; //parameter terdefinisi nilainya berisi id user
			
		}
					session_start();
					$_SESSION['isMember'] = true;
                     $_SESSION['id'] = $session;
        
					header('Location:index.php');
					exit();

				}
			
		} catch (PDOException $e) {
			echo $e -> getMassage();
			
		}
	}
		
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css">
    <title>Login</title>
</head>

<body>
    <div class="login-page">
        <div class="form">
            <form class="my-2" method="post">
                <h2>Login</h2>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>

                <button type="submit" class="btn text-white btn-block bg-dark" name="submit">Login</button>
                <p class="message">Sudahkah Mendaftar? <a href="daftar.php">Buat Akun Disini</a></p>
            </form>
        </div>
    </div>
    </div>
    </div>
    </div>
</body>

</html>