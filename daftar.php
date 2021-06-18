<!doctype html>
<html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="nisa" content="register">
      <link rel="stylesheet" href="css/Style1.css">
      <title>Register</title>
    </head>
  <body>
     <div class="register-page">
        <div class="form">
            <form class="login-form" action="" method="post">
                 <h2>Register</h2>
            <?php
               
	
                if (isset($_POST["submit"])){
                    $nama=$_POST['nama'];
                    $tgl=$_POST['tgl'];
                    $user=$_POST['username'];
                    $pass=$_POST['password'];
                    $konfir=$_POST['konfir'];

                    if (empty($nama) || empty($tgl) || empty($user) || empty($pass) || empty($konfir)) {
                        echo '<div class="alert alert-danger mt-2" role="alert">Silahkan lengkapi form yang disediakan!</div>';
                    }
                    elseif($pass !== $konfir){
                        echo '<div class="alert alert-danger mt-2" role="alert">Konfimasi Password tidak benar!</div>';
                    }
                    else {
                         try {
                        $dbc = new PDO('mysql:host=localhost;dbname=instaapp','root',''); //Membuat koneksi db
                        $dbc -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                        $query = $dbc->prepare("INSERT INTO users VALUES (Null,:nama_lengkap, :tgl,'default.jpg',:username, SHA2(:password,0))");
                        $query->bindValue(':nama_lengkap', $nama);
                        $query->bindValue(':tgl', $_POST['tgl']);
                        $query->bindValue(':username', $_POST['username']);
                        $query->bindValue(':password', $_POST['password']);
                        $query->execute();
                        if ($query>0) {
                             echo "<script>alert('Anda berhasil mendaftar, silahkan login');window.location='login.php';</script>";
                        }
                       
                        }catch (Exception $err) {
		                echo $err->getMessage();
		
	                    }

                    }
                }
                
            ?>
            <form class="my-2" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="nama" placeholder="Nama Anda" value="<?php echo (isset($_POST['nama']))?$_POST['nama']:'';?>" required>
                </div>
                <div class="form-group">
                    <input type="date" class="form-control" name="tgl" placeholder="Tanggal Lahir" value="<?php echo (isset($_POST['tgl']))?$_POST['tgl']:'';?>" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username" value="<?php echo (isset($_POST['username']))?$_POST['username']:'';?>" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required value="<?php echo (isset($_POST['password']))?$_POST['password']:'';?>">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="konfir" placeholder="Konfirmasi Password" value="<?php echo (isset($_POST['konfir']))?$_POST['konfir']:'';?>" required>
                </div>

                <button type="submit" class="btn text-white btn-block bg-dark" name="submit">Daftar</button>
            </form>
            <small>Sudah punya akun? Masuk <a href="login.php" class="text-white">disini</a></small>
        </div>
    </div>
</div>

  </body>
</html>

