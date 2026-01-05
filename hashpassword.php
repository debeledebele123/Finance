<?php
$password = "123456"; // your test password
$hashed = password_hash($password, PASSWORD_DEFAULT);
echo $hashed;
