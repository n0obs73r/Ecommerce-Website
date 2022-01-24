<?php
include("database.php");
if(!empty($_POST['hellotestcontact2']) && $_POST['hellotestcontact2'] == 'hellotestconnect2')
{
	$fullname = $_POST['testname'];
	$mailidg = $_POST['testemail'];
	$telpno = $_POST['phoneno'];
	$subj = $_POST['subjectp'];
	$besttc = $_POST['bestt'];
	$queryboxs = $_POST['massage2'];
	$sql = "insert into contactusformtable(full_name,mail_address,phone_number,subject_info,best_time,queries_info) values('$fullname','$mailidg','$telpno','$subj','$besttc','$queryboxs')";
	$success = mysqli_query($con,$sql);
	if($success)
	{
		$myemail = "pavan.rajanna93@gmail.com"; 
            $emailto = "info@thekoha.com"; 
            // $emailcc = "cc@domain.com"; 
            $emailcc = "";
            $subject = "Contact us email"; 
            // $headers = "From: $myemail"; 
            $headers = "From: $myemail\nMIME-Version: 1.0\nContent-Type: text/html; charset=utf-8\n";

            $body ="
            <html>
            <body>
            <table>
                <tr>                
                    <td>Name</td>
                    <td>$fullname</td>
                </tr>
                <tr>                
                    <td>Telephone</td>
                    <td>$telpno</td>
                </tr>
                <tr>                
                    <td>Email</td>
                    <td>$mailidg</td>
                </tr>
				<tr>                
                    <td>Subject</td>
                    <td>$subj</td>
                </tr>
				<tr>                
                    <td>Best Time to Contact</td>
                    <td>$besttc</td>
                </tr>
                <tr>                
                    <td>Comments</td>
                    <td>$queryboxs</td>
                </tr>
            </table>
            </body>
            </html>
            ";
            $send = mail($emailto, $subject . ' ' . "", $body, $headers); 
			echo "<script>alert('Your Contact Form Details are being successfully submitted')</script>";
		echo "<script>window.open('index.php','_self')</script>";
	}
	else
	{
		echo "<script>alert('Your Contact Form Details are not being submitted')</script>";
		echo "<script>window.open('index.php','_self')</script>";
	}
	
}
?>