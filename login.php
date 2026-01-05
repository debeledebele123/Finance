<?php
session_start();
require_once "../config/db.php";

$error = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Check user in DB
    $stmt = $conn->prepare("SELECT id, full_name, role, password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
        $stmt->bind_result($id, $full_name, $role, $hashed_password);
        $stmt->fetch();

        if (password_verify($password, $hashed_password)) {
            // Login successful
            $_SESSION['user_id'] = $id;
            $_SESSION['user_name'] = $full_name;
            $_SESSION['user_role'] = $role;

            header("Location: ../dashboard/index.php");
            exit;
        } else {
            $error = "Invalid password";
        }
    } else {
        $error = "User not found";
    }
    $stmt->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login - School System Finance</title>
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <h2>Login</h2>
    <?php if($error) echo "<p style='color:red;'>$error</p>"; ?>
    <form method="POST" action="">
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>

        <button type="submit">Login</button>
    </form>
</body>
</html>
