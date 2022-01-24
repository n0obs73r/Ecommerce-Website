<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="IE=edge, chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" href="images/kohafavicon.jpeg" type="image/png">
  <title>Koha Website</title>
  <link href="styles/bootstrap.min.css" rel="stylesheet">
  <link href="styles/backend.css" rel="stylesheet">
  <link href="styles/style.css" rel="stylesheet">

  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/magnific-popup.css"/>
	<link rel="stylesheet" href="css/animate.min.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<style>
/*--------------------------------------------------------------
# Breadcrumbs
--------------------------------------------------------------*/
.breadcrumbs {
  padding: 15px 0;
  background-color: #f3f8fa;
  min-height: 40px;
}
.breadcrumbs h2 {
  font-size: 28px;
  font-weight: 300;
}
.breadcrumbs ol {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  padding: 0;
  margin: 0;
}
.breadcrumbs ol li + li {
  padding-left: 10px;
}
.breadcrumbs ol li + li::before {
  display: inline-block;
  padding-right: 10px;
  color: #6c757d;
  content: "/";
}
@media (max-width: 768px) {
  .breadcrumbs .d-flex {
    display: block !important;
  }
  .breadcrumbs ol {
    display: block;
  }
  .breadcrumbs ol li {
    display: inline-block;
  }
  .test1
  {
  position:relative;
  right:489px;
  }
  .test2
  {
  position:relative;
  right:409px;
  }
  .test3
  {
  width:30%;
  }
}
	

    .logo 
	{
   width: 115px;
    background-color: #000000;
	}
	.about-col2 img{
width: 400px;
height: 100%;
padding:10px;
}
.more {
    margin: 30px;
    padding: 10px;
}
.btn1 {
    padding: 10px;
    border-radius: 20px;
    background: black;
    color: white;
    cursor: pointer;
}
.more2 {
    margin: 30px;
    padding: 10px;
}
.btn2 {
    padding: 10px;
    border-radius: 20px;
    background: black;
    color: white;
    cursor: pointer;
}
.banner1,.banner2,.banner3,.banner4{
    height: 100vh;
    width: 100%;
    position: absolute;
    left:0;
    overflow: hidden;
    top:100px;
}

.banner2 h2{
    color: white;
}


.banner1 img,.banner2 img,.banner3 img,.banner4 img{
    width:120%;
    position: absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    animation: zoom 3s linear infinite;
}
@keyframes zoom {
    100%{
        width: 100%;
    }
    
}
.banner1{
    animation: first_slide 12s linear infinite;
}
.banner2{
    animation: second_slide 12s linear infinite;
}
.banner3{
    animation: third_slide 12s linear infinite;
}
.banner4{
    animation: four_slide 12s linear infinite;
}
@keyframes first_slide {
  
0%{
    visibility: visible;
}
25%
{
    visibility: hidden;
}
50%
{
    visibility: hidden;
}
75%{
    visibility: hidden;
}
100%
{
    visibility: visible;
}
}
@keyframes second_slide {
  
0%{
    visibility: hidden;
}
25%
{
    visibility: hidden;
}
50%
{
    visibility: visible;
}
75%{
    visibility: hidden;
}
100%
{
    visibility: hidden;
}
}
@keyframes third_slide {

0%{
    visibility: hidden;
}
25%
{
    visibility: hidden;
}
50%
{
    visibility: hidden;
}
75%{
    visibility: visible;
}
100%
{
    visibility: hidden;
}
}
@keyframes four_slide {

0%{
    visibility: hidden;
}
25%
{
    visibility: hidden;
}
50%
{
    visibility: hidden;
}
75%{
    visibility: hidden;
}
100%
{
    visibility: visible;
}
}
/*  preloader*/

#preloder{
    background: #000 url("logo1.jpeg") no-repeat center center;
    background-size: 15%;
     height: 100vh;
     width: 100%;
     position: fixed;
     z-index: 100;
     top: 0;
     text-shadow:  0 0 0 50px rgb(234, 236, 233),
                 0 0 0 100px #fff,
                 0 0 0 150px #fff,
                 0 0 0 200px #fff,
                  0 0 0 250px #fff;
    animation :animate 5s linear infinite;
 }
 @keyframes animate {
     0%{
         filter: hue-rotate(0deg);
     }
     100%{
         filter: hue-rotate(360deg);
     }
     
 }
 .dropdown{
    background: #000;
    color: rgba(194, 191, 188, 0.973);
    border:none;
}
.footer-newsletter {
  padding: 50px 0;
  background: #000000;
}
.footer-newsletter h4 {
  font-size: 24px;
  margin: 0 0 20px 0;
  padding: 0;
  line-height: 1;
  font-weight: 600;
  color: #a2cce3;
}
.footer-newsletter form {
  margin-top: 30px;
  background: #fff;
  padding: 6px 10px;
  position: relative;
  border-radius: 50px;
}
.footer-newsletter form input[type=email] {
  border: 0;
  padding: 4px;
  width: calc(100% - 100px);
}
.footer-newsletter form input[type=submit] {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  border: 0;
  background: none;
  font-size: 16px;
  padding: 0 20px;
  margin: 3px;
  background: #68A4C4;
  color: #fff;
  transition: 0.3s;
  border-radius: 50px;
}
.footer-newsletter form input[type=submit]:hover {
  background: #468db3;
}
  .lets-pixelate {
      background-color: #000c0a;
      box-shadow: none;
      border: 2px solid #ddb253;
      border-radius: 10px;
    }

    .lets-pixelate a {
      color: white;
      text-decoration: none;
    }

    .lets-pixelate a>i {
      padding-top: 3px;
    }

    .lets-pixelate a>p {
      margin-bottom: 0px;
      padding-left: 8px;
    }

    .lets-pixelate:hover a>p {
      color: #fce9c0;
      transition: all .3s ease;
      -webkit-transition: all .3s ease;
    }
	</style>
  

