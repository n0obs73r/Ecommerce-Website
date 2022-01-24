-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2022 at 05:36 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u908947830_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_country` text NOT NULL,
  `admin_job` varchar(255) NOT NULL,
  `admin_about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_contact`, `admin_country`, `admin_job`, `admin_about`) VALUES
(3, 'Dheeraj Rao Pathur', 'dheeraj@bleamtech.com', 'dtoGNTe5@4', 'Dheeraj.jpg', '+91 - 7348816820', 'India', 'Technical Lead', '  A Enthusiastic Software Developer bound to develop new Software things frequently with ease and pleasure.. '),
(5, 'Pavan Rajanna', 'pavan.rajanna93@gmail.com', 'pavanpavagada1234', 'man.png', '9886745518', 'India', 'CEO', ' A Enthusiastic CEO looking to build Koha');

-- --------------------------------------------------------

--
-- Table structure for table `bundle_product_relation`
--

CREATE TABLE `bundle_product_relation` (
  `rel_id` int(10) NOT NULL,
  `rel_title` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `bundle_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bundle_product_relation`
--

INSERT INTO `bundle_product_relation` (`rel_id`, `rel_title`, `product_id`, `bundle_id`) VALUES
(11, 'Animal + Accessories', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_top` text NOT NULL,
  `cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(1, 'Marketplace', 'yes', 'accessories.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contactusformtable`
--

CREATE TABLE `contactusformtable` (
  `ID` int(255) NOT NULL,
  `full_name` text NOT NULL,
  `mail_address` text NOT NULL,
  `phone_number` text NOT NULL,
  `subject_info` text NOT NULL,
  `queries_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactusformtable`
--

INSERT INTO `contactusformtable` (`ID`, `full_name`, `mail_address`, `phone_number`, `subject_info`, `queries_info`) VALUES
(1, 'Dheeraj Rao Pathur', 'dheerajraopathur@gmail.com', '+917348816820', 'test', 'Test message'),
(6, 'Dheeraj Rao Pathur', 'dheerajraopathur@gmail.com', '+917348816820', 'test', 'Test message'),
(8, 'Dheeraj Rao Pathur', 'dheerajraopathur@gmail.com', '+917348816820', 'test', 'test rest'),
(9, 'Dheeraj Rao Pathur', 'dheerajraopathur@gmail.com', '+917348816820', 'test', 'test rest'),
(10, 'Dheeraj Rao Pathur', 'dheerajraopathur@gmail.com', '+917348816820', 'test', 'test rest');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(100) NOT NULL,
  `coupon_used` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(1, 4, 'Koha 1st Coupon Code', '1000', 'KC100', 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(255) NOT NULL,
  `customer_confirm_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`, `customer_confirm_code`) VALUES
(1, 'Dheeraj Rao Pathur', 'dheerajraopathur@gmail.com', 'dtoGNTe5@4', 'India', 'Bangalore', '7348816820', '#F-9 , Sai Gokul Apartments , 14th Main Road , Jayanagar 4th Block , Bangalore - 560011', 'Dheeraj.jpg', '2', '122'),
(3, 'Dheeraj Rao Pathur', 'dheeraj@bleamtech.com', 'htoGNTe5@4', 'India', 'Bangalore', '9886745518', 'F-9,Sai Gokul Apartments,Jayanagar 4th Block', 'Dheeraj.jpg', '::1', '1382192111'),
(4, 'Aryan Dadheech', 'aryan.prince999@gmail.com', 'aryan.prince999@gmail.com', 'India', 'CHITTORGARH', '9571114139', 'B-23, GOPAL NAGAR, SEMALPURA', 'Screenshot (7).png', '::1', '2064003424'),
(5, 'Aryan Dadheech', 'aryan.18bcon297@jecrcu.edu.in', 'aryan.18bcon297@jecrcu.edu.in', 'India', 'Chittaurgarh', '9571114139', 'Gopal Nagar', 'Screenshot (2).png', '::1', '1011671550');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lego_img` varchar(500) DEFAULT NULL,
  `lego_colorcode` varchar(500) DEFAULT NULL,
  `lego_codeimg` varchar(500) DEFAULT NULL,
  `lego_csv` varchar(500) DEFAULT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `lego_img`, `lego_colorcode`, `lego_codeimg`, `lego_csv`, `order_status`) VALUES
(1, 3, 1000, 196830301, 1, 'Medium', '2022-01-24 02:58:15', NULL, NULL, NULL, NULL, 'Complete'),
(780, 3, 288, 1544288566, 3, 'Medium', '2022-01-23 20:46:03', NULL, NULL, NULL, NULL, 'pending'),
(782, 3, 690, 96131921, 3, 'Medium', '2022-01-23 20:52:25', NULL, NULL, NULL, NULL, 'pending'),
(782, 3, 2000, 96131921, 2, 'Small', '2022-01-23 20:52:26', NULL, NULL, NULL, NULL, 'pending'),
(784, 3, 460, 1272985461, 2, 'Large', '2022-01-23 20:54:59', NULL, NULL, NULL, NULL, 'pending'),
(784, 3, 3000, 1272985461, 3, 'Medium', '2022-01-23 20:55:01', NULL, NULL, NULL, NULL, 'pending'),
(780, 3, 690, 1216519765, 3, 'Medium', '2022-01-23 21:00:35', NULL, NULL, NULL, NULL, 'pending'),
(780, 3, 1000, 1216519765, 1, 'Medium', '2022-01-23 21:00:36', NULL, NULL, NULL, NULL, 'pending'),
(780, 3, 690, 867613971, 3, 'Large', '2022-01-23 21:01:36', NULL, NULL, NULL, NULL, 'pending'),
(780, 3, 2000, 867613971, 2, 'Small', '2022-01-23 21:01:36', NULL, NULL, NULL, NULL, 'pending'),
(780, 3, 5000, 1687814977, 5, 'Small', '2022-01-23 21:05:35', NULL, NULL, NULL, NULL, 'pending'),
(780, 3, 690, 1995135601, 3, 'Large', '2022-01-23 21:07:01', NULL, NULL, NULL, NULL, 'pending'),
(780, 3, 2000, 1995135601, 2, 'Medium', '2022-01-23 21:07:01', NULL, NULL, NULL, NULL, 'pending'),
(793, 3, 920, 1507411657, 4, 'Small', '2022-01-23 21:08:30', NULL, NULL, NULL, NULL, 'pending'),
(793, 3, 2000, 1507411657, 2, 'Medium', '2022-01-23 21:08:31', NULL, NULL, NULL, NULL, 'pending'),
(100, 3, 230, 750880551, 1, 'Small', '2022-01-23 21:11:18', NULL, NULL, NULL, NULL, 'pending'),
(100, 3, 460, 530884351, 2, 'Medium', '2022-01-23 21:11:57', NULL, NULL, NULL, NULL, 'pending'),
(100, 3, 460, 618965185, 2, 'Small', '2022-01-23 21:12:24', NULL, NULL, NULL, NULL, 'pending'),
(100, 3, 230, 1357499841, 1, 'Small', '2022-01-23 21:12:58', NULL, NULL, NULL, NULL, 'pending'),
(100, 3, 1225, 1357499841, 5, 'Small', '2022-01-23 21:12:59', NULL, NULL, NULL, NULL, 'pending'),
(100, 3, 980, 1626865057, 4, 'Large', '2022-01-23 21:15:17', NULL, NULL, NULL, NULL, 'pending'),
(1600, 3, 196, 512388376, 2, 'Small', '2022-01-23 21:15:49', NULL, NULL, NULL, NULL, 'pending'),
(1600, 3, 735, 512388376, 3, 'Medium', '2022-01-23 21:15:49', NULL, NULL, NULL, NULL, 'pending'),
(1600, 3, 294, 1843925129, 3, 'Medium', '2022-01-23 21:16:33', NULL, NULL, NULL, NULL, 'pending'),
(1600, 3, 460, 1784749967, 2, 'Large', '2022-01-23 21:17:13', NULL, NULL, NULL, NULL, 'pending'),
(1600, 3, 2000, 1784749967, 2, 'Small', '2022-01-23 21:17:13', NULL, NULL, NULL, NULL, 'pending'),
(1626, 3, 690, 537656117, 3, 'Medium', '2022-01-23 21:18:05', NULL, NULL, NULL, NULL, 'pending'),
(1626, 3, 3000, 537656117, 3, 'Small', '2022-01-23 21:18:05', NULL, NULL, NULL, NULL, 'pending'),
(1600, 3, 920, 1360753986, 4, 'Medium', '2022-01-23 21:19:30', NULL, NULL, NULL, NULL, 'pending'),
(1600, 3, 2000, 1360753986, 2, 'Medium', '2022-01-23 21:19:30', NULL, NULL, NULL, NULL, 'pending'),
(1630, 3, 2000, 1123468240, 2, 'Small', '2022-01-23 21:20:09', NULL, NULL, NULL, NULL, 'pending'),
(1631, 3, 3000, 466038102, 3, 'Small', '2022-01-23 21:20:36', NULL, NULL, NULL, NULL, 'pending'),
(1632, 3, 600, 766474557, 3, 'Small', '2022-01-23 21:22:06', NULL, NULL, NULL, NULL, 'pending'),
(1632, 3, 3000, 766474557, 3, 'Small', '2022-01-23 21:22:06', NULL, NULL, NULL, NULL, 'pending'),
(1634, 3, 1150, 601936673, 5, 'Small', '2022-01-23 21:22:56', NULL, NULL, NULL, NULL, 'pending'),
(1634, 3, 3000, 601936673, 3, 'Large', '2022-01-23 21:22:56', NULL, NULL, NULL, NULL, 'pending'),
(1636, 3, 4000, 1803190271, 4, 'Medium', '2022-01-23 21:25:55', NULL, NULL, NULL, NULL, 'pending'),
(1637, 3, 98, 333129256, 1, 'Small', '2022-01-23 21:31:03', NULL, NULL, NULL, NULL, 'pending'),
(1638, 3, 1000, 388884705, 1, 'Medium', '2022-01-23 21:33:52', NULL, NULL, NULL, NULL, 'pending'),
(1639, 3, 2000, 1275937560, 2, 'Medium', '2022-01-23 21:37:43', NULL, NULL, NULL, NULL, 'pending'),
(1640, 3, 230, 95964666, 1, 'Medium', '2022-01-23 21:38:48', NULL, NULL, NULL, NULL, 'pending'),
(1640, 3, 259, 95964666, 1, 'Small', '2022-01-23 21:38:48', NULL, NULL, NULL, NULL, 'pending'),
(1640, 3, 100, 95964666, 1, 'Small', '2022-01-23 21:38:48', NULL, NULL, NULL, NULL, 'pending'),
(1640, 3, 1000, 95964666, 1, 'Small', '2022-01-23 21:38:48', NULL, NULL, NULL, NULL, 'pending'),
(1644, 3, 460, 2070362596, 2, 'Large', '2022-01-23 21:45:43', NULL, NULL, NULL, NULL, 'pending'),
(1644, 3, 490, 2070362596, 2, 'Large', '2022-01-23 21:45:43', NULL, NULL, NULL, NULL, 'pending'),
(1644, 3, 2000, 2070362596, 2, 'Large', '2022-01-23 21:45:43', NULL, NULL, NULL, NULL, 'pending'),
(1647, 3, 690, 630631348, 3, 'Medium', '2022-01-23 21:46:53', NULL, NULL, NULL, NULL, 'pending'),
(1647, 3, 2000, 630631348, 2, 'Medium', '2022-01-23 21:46:53', NULL, NULL, NULL, NULL, 'pending'),
(1649, 3, 4000, 920502545, 4, 'Large', '2022-01-23 21:53:03', NULL, NULL, NULL, NULL, 'pending'),
(1650, 3, 920, 1338929433, 4, 'Small', '2022-01-23 21:55:27', NULL, NULL, NULL, NULL, 'pending'),
(1650, 3, 735, 1338929433, 3, 'Large', '2022-01-23 21:55:27', NULL, NULL, NULL, NULL, 'pending'),
(1650, 3, 2000, 1338929433, 2, 'Large', '2022-01-23 21:55:27', NULL, NULL, NULL, NULL, 'pending'),
(1653, 3, 2000, 487130520, 2, 'Large', '2022-01-23 22:03:12', NULL, NULL, NULL, NULL, 'pending'),
(1654, 3, 2000, 428343615, 2, 'Medium', '2022-01-23 22:06:43', NULL, NULL, NULL, NULL, 'pending'),
(1655, 3, 690, 1335908245, 3, 'Medium', '2022-01-23 22:16:03', NULL, NULL, NULL, NULL, 'pending'),
(1655, 3, 980, 1335908245, 4, 'Large', '2022-01-23 22:16:03', NULL, NULL, NULL, NULL, 'pending'),
(1655, 3, 1000, 1335908245, 1, 'Small', '2022-01-23 22:16:03', NULL, NULL, NULL, NULL, 'pending'),
(1658, 3, 690, 1908573504, 3, 'Medium', '2022-01-24 02:59:32', NULL, NULL, NULL, NULL, 'Complete'),
(1658, 3, 2000, 1908573504, 2, 'Medium', '2022-01-24 02:59:32', NULL, NULL, NULL, NULL, 'Complete'),
(1660, 3, 460, 39098577, 2, 'Large', '2022-01-24 02:59:03', NULL, NULL, NULL, NULL, 'Complete'),
(1660, 3, 490, 39098577, 2, 'Medium', '2022-01-24 02:59:03', NULL, NULL, NULL, NULL, 'Complete'),
(1662, 3, 5000, 777563136, 5, 'Medium', '2022-01-24 03:09:26', NULL, NULL, NULL, NULL, 'pending'),
(1663, 3, 3000, 1026002080, 3, 'Medium', '2022-01-24 03:10:40', NULL, NULL, NULL, NULL, 'pending'),
(1664, 3, 980, 1973948800, 4, 'Small', '2022-01-24 03:11:20', NULL, NULL, NULL, NULL, 'pending'),
(1665, 3, 980, 887149200, 4, 'Medium', '2022-01-24 03:20:32', NULL, NULL, NULL, NULL, 'pending'),
(1666, 3, 3000, 860937113, 3, 'Medium', '2022-01-24 03:23:13', NULL, NULL, NULL, NULL, 'pending'),
(1667, 3, 2000, 1039984132, 2, 'Medium', '2022-01-24 03:27:05', NULL, NULL, NULL, NULL, 'pending'),
(1668, 3, 2000, 1853517772, 2, 'Medium', '2022-01-24 03:32:04', NULL, NULL, NULL, NULL, 'pending'),
(1669, 3, 4000, 1689664978, 4, 'Large', '2022-01-24 03:35:40', NULL, NULL, NULL, NULL, 'pending'),
(1670, 3, 294, 2119518571, 3, 'Large', '2022-01-24 03:38:48', NULL, NULL, NULL, NULL, 'pending'),
(1670, 3, 460, 2119518571, 2, 'Medium', '2022-01-24 03:38:48', NULL, NULL, NULL, NULL, 'pending'),
(1670, 3, 3000, 2119518571, 3, 'Medium', '2022-01-24 03:38:48', NULL, NULL, NULL, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `lego`
--

CREATE TABLE `lego` (
  `lego_img` varchar(500) DEFAULT NULL,
  `lego_colorcode` varchar(500) DEFAULT NULL,
  `lego_codeimg` varchar(500) DEFAULT NULL,
  `lego_csv` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lego`
--

INSERT INTO `lego` (`lego_img`, `lego_colorcode`, `lego_codeimg`, `lego_csv`) VALUES
('outputs/testimonial_lego.png', 'outputs/testimonial_color_code.png', 'outputs/testimonial_output.png', 'outputs/testimonial_csv.csv');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` int(10) NOT NULL,
  `manufacturer_title` text NOT NULL,
  `manufacturer_top` text NOT NULL,
  `manufacturer_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_title`, `manufacturer_top`, `manufacturer_image`) VALUES
(1, 'Koha ', 'yes', 'mnstore.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(1, 13123, 123123, 'UBL/Omni Paisa', 0, 3, 'dwdw'),
(2, 21312312, 2313, 'Easy paisa', 12313, 23123, '123213123'),
(3, 3123, 123123, 'Easy paisa', 123123, 123123231, '23131'),
(4, 2431, 2133132, 'Bank Code', 2147483647, 23131, '23123');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `size`, `order_status`) VALUES
(1, 3, 196830301, '9', 1, 'Medium', 'Complete'),
(780, 3, 1544288566, '4', 3, 'Medium', 'pending'),
(782, 3, 96131921, '2', 3, 'Medium', 'pending'),
(782, 3, 96131921, '9', 2, 'Small', 'pending'),
(784, 3, 1272985461, '2', 2, 'Large', 'pending'),
(784, 3, 1272985461, '9', 3, 'Medium', 'pending'),
(780, 3, 1216519765, '2', 3, 'Medium', 'pending'),
(780, 3, 1216519765, '9', 1, 'Medium', 'pending'),
(780, 3, 867613971, '2', 3, 'Large', 'pending'),
(780, 3, 867613971, '9', 2, 'Small', 'pending'),
(780, 3, 1687814977, '9', 5, 'Small', 'pending'),
(780, 3, 1995135601, '2', 3, 'Large', 'pending'),
(780, 3, 1995135601, '9', 2, 'Medium', 'pending'),
(793, 3, 1507411657, '2', 4, 'Small', 'pending'),
(793, 3, 1507411657, '9', 2, 'Medium', 'pending'),
(100, 3, 750880551, '2', 1, 'Small', 'pending'),
(100, 3, 530884351, '2', 2, 'Medium', 'pending'),
(100, 3, 618965185, '2', 2, 'Small', 'pending'),
(100, 3, 1357499841, '2', 1, 'Small', 'pending'),
(100, 3, 1357499841, '6', 5, 'Small', 'pending'),
(100, 3, 1626865057, '6', 4, 'Large', 'pending'),
(1600, 3, 512388376, '1', 2, 'Small', 'pending'),
(1600, 3, 512388376, '6', 3, 'Medium', 'pending'),
(1600, 3, 1843925129, '1', 3, 'Medium', 'pending'),
(1600, 3, 1784749967, '2', 2, 'Large', 'pending'),
(1600, 3, 1784749967, '9', 2, 'Small', 'pending'),
(1626, 3, 537656117, '2', 3, 'Medium', 'pending'),
(1626, 3, 537656117, '9', 3, 'Small', 'pending'),
(1600, 3, 1360753986, '2', 4, 'Medium', 'pending'),
(1600, 3, 1360753986, '9', 2, 'Medium', 'pending'),
(1630, 3, 1123468240, '9', 2, 'Small', 'pending'),
(1631, 3, 466038102, '9', 3, 'Small', 'pending'),
(1632, 3, 766474557, '5', 3, 'Small', 'pending'),
(1632, 3, 766474557, '9', 3, 'Small', 'pending'),
(1634, 3, 601936673, '2', 5, 'Small', 'pending'),
(1634, 3, 601936673, '9', 3, 'Large', 'pending'),
(1636, 3, 1803190271, '9', 4, 'Medium', 'pending'),
(1637, 3, 333129256, '1', 1, 'Small', 'pending'),
(1638, 3, 388884705, '9', 1, 'Medium', 'pending'),
(1639, 3, 1275937560, '9', 2, 'Medium', 'pending'),
(1640, 3, 95964666, '2', 1, 'Medium', 'pending'),
(1640, 3, 95964666, '3', 1, 'Small', 'pending'),
(1640, 3, 95964666, '7', 1, 'Small', 'pending'),
(1640, 3, 95964666, '9', 1, 'Small', 'pending'),
(1644, 3, 2070362596, '2', 2, 'Large', 'pending'),
(1644, 3, 2070362596, '6', 2, 'Large', 'pending'),
(1644, 3, 2070362596, '9', 2, 'Large', 'pending'),
(1647, 3, 630631348, '2', 3, 'Medium', 'pending'),
(1647, 3, 630631348, '9', 2, 'Medium', 'pending'),
(1649, 3, 920502545, '9', 4, 'Large', 'pending'),
(1650, 3, 1338929433, '2', 4, 'Small', 'pending'),
(1650, 3, 1338929433, '6', 3, 'Large', 'pending'),
(1650, 3, 1338929433, '9', 2, 'Large', 'pending'),
(1653, 3, 487130520, '9', 2, 'Large', 'pending'),
(1654, 3, 428343615, '9', 2, 'Medium', 'pending'),
(1655, 3, 1335908245, '2', 3, 'Medium', 'pending'),
(1655, 3, 1335908245, '6', 4, 'Large', 'pending'),
(1655, 3, 1335908245, '9', 1, 'Small', 'pending'),
(1658, 3, 1908573504, '2', 3, 'Medium', 'Complete'),
(1658, 3, 1908573504, '9', 2, 'Medium', 'Complete'),
(1660, 3, 39098577, '2', 2, 'Large', 'Complete'),
(1660, 3, 39098577, '6', 2, 'Medium', 'Complete'),
(1662, 3, 777563136, '9', 5, 'Medium', 'pending'),
(1663, 3, 1026002080, '9', 3, 'Medium', 'pending'),
(1664, 3, 1973948800, '6', 4, 'Small', 'pending'),
(1665, 3, 887149200, '6', 4, 'Medium', 'pending'),
(1666, 3, 860937113, '9', 3, 'Medium', 'pending'),
(1667, 3, 1039984132, '9', 2, 'Medium', 'pending'),
(1668, 3, 1853517772, '9', 2, 'Medium', 'pending'),
(1669, 3, 1689664978, '9', 4, 'Large', 'pending'),
(1670, 3, 2119518571, '1', 3, 'Large', 'pending'),
(1670, 3, 2119518571, '2', 2, 'Medium', 'pending'),
(1670, 3, 2119518571, '9', 3, 'Medium', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `manufacturer_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_url` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_psp_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_features` text NOT NULL,
  `product_video` text NOT NULL,
  `product_keywords` text NOT NULL,
  `product_label` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `manufacturer_id`, `date`, `product_title`, `product_url`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_psp_price`, `product_desc`, `product_features`, `product_video`, `product_keywords`, `product_label`, `status`) VALUES
(1, 2, 1, 1, '2021-10-11 21:50:20', 'Chameleon', 'chameleon', 'chameleon.jpg', 'chameleon.jpg', 'chameleon.jpg', 98, 0, '\r\n<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla</p>\r\n', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', '\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n', 'Animals', 'New', 'product'),
(2, 1, 1, 1, '2021-10-11 21:50:29', 'Colour Pallette', 'colour-pallette', 'colourpallette.jpg', 'colourpallette.jpg', 'colourpallette.jpg', 230, 150, '\r\n<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>\r\n', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', '\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n', 'Colour Pallette', 'New', 'product'),
(3, 3, 1, 1, '2021-10-11 21:50:41', 'Auto ST56', 'auto-st', 'auto car.jpg', 'auto car.jpg', 'auto car.jpg', 259, 100, '\r\n<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>\r\n', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', '\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n', 'AutoST', 'New', 'product'),
(4, 4, 1, 1, '2021-10-11 21:50:52', 'Personality Product 1', 'personality-6', 'personalities.jpg', 'personalities.jpg', 'personalities.jpg', 96, 50, '\r\n<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>\r\n', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', '\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n', 'Personality67', 'New', 'product'),
(5, 5, 1, 1, '2021-10-11 21:51:03', 'Landmark 1', 'landmark-24', 'lm.jpg', 'lm.jpg', 'lm.jpg', 200, 150, '\r\n<p>Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document. kingVideo provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document</p>\r\n', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', '\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n', 'Standard Landmarks', 'New', 'product'),
(6, 6, 1, 1, '2021-10-11 21:51:14', 'Abstract', 'abstract-22', 'mnstore.jpg', 'mnstore.jpg', 'mnstore.jpg', 245, 100, '\r\n<p>Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.Integer tristique dictum sapien et lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed imperdiet magna, at rhoncus arcu. Cras tincidunt felis eu vehicula consequat. Proin vel gravida quam. In tincidunt aliquam nisl. Sed velit erat, aliquam sit amet metus eget, molestie auctor nulla.</p>\r\n', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', '\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n', 'Abstract', 'New', 'product'),
(7, 7, 1, 1, '2021-10-11 21:51:25', 'Cosmo 1', 'cosmo-test', 'animals.jpg', 'animals.jpg', 'animals.jpg', 100, 30, '\r\n\r\n', '\r\n\r\n', '\r\n\r\n', 'cosmo', 'New', 'product'),
(8, 8, 1, 1, '2021-10-12 05:28:32', 'Miscellaneous', 'miscellaneous-testy', 'animals.jpg', 'wholeimage.png', 'wholeimage.png', 200, 50, '\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n', 'misc', 'New', 'product'),
(9, 2, 1, 1, '2021-10-11 22:04:20', 'Monkey', 'monkey-test', 'animals.jpg', 'animals.jpg', 'animals.jpg', 1000, 500, '\r\n\r\n', '\r\n\r\n', '\r\n\r\n', 'test', 'New', 'bundle');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_top` text NOT NULL,
  `p_cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_top`, `p_cat_image`) VALUES
(1, 'Accessories', 'yes', 'accessories.jpg'),
(2, 'Animals', 'yes', 'animals.jpg'),
(3, 'Auto', 'yes', 'auto.jpg'),
(4, 'Personalities', 'yes', 'personalities.jpg'),
(5, 'Landmarks', 'yes', 'auto.jpg'),
(6, 'Abstract', 'yes', 'animals.jpg'),
(7, 'Cosmos', 'yes', 'auto.jpg'),
(8, 'Miscellaneous', 'yes', 'mnstore.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `ID` int(255) NOT NULL,
  `Name` text NOT NULL,
  `Login_type` text NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`ID`, `Name`, `Login_type`, `Email`, `Password`) VALUES
(1, 'Rathan Kumar Rao Pathur', 'Customer', 'pathur3333@gmail.com', 'test123'),
(2, 'Dheeraj Rao Pathur', 'Customer', 'dheerajraopathur@gmail.com', 'etoGNTe5@4');

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shiprocket_token`
--

INSERT INTO `shiprocket_token` (`id`, `token`, `added_on`) VALUES
(2, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIzMDkyNTksImlzcyI6Imh0dHBzOi8vYXBpdjIuc2hpcHJvY2tldC5pbi92MS9leHRlcm5hbC9hdXRoL2xvZ2luIiwiaWF0IjoxNjQyOTYyNjUxLCJleHAiOjE2NDM4MjY2NTEsIm5iZiI6MTY0Mjk2MjY1MSwianRpIjoidkJSQzcwN2tEREJJcVZiYSJ9.9tHUiLecp5z_b0JbF1GYwr1MRukNO6MH47NpqZJH4rw', '2022-01-24 06:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(10) NOT NULL,
  `store_title` varchar(255) NOT NULL,
  `store_image` varchar(255) NOT NULL,
  `store_desc` text NOT NULL,
  `store_button` varchar(255) NOT NULL,
  `store_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_title`, `store_image`, `store_desc`, `store_button`, `store_url`) VALUES
(4, 'MN Images', 'mnstore.jpg', '\r\n\r\n\r\n<p style=\"text-align: center;\"><strong>Koramangala , Bangalore - 560089</strong></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut libero erat, aliquet eget mauris ut, dictum sagittis libero. Nam at dui dapibus, semper dolor ac, malesuada mi. Duis quis lobortis arcu. Vivamus sed sodales orci, non varius dolor.</p>\r\n\r\n\r\n', 'View Map', 'http://www.thedailylux.com/ecommerce'),
(5, 'TY Photography Stores', 'mnstore.jpg', '\r\n<p style=\"text-align: center;\"><strong>Jayanagar 4th Block , Bangalore - 567890</strong></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut libero erat, aliquet eget mauris ut, dictum sagittis libero. Nam at dui dapibus, semper dolor ac, malesuada mi. Duis quis lobortis arcu. Vivamus sed sodales orci, non varius dolor.</p>\r\n', 'View Map', 'http://www.thedailylux.com/ecommerce');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `product_id`) VALUES
(1, 1, 9),
(2, 1, 3),
(3, 3, 2),
(4, 3, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contactusformtable`
--
ALTER TABLE `contactusformtable`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  MODIFY `rel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contactusformtable`
--
ALTER TABLE `contactusformtable`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
