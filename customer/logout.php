<?php

session_start();

session_destroy();

echo "<script>window.open('../checkout.php','_self')</script>";


?>