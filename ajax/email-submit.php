<?php

include_once("../config/Config.php");

$email_access = new Config();

if(isset($_POST['email_data_values'])){

    $n_email = $_POST['email_data_values'];
    $email = $email_access->htmlfilter($n_email);

    if(preg_match('/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/', $email)){

        $email_field['email'] = $email;
        $email_check = $email_access->email_exits("email",$email_field);

        if($email_check){

            $insert = $email_access->insert("email",$email_field);
            if($insert){
                $message ="Thanks for subscribing to our blog. You'll always receive updates from us. And we won't share and sell your information.";
                $subject ="Welcome to Koha Family";
                $sender = "From:info@koha.com";
                if(mail($email,$subject,$message,$sender)){
                    echo "Mail has sent successfully!<br>";
                }else{
                    echo"Mail has not been sent";
                }
                echo "<br>Thank You For Subscribing";
            }
            else{
                echo "Not Subscribed";
                return false;
            }

        }
        else{
            echo "You Have Already Subscribed";
            return false;
        }

    }
    else{
        if(!preg_match('/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/', $email)){
            echo "Please Enter a Valid Email";
            return false;
        }
    }

}


?>