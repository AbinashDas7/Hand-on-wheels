-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2021 at 04:39 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topnotch_drivingschool`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(6) NOT NULL,
  `transaction_id` varchar(20) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `invoice_id` varchar(25) NOT NULL,
  `userid` int(11) NOT NULL,
  `course_ids` varchar(15) NOT NULL,
  `alldata` text NOT NULL,
  `createdtime` datetime NOT NULL,
  `account_type` int(1) NOT NULL DEFAULT '2' COMMENT '1=Free,2=Paid',
  `free_make_by` int(1) DEFAULT NULL,
  `when_make_free` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `transaction_id`, `payment_amount`, `payment_status`, `invoice_id`, `userid`, `course_ids`, `alldata`, `createdtime`, `account_type`, `free_make_by`, `when_make_free`) VALUES
(2, 'PAYID-L542GEA8MN4817', '50.00', 'approved', '5f79a30d571dc-2', 2, '3,1,2', '\"O:18:\\\"PayPal\\\\Api\\\\Payment\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:9:{s:2:\\\"id\\\";s:30:\\\"PAYID-L542GEA8MN48170CP392334V\\\";s:6:\\\"intent\\\";s:4:\\\"sale\\\";s:5:\\\"state\\\";s:8:\\\"approved\\\";s:4:\\\"cart\\\";s:17:\\\"4B3670714D672453G\\\";s:5:\\\"payer\\\";O:16:\\\"PayPal\\\\Api\\\\Payer\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:14:\\\"payment_method\\\";s:6:\\\"paypal\\\";s:6:\\\"status\\\";s:8:\\\"VERIFIED\\\";s:10:\\\"payer_info\\\";O:20:\\\"PayPal\\\\Api\\\\PayerInfo\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:7:{s:5:\\\"email\\\";s:36:\\\"sb-jo0mt3366903@personal.example.com\\\";s:10:\\\"first_name\\\";s:4:\\\"John\\\";s:9:\\\"last_name\\\";s:3:\\\"Doe\\\";s:8:\\\"payer_id\\\";s:13:\\\"KW2K59UPNJJUJ\\\";s:16:\\\"shipping_address\\\";O:26:\\\"PayPal\\\\Api\\\\ShippingAddress\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:14:\\\"recipient_name\\\";s:8:\\\"John Doe\\\";s:5:\\\"line1\\\";s:9:\\\"1 Main St\\\";s:4:\\\"city\\\";s:8:\\\"San Jose\\\";s:5:\\\"state\\\";s:2:\\\"CA\\\";s:11:\\\"postal_code\\\";s:5:\\\"95131\\\";s:12:\\\"country_code\\\";s:2:\\\"US\\\";}}s:5:\\\"phone\\\";s:10:\\\"4089208600\\\";s:12:\\\"country_code\\\";s:2:\\\"US\\\";}}}}s:12:\\\"transactions\\\";a:1:{i:0;O:22:\\\"PayPal\\\\Api\\\\Transaction\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:6:\\\"amount\\\";O:17:\\\"PayPal\\\\Api\\\\Amount\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:5:\\\"total\\\";s:5:\\\"50.00\\\";s:8:\\\"currency\\\";s:3:\\\"USD\\\";s:7:\\\"details\\\";O:18:\\\"PayPal\\\\Api\\\\Details\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:8:\\\"subtotal\\\";s:5:\\\"50.00\\\";s:8:\\\"shipping\\\";s:4:\\\"0.00\\\";s:9:\\\"insurance\\\";s:4:\\\"0.00\\\";s:12:\\\"handling_fee\\\";s:4:\\\"0.00\\\";s:17:\\\"shipping_discount\\\";s:4:\\\"0.00\\\";s:8:\\\"discount\\\";s:4:\\\"0.00\\\";}}}}s:5:\\\"payee\\\";O:16:\\\"PayPal\\\\Api\\\\Payee\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:2:{s:11:\\\"merchant_id\\\";s:13:\\\"7DAM44QS76A46\\\";s:5:\\\"email\\\";s:36:\\\"sb-8ttcs3363269@business.example.com\\\";}}s:11:\\\"description\\\";s:45:\\\"Some description about the payment being made\\\";s:14:\\\"invoice_number\\\";s:15:\\\"5f79a30d571dc-2\\\";s:9:\\\"item_list\\\";O:19:\\\"PayPal\\\\Api\\\\ItemList\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:1:{s:16:\\\"shipping_address\\\";O:26:\\\"PayPal\\\\Api\\\\ShippingAddress\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:14:\\\"recipient_name\\\";s:8:\\\"John Doe\\\";s:5:\\\"line1\\\";s:9:\\\"1 Main St\\\";s:4:\\\"city\\\";s:8:\\\"San Jose\\\";s:5:\\\"state\\\";s:2:\\\"CA\\\";s:11:\\\"postal_code\\\";s:5:\\\"95131\\\";s:12:\\\"country_code\\\";s:2:\\\"US\\\";}}}}s:17:\\\"related_resources\\\";a:1:{i:0;O:27:\\\"PayPal\\\\Api\\\\RelatedResources\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:1:{s:4:\\\"sale\\\";O:15:\\\"PayPal\\\\Api\\\\Sale\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:11:{s:2:\\\"id\\\";s:17:\\\"1L8218205P1528925\\\";s:5:\\\"state\\\";s:9:\\\"completed\\\";s:6:\\\"amount\\\";O:17:\\\"PayPal\\\\Api\\\\Amount\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:5:\\\"total\\\";s:5:\\\"50.00\\\";s:8:\\\"currency\\\";s:3:\\\"USD\\\";s:7:\\\"details\\\";O:18:\\\"PayPal\\\\Api\\\\Details\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:8:\\\"subtotal\\\";s:5:\\\"50.00\\\";s:8:\\\"shipping\\\";s:4:\\\"0.00\\\";s:9:\\\"insurance\\\";s:4:\\\"0.00\\\";s:12:\\\"handling_fee\\\";s:4:\\\"0.00\\\";s:17:\\\"shipping_discount\\\";s:4:\\\"0.00\\\";s:8:\\\"discount\\\";s:4:\\\"0.00\\\";}}}}s:12:\\\"payment_mode\\\";s:16:\\\"INSTANT_TRANSFER\\\";s:22:\\\"protection_eligibility\\\";s:8:\\\"ELIGIBLE\\\";s:27:\\\"protection_eligibility_type\\\";s:56:\\\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\\\";s:15:\\\"transaction_fee\\\";O:19:\\\"PayPal\\\\Api\\\\Currency\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:2:{s:5:\\\"value\\\";s:4:\\\"1.75\\\";s:8:\\\"currency\\\";s:3:\\\"USD\\\";}}s:14:\\\"parent_payment\\\";s:30:\\\"PAYID-L542GEA8MN48170CP392334V\\\";s:11:\\\"create_time\\\";s:20:\\\"2020-10-04T10:26:06Z\\\";s:11:\\\"update_time\\\";s:20:\\\"2020-10-04T10:26:06Z\\\";s:5:\\\"links\\\";a:3:{i:0;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:65:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/sale\\/1L8218205P1528925\\\";s:3:\\\"rel\\\";s:4:\\\"self\\\";s:6:\\\"method\\\";s:3:\\\"GET\\\";}}i:1;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:72:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/sale\\/1L8218205P1528925\\/refund\\\";s:3:\\\"rel\\\";s:6:\\\"refund\\\";s:6:\\\"method\\\";s:4:\\\"POST\\\";}}i:2;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:81:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/payment\\/PAYID-L542GEA8MN48170CP392334V\\\";s:3:\\\"rel\\\";s:14:\\\"parent_payment\\\";s:6:\\\"method\\\";s:3:\\\"GET\\\";}}}}}}}}}}}s:11:\\\"create_time\\\";s:20:\\\"2020-10-04T10:25:20Z\\\";s:11:\\\"update_time\\\";s:20:\\\"2020-10-04T10:26:06Z\\\";s:5:\\\"links\\\";a:1:{i:0;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:81:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/payment\\/PAYID-L542GEA8MN48170CP392334V\\\";s:3:\\\"rel\\\";s:4:\\\"self\\\";s:6:\\\"method\\\";s:3:\\\"GET\\\";}}}}}\"', '2020-10-04 15:56:08', 2, NULL, NULL),
(3, 'PAYID-L544OUQ6VB0862', '50.00', 'approved', '5f79c74e080c2-1', 1, '2', '\"O:18:\\\"PayPal\\\\Api\\\\Payment\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:9:{s:2:\\\"id\\\";s:30:\\\"PAYID-L544OUQ6VB08620822654308\\\";s:6:\\\"intent\\\";s:4:\\\"sale\\\";s:5:\\\"state\\\";s:8:\\\"approved\\\";s:4:\\\"cart\\\";s:17:\\\"3XN52072K92832103\\\";s:5:\\\"payer\\\";O:16:\\\"PayPal\\\\Api\\\\Payer\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:14:\\\"payment_method\\\";s:6:\\\"paypal\\\";s:6:\\\"status\\\";s:8:\\\"VERIFIED\\\";s:10:\\\"payer_info\\\";O:20:\\\"PayPal\\\\Api\\\\PayerInfo\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:7:{s:5:\\\"email\\\";s:36:\\\"sb-jo0mt3366903@personal.example.com\\\";s:10:\\\"first_name\\\";s:4:\\\"John\\\";s:9:\\\"last_name\\\";s:3:\\\"Doe\\\";s:8:\\\"payer_id\\\";s:13:\\\"KW2K59UPNJJUJ\\\";s:16:\\\"shipping_address\\\";O:26:\\\"PayPal\\\\Api\\\\ShippingAddress\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:14:\\\"recipient_name\\\";s:8:\\\"John Doe\\\";s:5:\\\"line1\\\";s:9:\\\"1 Main St\\\";s:4:\\\"city\\\";s:8:\\\"San Jose\\\";s:5:\\\"state\\\";s:2:\\\"CA\\\";s:11:\\\"postal_code\\\";s:5:\\\"95131\\\";s:12:\\\"country_code\\\";s:2:\\\"US\\\";}}s:5:\\\"phone\\\";s:10:\\\"4089208600\\\";s:12:\\\"country_code\\\";s:2:\\\"US\\\";}}}}s:12:\\\"transactions\\\";a:1:{i:0;O:22:\\\"PayPal\\\\Api\\\\Transaction\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:6:\\\"amount\\\";O:17:\\\"PayPal\\\\Api\\\\Amount\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:5:\\\"total\\\";s:5:\\\"50.00\\\";s:8:\\\"currency\\\";s:3:\\\"USD\\\";s:7:\\\"details\\\";O:18:\\\"PayPal\\\\Api\\\\Details\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:8:\\\"subtotal\\\";s:5:\\\"50.00\\\";s:8:\\\"shipping\\\";s:4:\\\"0.00\\\";s:9:\\\"insurance\\\";s:4:\\\"0.00\\\";s:12:\\\"handling_fee\\\";s:4:\\\"0.00\\\";s:17:\\\"shipping_discount\\\";s:4:\\\"0.00\\\";s:8:\\\"discount\\\";s:4:\\\"0.00\\\";}}}}s:5:\\\"payee\\\";O:16:\\\"PayPal\\\\Api\\\\Payee\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:2:{s:11:\\\"merchant_id\\\";s:13:\\\"7DAM44QS76A46\\\";s:5:\\\"email\\\";s:36:\\\"sb-8ttcs3363269@business.example.com\\\";}}s:11:\\\"description\\\";s:45:\\\"Some description about the payment being made\\\";s:14:\\\"invoice_number\\\";s:15:\\\"5f79c74e080c2-1\\\";s:9:\\\"item_list\\\";O:19:\\\"PayPal\\\\Api\\\\ItemList\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:1:{s:16:\\\"shipping_address\\\";O:26:\\\"PayPal\\\\Api\\\\ShippingAddress\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:14:\\\"recipient_name\\\";s:8:\\\"John Doe\\\";s:5:\\\"line1\\\";s:9:\\\"1 Main St\\\";s:4:\\\"city\\\";s:8:\\\"San Jose\\\";s:5:\\\"state\\\";s:2:\\\"CA\\\";s:11:\\\"postal_code\\\";s:5:\\\"95131\\\";s:12:\\\"country_code\\\";s:2:\\\"US\\\";}}}}s:17:\\\"related_resources\\\";a:1:{i:0;O:27:\\\"PayPal\\\\Api\\\\RelatedResources\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:1:{s:4:\\\"sale\\\";O:15:\\\"PayPal\\\\Api\\\\Sale\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:11:{s:2:\\\"id\\\";s:17:\\\"6MD78324RD0385312\\\";s:5:\\\"state\\\";s:9:\\\"completed\\\";s:6:\\\"amount\\\";O:17:\\\"PayPal\\\\Api\\\\Amount\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:5:\\\"total\\\";s:5:\\\"50.00\\\";s:8:\\\"currency\\\";s:3:\\\"USD\\\";s:7:\\\"details\\\";O:18:\\\"PayPal\\\\Api\\\\Details\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:6:{s:8:\\\"subtotal\\\";s:5:\\\"50.00\\\";s:8:\\\"shipping\\\";s:4:\\\"0.00\\\";s:9:\\\"insurance\\\";s:4:\\\"0.00\\\";s:12:\\\"handling_fee\\\";s:4:\\\"0.00\\\";s:17:\\\"shipping_discount\\\";s:4:\\\"0.00\\\";s:8:\\\"discount\\\";s:4:\\\"0.00\\\";}}}}s:12:\\\"payment_mode\\\";s:16:\\\"INSTANT_TRANSFER\\\";s:22:\\\"protection_eligibility\\\";s:8:\\\"ELIGIBLE\\\";s:27:\\\"protection_eligibility_type\\\";s:56:\\\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\\\";s:15:\\\"transaction_fee\\\";O:19:\\\"PayPal\\\\Api\\\\Currency\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:2:{s:5:\\\"value\\\";s:4:\\\"1.75\\\";s:8:\\\"currency\\\";s:3:\\\"USD\\\";}}s:14:\\\"parent_payment\\\";s:30:\\\"PAYID-L544OUQ6VB08620822654308\\\";s:11:\\\"create_time\\\";s:20:\\\"2020-10-04T13:00:45Z\\\";s:11:\\\"update_time\\\";s:20:\\\"2020-10-04T13:00:45Z\\\";s:5:\\\"links\\\";a:3:{i:0;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:65:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/sale\\/6MD78324RD0385312\\\";s:3:\\\"rel\\\";s:4:\\\"self\\\";s:6:\\\"method\\\";s:3:\\\"GET\\\";}}i:1;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:72:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/sale\\/6MD78324RD0385312\\/refund\\\";s:3:\\\"rel\\\";s:6:\\\"refund\\\";s:6:\\\"method\\\";s:4:\\\"POST\\\";}}i:2;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:81:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/payment\\/PAYID-L544OUQ6VB08620822654308\\\";s:3:\\\"rel\\\";s:14:\\\"parent_payment\\\";s:6:\\\"method\\\";s:3:\\\"GET\\\";}}}}}}}}}}}s:11:\\\"create_time\\\";s:20:\\\"2020-10-04T13:00:02Z\\\";s:11:\\\"update_time\\\";s:20:\\\"2020-10-04T13:00:45Z\\\";s:5:\\\"links\\\";a:1:{i:0;O:16:\\\"PayPal\\\\Api\\\\Links\\\":1:{s:35:\\\"\\u0000PayPal\\\\Common\\\\PayPalModel\\u0000_propMap\\\";a:3:{s:4:\\\"href\\\";s:81:\\\"https:\\/\\/api.sandbox.paypal.com\\/v1\\/payments\\/payment\\/PAYID-L544OUQ6VB08620822654308\\\";s:3:\\\"rel\\\";s:4:\\\"self\\\";s:6:\\\"method\\\";s:3:\\\"GET\\\";}}}}}\"', '2020-10-04 18:30:48', 2, NULL, NULL),
(6, 'PAYMENT-BY-ADMIN-FRE', '0.00', 'approved', 'INVADMIN-CREATED', 6, '1,2,3', '', '2021-04-12 06:41:31', 1, 1, '2021-04-12 06:41:31'),
(7, 'FREE A/C', '0.00', 'approved', 'FRE-A/C-INV', 5, '1,2,3', '', '2021-04-12 06:46:16', 1, 1, '2021-04-12 06:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ads_manager`
--

CREATE TABLE `tbl_ads_manager` (
  `id` int(11) NOT NULL,
  `typeofad` int(1) NOT NULL,
  `banner_name` varchar(100) DEFAULT NULL,
  `banner_link` varchar(200) DEFAULT NULL,
  `ads_script` longtext,
  `banner_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ads_manager`
--

INSERT INTO `tbl_ads_manager` (`id`, `typeofad`, `banner_name`, `banner_link`, `ads_script`, `banner_status`, `deleted_status`, `inserted_date`) VALUES
(1, 1, NULL, '', '&lt;html&gt;\r\n  &lt;head&gt;\r\n    &lt;meta charset=&quot;utf-8&quot;&gt;\r\n    &lt;title&gt;Hello GPT&lt;/title&gt;\r\n    &lt;script async src=&quot;https://securepubads.g.doubleclick.net/tag/js/gpt.js&quot;&gt;&lt;/script&gt;\r\n    &lt;script&gt;\r\n      window.googletag = window.googletag || {cmd: []};\r\n      googletag.cmd.push(function() {\r\n        googletag\r\n            .defineSlot(\r\n                \'/6355419/Travel/Europe/France/Paris\', [300, 250], \'banner-ad\')\r\n            .addService(googletag.pubads());\r\n        googletag.enableServices();\r\n      });\r\n    &lt;/script&gt;\r\n  &lt;/head&gt;\r\n  &lt;body&gt;\r\n    &lt;div id=&quot;banner-ad&quot; style=&quot;width: 300px; height: 250px;&quot;&gt;\r\n      &lt;script&gt;\r\n        googletag.cmd.push(function() {\r\n          googletag.display(\'banner-ad\');\r\n        });\r\n      &lt;/script&gt;\r\n    &lt;/div&gt;\r\n  &lt;/body&gt;\r\n&lt;/html&gt;', 0, 1, '2021-06-03 22:18:56'),
(2, 2, '33d1b39a65777d47ebc6fbd1f551b7b5.jpg', 'http://www.tndss.com/services_view?id=6', NULL, 0, 0, '2021-06-03 22:12:13'),
(3, 1, NULL, '', '&lt;html&gt;\r\n  &lt;head&gt;\r\n    &lt;meta charset=&quot;utf-8&quot;&gt;\r\n    &lt;title&gt;Event-based ad requests example&lt;/title&gt;\r\n    &lt;script async src=&quot;https://securepubads.g.doubleclick.net/tag/js/gpt.js&quot;&gt;&lt;/script&gt;\r\n    &lt;script&gt;\r\n      window.googletag = window.googletag || {cmd: []};\r\n\r\n      googletag.cmd.push(function() {\r\n        googletag.defineSlot(\'/6355419/Travel\',[728, 90], \'div-for-slot\')\r\n            .setTargeting(\'test\', \'event\')\r\n            .addService(googletag.pubads());\r\n        googletag.pubads().disableInitialLoad();\r\n        googletag.enableServices();\r\n      });\r\n    &lt;/script&gt;\r\n  &lt;/head&gt;\r\n  &lt;body&gt;\r\n    &lt;div id=&quot;div-for-slot&quot; style=&quot;width: 300px; height: 250px;&quot;&gt;\r\n      &lt;script&gt;\r\n        googletag.cmd.push(function() {\r\n          // This will only register the slot.\r\n          // Ad will be fetched only when refresh is called.\r\n          googletag.display(\'div-for-slot\');\r\n        });\r\n      &lt;/script&gt;\r\n    &lt;/div&gt;\r\n    &lt;button onclick=&quot;googletag.cmd.push(function() { googletag.pubads().refresh(); });&quot;&gt;\r\n      Show/Refresh Ad\r\n    &lt;/button&gt;\r\n  &lt;/body&gt;\r\n&lt;/html&gt;', 0, 1, '2021-06-03 22:18:53'),
(4, 1, NULL, '', '&lt;html&gt;\r\n  &lt;head&gt;\r\n    &lt;meta charset=&quot;utf-8&quot;&gt;\r\n    &lt;title&gt;Lazy loading example&lt;/title&gt;\r\n    &lt;script async src=&quot;https://securepubads.g.doubleclick.net/tag/js/gpt.js&quot;&gt;&lt;/script&gt;\r\n    &lt;script&gt;\r\n      window.googletag = window.googletag || {cmd: []};\r\n\r\n      googletag.cmd.push(function() {\r\n        googletag.defineSlot(\'/6355419/Travel\', [728, 90], \'div-1\')\r\n          .setTargeting(\'test\', \'lazyload\')\r\n          .addService(googletag.pubads());\r\n        googletag.defineSlot(\'/6355419/Travel\', [728, 90], \'div-2\')\r\n          .setTargeting(\'test\', \'lazyload\')\r\n          .addService(googletag.pubads());\r\n        googletag.defineSlot(\'/6355419/Travel\', [728, 90], \'div-3\')\r\n          .setTargeting(\'test\', \'lazyload\')\r\n          .addService(googletag.pubads());\r\n\r\n        // Some examples of ways to enable lazy loading below.\r\n        // Normally, only one of these methods should be used.\r\n\r\n        // A) Enable with defaults.\r\n        googletag.pubads().enableLazyLoad();\r\n\r\n        // B) Enable without lazy fetching. Additional calls override previous\r\n        // ones.\r\n        googletag.pubads().enableLazyLoad({fetchMarginPercent: -1});\r\n\r\n        // C) Enable lazy loading with...\r\n        googletag.pubads().enableLazyLoad({\r\n          // Fetch slots within 5 viewports.\r\n          fetchMarginPercent: 500,\r\n          // Render slots within 2 viewports.\r\n          renderMarginPercent: 200,\r\n          // Double the above values on mobile, where viewports are smaller\r\n          // and users tend to scroll faster.\r\n          mobileScaling: 2.0\r\n        });\r\n\r\n        // Register event handlers to observe lazy loading behavior.\r\n        googletag.pubads().addEventListener(\'slotRequested\', function(event) {\r\n          updateSlotStatus(event.slot.getSlotElementId(), \'fetched\');\r\n        });\r\n\r\n        googletag.pubads().addEventListener(\'slotOnload\', function(event) {\r\n          updateSlotStatus(event.slot.getSlotElementId(), \'rendered\');\r\n        });\r\n\r\n        googletag.enableServices();\r\n      });\r\n\r\n      function updateSlotStatus(slotId, state) {\r\n        var elem = document.getElementById(slotId + \'-\' + state);\r\n        elem.className = \'activated\';\r\n        elem.innerText = \'Yes\';\r\n      }\r\n    &lt;/script&gt;\r\n    &lt;style&gt;\r\n      div.ad-slot {\r\n        border-style: dashed;\r\n        display: block;\r\n        margin: auto;\r\n      }\r\n\r\n      div.main-content {\r\n        background-color: lightsteelblue;\r\n        margin-top: 125px;\r\n        overflow: hidden;\r\n        width: 100%;\r\n      }\r\n\r\n      div.status-panel {\r\n        background: white;\r\n        height: 125px;\r\n        position: fixed;\r\n        top: 0;\r\n        width: 100%;\r\n      }\r\n\r\n      table {\r\n        width: 100%;\r\n      }\r\n\r\n      table th {\r\n        text-align: center;\r\n      }\r\n\r\n      table td:not(.slot-name) {\r\n        background-color: lightsalmon;\r\n      }\r\n\r\n      table td.activated {\r\n        background-color: lightgreen;\r\n      }\r\n    &lt;/style&gt;\r\n  &lt;/head&gt;\r\n  &lt;body&gt;\r\n\r\n    &lt;!--\r\n       As defined by lazy load settings, initially:\r\n       1. Slot 1 will be fetched and rendered on mobile and desktop.\r\n       2. Slot 2 will be fetched on mobile and desktop, but will not be rendered on desktop.\r\n       3. Slot 3 will not be fetched or rendered on mobile or desktop.\r\n    --&gt;\r\n\r\n    &lt;div class=&quot;main-content&quot;&gt;\r\n      &lt;div id=&quot;div-1&quot; class=&quot;ad-slot&quot; style=&quot;height: 90px; width: 728px;&quot;&gt;\r\n        &lt;script&gt;\r\n          googletag.cmd.push(function() { googletag.display(\'div-1\'); });\r\n        &lt;/script&gt;\r\n      &lt;/div&gt;\r\n\r\n      &lt;!-- 3 viewport tall div to place next slot 3 viewports away. --&gt;\r\n      &lt;div style=&quot;height:300vh&quot;&gt;&lt;/div&gt;\r\n\r\n      &lt;div id=&quot;div-2&quot; class=&quot;ad-slot&quot; style=&quot;height: 90px; width: 728px;&quot;&gt;\r\n        &lt;script&gt;\r\n          googletag.cmd.push(function() { googletag.display(\'div-2\'); });\r\n        &lt;/script&gt;\r\n      &lt;/div&gt;\r\n\r\n      &lt;!-- 9 viewport tall div to place next slot 12 viewports away. --&gt;\r\n      &lt;div style=&quot;height:900vh&quot;&gt;&lt;/div&gt;\r\n\r\n      &lt;div id=&quot;div-3&quot; class=&quot;ad-slot&quot; style=&quot;height: 90px; width: 728px;&quot;&gt;\r\n        &lt;script&gt;\r\n          googletag.cmd.push(function() { googletag.display(\'div-3\'); });\r\n        &lt;/script&gt;\r\n      &lt;/div&gt;\r\n    &lt;/div&gt;\r\n\r\n    &lt;div class=&quot;status-panel&quot;&gt;\r\n      &lt;table&gt;\r\n        &lt;tr&gt;\r\n          &lt;th&gt;Ad Slot&lt;/th&gt;\r\n          &lt;th&gt;Fetched?&lt;/th&gt;\r\n          &lt;th&gt;Rendered?&lt;/th&gt;\r\n        &lt;/tr&gt;\r\n        &lt;tr&gt;\r\n          &lt;td class=&quot;slot-name&quot;&gt;Ad Slot 1&lt;/td&gt;\r\n          &lt;td id=&quot;div-1-fetched&quot;&gt;No&lt;/td&gt;\r\n          &lt;td id=&quot;div-1-rendered&quot;&gt;No&lt;/td&gt;\r\n        &lt;/tr&gt;\r\n        &lt;tr&gt;\r\n          &lt;td class=&quot;slot-name&quot;&gt;Ad Slot 2&lt;/td&gt;\r\n          &lt;td id=&quot;div-2-fetched&quot;&gt;No&lt;/td&gt;\r\n          &lt;td id=&quot;div-2-rendered&quot;&gt;No&lt;/td&gt;\r\n        &lt;/tr&gt;\r\n        &lt;tr&gt;\r\n          &lt;td class=&quot;slot-name&quot;&gt;Ad Slot 3&lt;/td&gt;\r\n          &lt;td id=&quot;div-3-fetched&quot;&gt;No&lt;/td&gt;\r\n          &lt;td id=&quot;div-3-rendered&quot;&gt;No&lt;/td&gt;\r\n        &lt;/tr&gt;\r\n      &lt;/table&gt;\r\n      &lt;p&gt;\r\n        Scroll the container below to lazily load the ad slots.\r\n      &lt;/p&gt;\r\n    &lt;/div&gt;\r\n  &lt;/body&gt;\r\n&lt;/html&gt;', 0, 1, '2021-06-03 22:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bakupdetails`
--

CREATE TABLE `tbl_bakupdetails` (
  `id` int(11) NOT NULL,
  `filename_backup_db` varchar(100) NOT NULL,
  `time_of_backup` datetime NOT NULL,
  `backlupby` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bakupdetails`
--

INSERT INTO `tbl_bakupdetails` (`id`, `filename_backup_db`, `time_of_backup`, `backlupby`) VALUES
(1, 'Database-Backup_2021-05-24_09-50.zip', '2021-05-24 09:50:50', 1),
(2, 'Database-Backup_2021-05-24_10-26.zip', '2021-05-24 10:26:14', 1),
(3, 'Database-Backup_2021-05-24_10-27-49.zip', '2021-05-24 10:27:49', 1),
(4, 'Database-Backup_2021-05-24_10-27-55.zip', '2021-05-24 10:27:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `id` int(11) NOT NULL,
  `banner_name` varchar(100) NOT NULL,
  `banner_alt` varchar(1000) NOT NULL,
  `banner_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_banner`
--

INSERT INTO `tbl_banner` (`id`, `banner_name`, `banner_alt`, `banner_status`, `deleted_status`, `inserted_date`) VALUES
(12, '03c8a87f502d5eef9a18cb08478491bc.png', 'NO MORE  FRUSTRATING  SLOW INTERNET1', 0, 1, '2020-09-24 23:15:52'),
(9, '0f72b864cab1212cd0d3087de3708f93.png', 'ONE  ACCOUNT FOR ALL', 0, 1, '2020-09-24 23:15:47'),
(11, 'd67361473f4328f1a7becba6eff5d05c.png', 'FLAWLESS STREAMING @UTel', 0, 1, '2020-09-24 23:15:50'),
(13, '9caf54138aa2a922ffc9e032c27e2801.png', 'NO MORE FRUSTRATING SLOW INTERNET nEW', 1, 1, '2020-09-24 23:15:54'),
(14, 'd261e14cfad4955cfcf71444c01c24ee.png', 'FLAWLESS STREAMING @UTel ', 1, 1, '2020-09-24 23:15:55'),
(15, 'c9960fcec35388ee716b2cebedba7046.jpg', '<div class=\"col text-center\">\r\n<div class=\"home_slider_title\">The Premium System Education</div>\r\n<div class=\"home_slider_subtitle\">Future Of Education Technology</div>\r\n<div class=\"bnssection\"><a class=\"btn btn-danger\"><span class=\"fa fa-key\" aria-hidden=\"true\">&nbsp;</span> Register Now</a>&nbsp; <a class=\"btn btn-danger\"><span class=\"fa fa-lock\" aria-hidden=\"true\">&nbsp;</span> Login</a>&nbsp; <a class=\"btn btn-danger sliderseminar\" href=\"#seminars\"><span class=\"fa fa-graduation-cap\" aria-hidden=\"true\">&nbsp;</span> Seminar</a></div>\r\n</div>', 1, 0, '2020-09-27 16:55:53'),
(16, 'd1fe6b1f8862e50a59747b20f33062ff.jpg', '<div class=\"col text-center\">\r\n<div class=\"home_slider_title\">The Premium System Education</div>\r\n<div class=\"home_slider_subtitle\">Future Of Education Technology</div>\r\n<div class=\"bnssection\"><a class=\"btn btn-danger\"><span class=\"fa fa-key\" aria-hidden=\"true\">&nbsp;</span> Register Now</a>&nbsp; <a class=\"btn btn-danger\"><span class=\"fa fa-lock\" aria-hidden=\"true\">&nbsp;</span> Login</a>&nbsp; <a class=\"btn btn-danger sliderseminar\" href=\"#seminars\"><span class=\"fa fa-graduation-cap\" aria-hidden=\"true\">&nbsp;</span> Seminar</a></div>\r\n</div>', 1, 0, '2020-09-27 16:55:45'),
(17, 'ae88f79b60be3c7a328b70f7b28ae3d8.jpg', '<div class=\"col text-center\">\r\n<div class=\"home_slider_title\">1The Premium System Education</div>\r\n<div class=\"home_slider_subtitle\">Future Of Education Technology</div>\r\n<div class=\"bnssection\"><a class=\"btn btn-danger\"><span class=\"fa fa-key\" aria-hidden=\"true\">&nbsp;</span> Register Now</a>&nbsp; <a class=\"btn btn-danger\"><span class=\"fa fa-lock\" aria-hidden=\"true\">&nbsp;</span> Login</a>&nbsp; <a class=\"btn btn-danger sliderseminar\" href=\"#seminars\"><span class=\"fa fa-graduation-cap\" aria-hidden=\"true\">&nbsp;</span> Seminar</a></div>\r\n</div>', 1, 0, '2020-09-27 16:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `categoryname` varchar(100) NOT NULL,
  `display_order` int(2) NOT NULL DEFAULT '0',
  `cat_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `categoryname`, `display_order`, `cat_status`, `deleted_status`, `inserted_date`) VALUES
(1, 'Popular Online Seminars', 1, 1, 0, '2020-09-27 17:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client_scroll`
--

CREATE TABLE `tbl_client_scroll` (
  `id` int(11) NOT NULL,
  `banner_name` varchar(100) NOT NULL,
  `banner_alt` varchar(200) NOT NULL,
  `banner_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_client_scroll`
--

INSERT INTO `tbl_client_scroll` (`id`, `banner_name`, `banner_alt`, `banner_status`, `deleted_status`, `inserted_date`) VALUES
(16, '37692839ae6a521ae5e4023697c76368.png', 'sdfsdf', 1, 0, '2020-10-04 12:38:30'),
(9, '803e8fea97b4af85ece43b65017a4932.png', 'ssb', 1, 0, '2020-04-29 04:00:35'),
(17, '9b90e870dd86469d9e85dcc2c6041c12.png', 'right image', 1, 0, '2020-10-05 02:19:06'),
(11, 'e22e9cbcac3ddac89d4f06eea96ef62e.png', 'uber', 1, 0, '2020-04-29 15:43:50'),
(13, '0c696bc555f52306981aaa9fbf8fe1d4.png', 'Samsung', 1, 0, '2020-10-04 12:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `visitor_name` varchar(100) NOT NULL,
  `visitor_mobile` bigint(20) NOT NULL,
  `visitor_address` varchar(250) NOT NULL,
  `visitor_email` varchar(100) NOT NULL,
  `visitor_message` varchar(250) NOT NULL,
  `visitor_ip_address` varchar(20) NOT NULL,
  `inserted_date` datetime NOT NULL,
  `viewed_or_not` int(1) NOT NULL DEFAULT '0',
  `viewed_date` datetime NOT NULL,
  `delete_status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `visitor_name`, `visitor_mobile`, `visitor_address`, `visitor_email`, `visitor_message`, `visitor_ip_address`, `inserted_date`, `viewed_or_not`, `viewed_date`, `delete_status`) VALUES
(1, 'Bhaba Sankar', 0, '', 'sankarbhaba@gmail.com', 'dfgdfgdfg dfgdfgdfgdfgdfgd', '::1', '2020-09-28 15:23:03', 1, '2020-09-28 15:26:54', 0),
(2, 'Bhaba Sankar', 0, '', 'sankarbhaba@gmail.com', 'lorem ipesume  asdeasdas dsasdsa', '::1', '2020-09-28 15:31:58', 1, '2020-09-28 15:32:09', 0),
(3, 'Bhaba Sankar', 0, '', 'sankarbhaba@gmail.com', 'dfgdf dfgdf gd fgdfg dfgdfg dfgdfgdf', '::1', '2020-09-28 15:32:41', 0, '0000-00-00 00:00:00', 0),
(4, 'Bhaba', 0, '', 'sankarbhaba@gmail.com', 'jdsgtjhdes', '::1', '2020-11-29 21:34:27', 0, '0000-00-00 00:00:00', 0),
(5, 'bhaba', 0, '', 'sankarbhaba@gmail.com', 'nsdrtvgfjhweb', '::1', '2020-11-29 21:42:29', 0, '0000-00-00 00:00:00', 0),
(6, 'Bhabasankar', 0, '', 'sankar@gmail.com', 'Hello Hi how are you ?', '::1', '2020-12-02 06:06:45', 1, '2020-12-02 06:06:57', 0),
(7, 'Bhabasankar', 0, '', 'sankar@gmail.com', 'Hello Hi how are you ?', '::1', '2020-12-02 06:07:02', 0, '0000-00-00 00:00:00', 0),
(8, 'Bhabasankar', 0, '', 'sankar@gmail.com', 'Hello Hi how are you ?', '::1', '2020-12-02 06:07:33', 0, '0000-00-00 00:00:00', 0),
(9, 'Bhabasankar', 0, '', 'sankar@gmail.com', 'Hello Hi how are you ?', '::1', '2020-12-02 06:08:04', 0, '0000-00-00 00:00:00', 0),
(10, 'debu', 0, '', 'debu@gmail.com', 'dfghkduhf gkd ghdfkghdklgdgd', '::1', '2020-12-02 06:09:48', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_content`
--

CREATE TABLE `tbl_coupon_content` (
  `id` int(11) NOT NULL,
  `couponcode` varchar(50) NOT NULL,
  `coupon_discount_process` int(1) NOT NULL,
  `percentage_price` int(5) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `messageforuser` varchar(255) NOT NULL,
  `banner_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_coupon_content`
--

INSERT INTO `tbl_coupon_content` (`id`, `couponcode`, `coupon_discount_process`, `percentage_price`, `startdate`, `enddate`, `messageforuser`, `banner_status`, `deleted_status`, `inserted_date`) VALUES
(1, 'LUCKY10', 1, 10, '2021-04-19 00:00:00', '2021-04-20 00:00:00', '', 1, 0, '2021-04-19 00:07:29'),
(2, 'SUPER10', 2, 10, '2021-04-13 00:00:00', '2021-04-17 00:00:00', '', 1, 0, '2021-04-13 03:15:01'),
(3, 'SUPER30', 1, 30, '2021-04-19 00:00:00', '2021-04-20 00:00:00', '', 1, 0, '2021-04-19 00:04:57'),
(4, 'DSF', 1, 333, '2021-04-20 00:00:00', '2021-04-21 00:00:00', '', 1, 0, '2021-04-19 00:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_smtp_conf`
--

CREATE TABLE `tbl_email_smtp_conf` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `port_no` varchar(10) NOT NULL,
  `hostname` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `smtp_encryption` varchar(5) NOT NULL,
  `cont_email` varchar(100) NOT NULL,
  `disply_phone` varchar(100) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_email_smtp_conf`
--

INSERT INTO `tbl_email_smtp_conf` (`id`, `company_name`, `port_no`, `hostname`, `username`, `password`, `smtp_encryption`, `cont_email`, `disply_phone`, `deleted_status`, `inserted_date`) VALUES
(1, 'Hands On Wheel Driving School Solutions1', '587', 'smtp.gmail.com', 'projectclasstest@gmail.com', 'QmhhYmFAMTIz', 'tls', 'projectclasstest@gmail.com', '89898989892', 0, '2021-04-12 22:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_template_content`
--

CREATE TABLE `tbl_email_template_content` (
  `id` int(11) NOT NULL,
  `section_page_title` varchar(200) NOT NULL,
  `banner_name` varchar(100) NOT NULL,
  `banner_alt` longtext NOT NULL,
  `banner_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_email_template_content`
--

INSERT INTO `tbl_email_template_content` (`id`, `section_page_title`, `banner_name`, `banner_alt`, `banner_status`, `deleted_status`, `inserted_date`) VALUES
(1, 'Seminar Completed Message', '', 'Dear {USERNAME},<br>Please find the attached certificate.', 1, 0, '2020-12-04 18:57:36'),
(4, 'Seminar Certificate By admin', '', 'Dear {USERNAME},<br>Please find the attached certificate.', 1, 0, '2020-12-04 18:57:36'),
(2, 'Payment Success Message', '', 'If Shai Reznik\'s TDD videos don\'t convince you to add automated testing your code, I don\'t know what will.This was the very best explanation of frameworks for brginners that I\'ve ever seen.', 1, 0, '2020-12-04 18:20:20'),
(3, 'Registration Success, please follow next step and pay for course', '', 'Dear {USERNAME}, registration successfully completed, please pay for the course now.<br>Your student account with http://www.topnotchdrivingschool.com', 1, 0, '2020-12-05 14:18:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_last_login`
--

CREATE TABLE `tbl_last_login` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES
(1, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-23 22:39:06'),
(2, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-24 21:58:13'),
(3, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-24 22:00:49'),
(4, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-24 22:04:20'),
(5, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-24 22:10:27'),
(6, 3, '{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-25 22:23:55'),
(7, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-29 21:49:48'),
(8, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-29 22:07:03'),
(9, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-29 22:11:19'),
(10, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-06-29 22:14:48'),
(11, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-06 19:00:43'),
(12, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-08 19:16:23'),
(13, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-08 20:20:29'),
(14, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-08 20:24:04'),
(15, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-08 20:29:07'),
(16, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-10 08:35:32'),
(17, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-11 00:04:53'),
(18, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-12 07:07:12'),
(19, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-12 20:31:52'),
(20, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-13 07:16:10'),
(21, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-13 19:08:18'),
(22, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-13 21:19:13'),
(23, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-14 09:35:44'),
(24, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-24 22:55:07'),
(25, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2019-07-25 07:38:27'),
(26, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-12 14:20:54'),
(27, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-13 06:48:41'),
(28, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-13 20:56:33'),
(29, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-13 23:40:47'),
(30, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-14 06:47:05'),
(31, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-14 20:02:11'),
(32, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-15 07:10:06'),
(33, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-15 11:35:16'),
(34, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-15 14:40:24'),
(35, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-15 21:56:20'),
(36, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-16 07:05:39'),
(37, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-16 20:22:15'),
(38, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-17 07:19:52'),
(39, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-17 19:12:46'),
(40, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-18 07:06:59'),
(41, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-18 16:10:58'),
(42, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '112.133.232.97', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-18 18:24:16'),
(43, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '112.133.232.97', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-18 19:09:27'),
(44, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.107', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-20 03:25:41'),
(45, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.18.106', 'Edge 17.17134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', 'Windows 10', '2019-08-20 05:24:36'),
(46, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.18.106', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-20 14:19:50'),
(47, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.83', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-22 01:27:46'),
(48, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.44', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-22 02:47:55'),
(49, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.44', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-22 03:31:00'),
(50, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.18.106', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-27 07:07:16'),
(51, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.15', 'Chrome 76.0.3809.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', '2019-08-27 20:08:56'),
(52, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.18.106', 'Internet Explorer 11.0', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', 'Windows 8.1', '2019-08-28 05:09:45'),
(53, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.18.106', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', '2019-08-29 13:15:17'),
(54, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.18.106', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', '2019-08-30 09:02:26'),
(55, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.32', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', '2019-08-30 13:56:25'),
(56, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.116', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', '2019-09-02 12:34:14'),
(57, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.18.106', 'Chrome 76.0.3809.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'Windows 10', '2019-09-12 14:06:20'),
(58, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.17.10', 'Chrome 78.0.3904.108', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Windows 7', '2019-12-03 12:51:55'),
(59, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '27.4.88.19', 'Chrome 79.0.3945.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 'Windows 10', '2020-01-31 04:55:02'),
(60, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.17.92', 'Chrome 77.0.3865.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36', 'Windows 10', '2020-03-05 07:07:55'),
(61, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.118', 'Chrome 80.0.3987.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 'Windows 10', '2020-03-13 16:33:07'),
(62, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.86', 'Chrome 80.0.3987.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 'Windows 10', '2020-03-14 14:26:30'),
(63, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.90', 'Chrome 80.0.3987.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 'Windows 10', '2020-03-15 02:12:04'),
(64, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '112.133.232.99', 'Chrome 80.0.3987.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Windows 10', '2020-04-02 06:42:07'),
(65, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.105', 'Chrome 81.0.4044.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10', '2020-04-29 01:44:02'),
(66, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.37', 'Chrome 81.0.4044.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10', '2020-04-29 14:31:16'),
(67, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.17.42', 'Chrome 77.0.3865.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36', 'Windows 10', '2020-04-30 11:08:47'),
(68, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.74.111.1', 'Chrome 81.0.4044.129', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10', '2020-05-01 12:26:57'),
(69, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '103.99.17.42', 'Chrome 77.0.3865.75', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36', 'Windows 10', '2020-05-01 13:19:12'),
(70, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.104', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2020-05-02 03:32:52'),
(71, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.104', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2020-05-02 10:09:37'),
(72, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.104', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2020-05-03 09:20:52'),
(73, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.104', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2020-05-05 02:54:04'),
(74, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.104', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2020-05-05 03:24:39'),
(75, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.100', 'Chrome 81.0.4044.129', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10', '2020-05-05 09:00:06'),
(76, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.104', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2020-05-05 10:11:14'),
(77, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.100', 'Chrome 81.0.4044.129', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10', '2020-05-05 14:41:08'),
(78, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.0.104', 'Chrome 75.0.3770.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36', 'Windows 10', '2020-05-05 15:23:18'),
(79, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 81.0.4044.129', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10', '2020-05-07 08:42:36'),
(80, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-24 23:04:12'),
(81, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-24 23:10:42'),
(82, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-24 23:12:35'),
(83, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '192.168.1.102', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-27 14:03:37'),
(84, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-28 03:11:58'),
(85, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-28 09:54:08'),
(86, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-29 16:53:55'),
(87, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-30 00:00:12'),
(88, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-30 08:51:48'),
(89, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-30 14:03:52'),
(90, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-09-30 18:00:12'),
(91, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-10-04 05:16:16'),
(92, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-10-04 10:38:55'),
(93, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-10-05 01:52:27'),
(94, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-10-12 02:04:19'),
(95, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-10-13 22:11:40'),
(96, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-10-13 23:12:34'),
(97, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 84.0.4147.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'Windows 10', '2020-10-14 13:47:02'),
(98, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-02 00:22:25'),
(99, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-04 15:41:10'),
(100, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-05 06:43:25'),
(101, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-05 14:00:23'),
(102, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-09 01:03:47'),
(103, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-09 16:26:42'),
(104, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-10 00:16:21'),
(105, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2020-12-20 13:12:12'),
(106, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-01-09 16:15:38'),
(107, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-01-10 06:20:52'),
(108, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-01-10 13:41:00'),
(109, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-01-11 01:39:02'),
(110, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-01-21 13:46:29'),
(111, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-05 23:34:41'),
(112, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-08 14:06:55'),
(113, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-09 00:19:34'),
(114, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-09 15:46:43'),
(115, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-09 23:23:28'),
(116, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-13 15:19:21'),
(117, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-14 00:15:55'),
(118, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-17 14:10:23'),
(119, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-17 16:00:03'),
(120, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 87.0.4280.66', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36', 'Windows 10', '2021-02-17 16:02:17'),
(121, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-20 00:11:07'),
(122, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-21 01:07:21'),
(123, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-21 16:52:10'),
(124, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-22 17:28:40'),
(125, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-23 00:21:13'),
(126, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-23 23:27:03'),
(127, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-26 14:40:30'),
(128, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-26 22:06:22'),
(129, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-27 23:43:55'),
(130, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-28 05:37:24'),
(131, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 06:19:20'),
(132, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 07:57:42'),
(133, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 07:58:43'),
(134, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\",\"userallowedmenu\":[\"dashboard\",\"listbanner\"]}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 08:37:18'),
(135, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\",\"userallowedmenu\":[\"dashboard\",\"listbanner\"]}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 08:48:25'),
(136, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\",\"userallowedmenu\":[\"dashboard\",\"listbanner\"]}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 08:50:30'),
(137, 9, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 08:52:35'),
(138, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-02-28 08:53:41'),
(139, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 85.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0', 'Windows 10', '2021-02-28 13:42:33'),
(140, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-01 01:49:05'),
(141, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-01 02:57:03'),
(142, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-01 16:36:06'),
(143, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-02 16:04:39'),
(144, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-03 00:53:20'),
(145, 3, '{\"role\":\"2\",\"roleText\":\"Sub-Admin\",\"name\":\"Employee\"}', '127.0.0.1', 'Firefox 86.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', 'Windows 10', '2021-03-03 01:02:08'),
(146, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-03 01:44:01'),
(147, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-05 06:26:31'),
(148, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-15 23:39:14'),
(149, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-16 08:59:23'),
(150, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-17 00:17:52'),
(151, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-17 23:19:51'),
(152, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-19 17:04:52'),
(153, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-28 23:22:50'),
(154, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-29 05:37:46'),
(155, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-29 09:54:25'),
(156, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-29 15:19:37'),
(157, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-03-30 01:20:33'),
(158, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-03 22:44:31'),
(159, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-04 09:21:28'),
(160, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-04 15:01:12'),
(161, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-05 01:23:40'),
(162, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-10 00:39:39'),
(163, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-11 06:26:58'),
(164, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-11 09:39:58'),
(165, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-11 22:37:43'),
(166, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-12 22:13:37'),
(167, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-12 22:30:54'),
(168, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-13 14:00:51'),
(169, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-14 10:04:11'),
(170, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-14 16:42:49'),
(171, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-14 22:00:20'),
(172, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-15 22:43:47'),
(173, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-16 15:05:54'),
(174, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-16 21:55:24'),
(175, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-18 22:49:11'),
(176, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-19 03:55:05');
INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES
(177, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-19 17:51:03'),
(178, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-20 01:29:09'),
(179, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 87.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0', 'Windows 10', '2021-04-20 06:42:49'),
(180, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-20 21:58:07'),
(181, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 88.0.4324.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 'Windows 10', '2021-04-21 08:37:15'),
(182, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 88.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-04-25 09:49:46'),
(183, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 90.0.4430.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'Windows 10', '2021-05-16 09:28:35'),
(184, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 90.0.4430.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'Windows 10', '2021-05-22 02:21:41'),
(185, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 90.0.4430.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'Windows 10', '2021-05-22 10:54:45'),
(186, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 90.0.4430.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'Windows 10', '2021-05-22 17:02:49'),
(187, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '::1', 'Chrome 90.0.4430.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'Windows 10', '2021-05-24 16:50:41'),
(188, 1, '{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"Bhabasankar Dagar\"}', '127.0.0.1', 'Firefox 88.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', 'Windows 10', '2021-06-04 10:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_maintenace_mode`
--

CREATE TABLE `tbl_maintenace_mode` (
  `id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `ips_allowed` text NOT NULL,
  `message` text NOT NULL,
  `date_time_active` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_maintenace_mode`
--

INSERT INTO `tbl_maintenace_mode` (`id`, `is_active`, `ips_allowed`, `message`, `date_time_active`) VALUES
(1, 0, '', '<p style=\"text-align: center;\"><strong><br /><br /><br /><br /><br /><br />Maintenance mode active, we will back soon</strong></p>', '2021-03-29 20:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `SLNO` int(11) NOT NULL,
  `MENU_ID` varchar(8) NOT NULL,
  `DISPLAY_ORDER` int(11) NOT NULL DEFAULT '0',
  `MODULE_ID` varchar(8) NOT NULL,
  `PARENT_ID` varchar(8) NOT NULL,
  `IMAGE` varchar(100) NOT NULL,
  `MENU_LABEL` varchar(30) NOT NULL,
  `MENU_DESC` varchar(30) NOT NULL,
  `FILE_PATH` varchar(60) NOT NULL,
  `ACTIIVATION_DATE` date NOT NULL,
  `DE_ACTIVATION_DATE` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  `CREATED_BY` varchar(8) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `UPDATED_BY` varchar(8) DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`SLNO`, `MENU_ID`, `DISPLAY_ORDER`, `MODULE_ID`, `PARENT_ID`, `IMAGE`, `MENU_LABEL`, `MENU_DESC`, `FILE_PATH`, `ACTIIVATION_DATE`, `DE_ACTIVATION_DATE`, `STATUS`, `CREATED_BY`, `CREATED_DATE`, `UPDATED_BY`, `UPDATED_DATE`) VALUES
(1, '1', 1, '', '', '<i class=\"fa fa-tachometer\" aria-hidden=\"true\"></i>', 'Dashboard', '', 'dashboard', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 05:51:16', 'Sysadm', '2021-02-27 06:27:02'),
(2, '2', 2, '', '', '', 'Manage Banner', '', 'listbanner', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:03:02', NULL, NULL),
(3, '3', 3, '', '', '', 'Manage Home Page Sections', '', 'list_page', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:04:41', 'Sysadm', '2021-02-27 06:09:09'),
(4, '4', 4, '', '', '', 'Manage Category', '', 'MngBroadbandPlans', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:04:41', 'Sysadm', '2021-02-27 06:09:03'),
(5, '5', 5, '', '', '', 'Manage Seminar Types', '', 'listplans', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:09:43', NULL, NULL),
(6, '6', 6, '', '', '', 'Manage Seminar Pages', '', 'listseminarcontent', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:10:07', NULL, NULL),
(7, '7', 7, '', '', '', 'Manage Images', '', 'listclientdata', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:10:24', NULL, NULL),
(8, '8', 8, '', '', '', 'Manage Our Features', '', 'updatecareermsg/1', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:10:44', NULL, NULL),
(9, '9', 9, '', '', '', 'Manage Testimonials', '', 'list_page_testimonial', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:11:06', NULL, NULL),
(10, '10', 10, '', '', '', 'Manage Email Template', '', 'list_page_emailtemplate', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:11:28', NULL, NULL),
(11, '11', 11, '', '', '<i class=\"fa fa-cog\" aria-hidden=\"true\"></i>', 'Manage Smtp, Phone, Email', '', 'list_page_setting', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:11:57', 'Sysadm', '2021-02-27 06:32:23'),
(12, '12', 12, '', '', '<i class=\"fa fa-cog\" aria-hidden=\"true\"></i>', 'Manage Payapl Api Access', '', 'list_paypal_setting', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:12:24', 'Sysadm', '2021-02-27 06:32:16'),
(13, '13', 13, '', '', '', 'Manage Coupon Code', '', 'list_page_coupon', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:12:45', NULL, NULL),
(14, '14', 14, '', '', '', 'Contact Details', '', 'listcontact', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:13:17', NULL, NULL),
(15, '15', 15, '', '', '', 'Admin Users', '', 'userListing', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:13:57', NULL, NULL),
(16, '16', 16, '', '', '<i class=\"fa fa-cog\" aria-hidden=\"true\"></i>', 'Manage Menu', '', 'allmenus', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-27 06:14:17', 'Sysadm', '2021-02-27 06:32:31'),
(17, '17', 17, '', '', '', 'Role Wise Menu', '', 'rolewisemenuview', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-28 05:20:51', 'Sysadm', '2021-02-28 15:52:17'),
(18, '18', 18, '', '', '', 'Registred Student Details', '', 'studentlistingdata', '0000-00-00', NULL, 'A', 'Sysadm', '2021-02-28 20:40:43', 'Sysadm', '2021-03-01 08:24:48'),
(19, '19', 19, '', '', '', 'Maintenance Mode', '', 'maintenance', '0000-00-00', NULL, 'A', 'Sysadm', '2021-03-29 04:57:22', NULL, NULL),
(20, '20', 20, '', '', '', 'Manage Logo', '', 'managelogo', '0000-00-00', NULL, 'A', 'Sysadm', '2021-04-04 15:09:30', NULL, NULL),
(21, '21', 21, '', '', '', 'Manage Ads', '', 'listads', '0000-00-00', NULL, 'A', 'Sysadm', '2021-04-13 21:42:14', NULL, NULL),
(22, '22', 1, '', '', '', 'Database Backup', '', 'backupdblist', '0000-00-00', NULL, 'A', 'Sysadm', '2021-05-22 04:15:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page_content`
--

CREATE TABLE `tbl_page_content` (
  `id` int(11) NOT NULL,
  `section_page_title` varchar(200) NOT NULL,
  `banner_name` varchar(100) NOT NULL,
  `banner_alt` longtext NOT NULL,
  `banner_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_page_content`
--

INSERT INTO `tbl_page_content` (`id`, `section_page_title`, `banner_name`, `banner_alt`, `banner_status`, `deleted_status`, `inserted_date`) VALUES
(1, 'Top Notch Driving School Solutions', 'd44e70132d4480ceb9ae2018e400808d.png', '<p><strong>Enroll now for three simple online or audio read-along seminars that make it easy for you to:</strong></p>\r\n<ul>\r\n<li>Bypass DMV Instructor & Operator license renewal testing</li>\r\n<li>Document your understanding of all instructor & driver regulations</li>\r\n<li>Demonstrate your knowledge of California’s “rules of the road”</li>\r\n<li>Increase your personal driving skills</li>\r\n<li>Improve your Driver Education Instructor performance</li>\r\n</ul>', 1, 0, '2020-09-28 06:24:33'),
(2, 'Course Highlights', '48bb2ab7fda41cd1aebaf038b3f66865.jpg', '<p><span class=\"fa fa-graduation-cap customfa\" aria-hidden=\"true\"> </span></p>\r\n<ul class=\"features_block\">\r\n<li>No Hidden Fees.</li>\r\n<li>Learn about new DMV laws and changes that affect your job.</li>\r\n<li>Stay “ahead of the curve”on the best teaching techniques.</li>\r\n<li>Interesting videos.</li>\r\n<li>California DMV approved.</li>\r\n<li>Most Current and Up-to Date Curriculum in the Industry.</li>\r\n<li>You can print out your certificate after completing each course.</li>\r\n</ul>', 1, 0, '2020-09-27 19:35:00'),
(3, 'Seminar Topics', 'c858d15664dc3f386e1b602c7ca423a0.jpg', '<p><span class=\"fa fa-book customfa2\" aria-hidden=\"true\"> </span></p>\r\n<ul class=\"features_block\">\r\n<li>No Hidden Fees.</li>\r\n<li>Learn about new DMV laws and changes that affect your job.</li>\r\n<li>Stay “ahead of the curve”on the best teaching techniques.</li>\r\n<li>Interesting videos.</li>\r\n<li>California DMV approved.</li>\r\n<li>Most Current and Up-to Date Curriculum in the Industry.</li>\r\n<li>You can print out your certificate after completing each course.</li>\r\n</ul>', 1, 0, '2020-09-27 19:45:16'),
(4, 'Why Choose Us', '03ac9b113664adc9246190990b868d1c.png', '<div class=\"feature_content\">\r\n<div class=\"accordions\">\r\n<div class=\"elements_accordions\">\r\n<div class=\"accordion_container\">\r\n<div class=\"accordion d-flex flex-row align-items-center\">\r\n<div>Award for Best School 2017</div>\r\n</div>\r\n<div class=\"accordion_panel\">\r\n<p>Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n</div>\r\n</div>\r\n<div class=\"accordion_container\">\r\n<div class=\"accordion d-flex flex-row align-items-center\">\r\n<div>You’re learning from the best.</div>\r\n</div>\r\n<div class=\"accordion_panel\">\r\n<p>Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n</div>\r\n</div>\r\n<div class=\"accordion_container\">\r\n<div class=\"accordion d-flex flex-row align-items-center\">\r\n<div>Our degrees are recognized worldwide.</div>\r\n</div>\r\n<div class=\"accordion_panel\">\r\n<p>Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n</div>\r\n</div>\r\n<div class=\"accordion_container\">\r\n<div class=\"accordion d-flex flex-row align-items-center\">\r\n<div>We encourage our students to go global.</div>\r\n</div>\r\n<div class=\"accordion_panel\">\r\n<p>Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 0, '2020-09-27 19:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page_section`
--

CREATE TABLE `tbl_page_section` (
  `id` int(11) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `sectiondata_data` text NOT NULL,
  `section_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_page_section`
--

INSERT INTO `tbl_page_section` (`id`, `section_name`, `sectiondata_data`, `section_status`, `deleted_status`, `inserted_date`) VALUES
(1, 'careersection', '<h2 class=\"counter_title\">Our Features</h2>\r\n<div class=\"counter_text\">\r\n<p>You can continue to take the online seminars each time your license comes up for renewal in order to bypass the DMV test. If you are an operator and an instructor and your license needs to be renewed at different times make sure you keep a copy of your certificates to hand in to the DMV. You can use the same email, username and password for all 3 seminars.Only one seminar can be completed per day.Our courses were written by professionals in the driving and traffic school industry.</p>\r\n<p><a class=\"btn btn-danger\"><span class=\"fa fa-key\" aria-hidden=\"true\"> </span>Register Now</a></p>\r\n</div>', 1, 0, '2020-09-27 20:20:21'),
(2, 'offerunderbanner', '<div class=\"row offersection\">\r\n<div class=\"col-md-2 col-md-height text-center\"><img class=\"underbannerofimg\" src=\"img/fiber-optics-2633604_640.jpg\"></div>\r\n<div class=\"col-md-4 col-md-height\">\r\n<h5>Get <strong>1 Month Internet free</strong> on a 12 Month Plan*</h5>\r\n<a class=\"btn btn-success\" href=\"#new_connform\">Buy Now</a></div>\r\n<div class=\"col-md-2 col-md-height text-center\"><img class=\"underbannerofimg\" src=\"img/asianetdigital.jpg\"></div>\r\n<div class=\"col-md-4 col-md-height\"><a class=\"btn btn-success\" href=\"#new_connform\">Buy Now</a></div>\r\n</div>', 1, 0, '2020-05-05 16:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_request`
--

CREATE TABLE `tbl_payment_request` (
  `SL_NO` int(11) NOT NULL,
  `PRN` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_JAZE` int(11) DEFAULT NULL,
  `USER_FULL_NAME` varchar(100) NOT NULL,
  `USER_MOBILE_NO` bigint(20) NOT NULL,
  `USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ORDER_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PAYMENT_DATE` datetime NOT NULL,
  `AMOUNT_DUE` decimal(10,2) NOT NULL,
  `PAYMENT_AMOUNT` decimal(10,2) NOT NULL,
  `REMARKS` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PROVIDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MRCHNT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PYT_SOURCE` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAID` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RESPMSG` varchar(100) NOT NULL,
  `PROV_REFERENCE_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROV_REFERENCE_DATE` datetime DEFAULT NULL,
  `FIN_REFERENCE_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIN_REFERENCE_DATE` datetime DEFAULT NULL,
  `TRAN_RESPONSE` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TRAN_RESPONSE_DATE` datetime DEFAULT NULL,
  `CREATED_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CREATION_DATE` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_request`
--

INSERT INTO `tbl_payment_request` (`SL_NO`, `PRN`, `ID_JAZE`, `USER_FULL_NAME`, `USER_MOBILE_NO`, `USER_ID`, `ORDER_NO`, `PAYMENT_DATE`, `AMOUNT_DUE`, `PAYMENT_AMOUNT`, `REMARKS`, `PROVIDER`, `MRCHNT_ID`, `PYT_SOURCE`, `PAID`, `RESPMSG`, `PROV_REFERENCE_NO`, `PROV_REFERENCE_DATE`, `FIN_REFERENCE_NO`, `FIN_REFERENCE_DATE`, `TRAN_RESPONSE`, `TRAN_RESPONSE_DATE`, `CREATED_BY`, `CREATION_DATE`) VALUES
(27, '', 71689, 'Mr  Biswa Singh', 9178487432, 'utc.biswanath', '20200501ORDS19917549', '2020-05-01 20:09:01', '1098.00', '549.00', '', 'PAYTM', NULL, NULL, 'P', '', NULL, '2020-05-01 20:09:01', NULL, '2020-05-01 20:09:01', NULL, '2020-05-01 20:09:01', 'utc.biswanath', '2020-05-01 20:09:01'),
(25, '', 246735, 'Trinath Swain', 9777384227, 'utel.trinath', '20200305ORDS71881772', '2020-03-05 12:46:25', '549.00', '400.00', '', 'PAYTM', NULL, NULL, 'P', '', NULL, '2020-03-05 12:46:25', NULL, '2020-03-05 12:46:25', NULL, '2020-03-05 12:46:25', 'utel.trinath', '2020-03-05 12:46:25'),
(26, '', 72005, 'Mr  Rabi Jena', 9938093660, 'Utc.rabinarayan', '20200430ORDS60975965', '2020-04-30 13:39:52', '1098.00', '1098.00', 'SUCCESS', 'PAYTM', 'Udayat95042597625257', 'NB', 'Y', 'Txn Success', '20200430111212800110168404425388718', '2020-04-30 13:44:57', '109837797122', '2020-04-30 13:44:57', 'S', '2020-04-30 13:44:57', 'Utc.rabinarayan', '2020-04-30 13:39:52'),
(24, '', 72247, 'Mr  Udayatel Office', 7008079252, 'utel.office', '20190906ORDS89729430', '2019-09-06 15:36:40', '-3.00', '0.00', 'FAILED', 'PAYTM', 'Udayat95042597625257', NULL, 'N', 'User has not completed transaction.', NULL, '2019-09-06 15:36:40', '20190906111212800110168712586513217', '2019-09-06 15:37:03', 'F', '2019-09-06 15:37:03', 'utel.office', '2019-09-06 15:36:40'),
(22, '', 72247, 'Mr  Udayatel Office', 7008079252, 'utel.office', '20190906ORDS80903037', '2019-09-06 15:19:29', '-2.00', '1.00', '', 'PAYTM', NULL, NULL, 'P', '', NULL, '2019-09-06 15:19:29', NULL, '2019-09-06 15:19:29', NULL, '2019-09-06 15:19:29', 'utel.office', '2019-09-06 15:19:29'),
(23, '', 72247, 'Mr  Udayatel Office', 7008079252, 'utel.office', '20190906ORDS44194369', '2019-09-06 15:21:44', '-2.00', '1.00', 'SUCCESS', 'PAYTM', 'Udayat95042597625257', 'UPI', 'Y', 'Txn Success', '20190906111212800110168995286313754', '2019-09-06 15:24:40', '924939535177', '2019-09-06 15:24:40', 'S', '2019-09-06 15:24:40', 'utel.office', '2019-09-06 15:21:44'),
(21, '', 72247, 'Mr  Udayatel Office', 7008079252, 'utel.office', '20190828ORDS36211705', '2019-08-28 09:09:26', '-1.00', '1.00', 'SUCCESS', 'PAYTM', 'Udayat95042597625257', 'UPI', 'Y', 'Txn Success', '20190828111212800110168137784983261', '2019-08-28 09:10:44', '924033575914', '2019-08-28 09:10:44', 'S', '2019-08-28 09:10:44', 'utel.office', '2019-08-28 09:09:26'),
(20, '', 72247, 'Mr  Udayatel Office', 7008079252, 'utel.office', '20190828ORDS14723938', '2019-08-28 01:39:32', '0.00', '1.00', 'SUCCESS', 'PAYTM', 'Udayat95042597625257', 'NB', 'Y', 'Txn Success', '20190828111212800110168538685097263', '2019-08-28 01:41:37', '108655336608', '2019-08-28 01:41:37', 'S', '2019-08-28 01:41:37', 'utel.office', '2019-08-28 01:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_request_status`
--

CREATE TABLE `tbl_payment_request_status` (
  `SL_NO` int(11) NOT NULL,
  `BATCH_NO` int(11) NOT NULL,
  `ID_JAZE` int(11) NOT NULL,
  `USER_FULL_NAME` varchar(100) NOT NULL,
  `USER_MOBILE_NO` bigint(20) NOT NULL,
  `BATCH_DATE` date NOT NULL,
  `USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ORDER_NO` varchar(50) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(1) NOT NULL COMMENT '''S'' - Subscription',
  `PAYMENT_MODE` varchar(1) NOT NULL COMMENT '''O'' - Online, ''C'' - Cash'','' Q'' - Cheque',
  `PAYMENT_AMOUNT` decimal(10,2) NOT NULL,
  `PAYMENT_DATE` date NOT NULL,
  `PAYMENT_REMARKS` varchar(100) NOT NULL,
  `PAYMENT_REF_NO` varchar(50) NOT NULL,
  `PAYMENT_REF_DATE` date NOT NULL,
  `TRAN_REF_NO` varchar(100) DEFAULT NULL,
  `TXNDATE` datetime NOT NULL,
  `BANK_NAME` varchar(150) DEFAULT NULL,
  `BANK_BRANCH` varchar(60) DEFAULT NULL,
  `CHEQUE_NO` varchar(16) DEFAULT NULL,
  `CHEQUE_DATE` date DEFAULT NULL,
  `PAYMENT_STATUS` varchar(1) NOT NULL COMMENT '''N'' - NonPosted, ''P'' - Posted',
  `CREATED_BY` varchar(50) NOT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `POSTING_BY` varchar(50) DEFAULT NULL,
  `POSTING_DATE` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_request_status`
--

INSERT INTO `tbl_payment_request_status` (`SL_NO`, `BATCH_NO`, `ID_JAZE`, `USER_FULL_NAME`, `USER_MOBILE_NO`, `BATCH_DATE`, `USER_ID`, `ORDER_NO`, `PAYMENT_TYPE`, `PAYMENT_MODE`, `PAYMENT_AMOUNT`, `PAYMENT_DATE`, `PAYMENT_REMARKS`, `PAYMENT_REF_NO`, `PAYMENT_REF_DATE`, `TRAN_REF_NO`, `TXNDATE`, `BANK_NAME`, `BANK_BRANCH`, `CHEQUE_NO`, `CHEQUE_DATE`, `PAYMENT_STATUS`, `CREATED_BY`, `CREATION_DATE`, `POSTING_BY`, `POSTING_DATE`) VALUES
(26, 26, 71689, 'Mr  Biswa Singh', 9178487432, '2020-05-01', 'utc.biswanath', '20200501ORDS19917549', 'S', 'O', '549.00', '2020-05-01', '', '20200501ORDS19917549', '2020-05-01', NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 'N', 'utc.biswanath', '2020-05-01 20:09:01', 'utc.biswanath', '2020-05-01 20:09:01'),
(24, 24, 246735, 'Trinath Swain', 9777384227, '2020-03-05', 'utel.trinath', '20200305ORDS71881772', 'S', 'O', '400.00', '2020-03-05', '', '20200305ORDS71881772', '2020-03-05', NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 'N', 'utel.trinath', '2020-03-05 12:46:25', 'utel.trinath', '2020-03-05 12:46:25'),
(25, 25, 72005, 'Mr  Rabi Jena', 9938093660, '2020-04-30', 'Utc.rabinarayan', '20200430ORDS60975965', 'S', 'O', '1098.00', '2020-04-30', 'SUCCESS', '20200430ORDS60975965', '2020-04-30', '20200430111212800110168404425388718', '2020-04-30 13:39:57', 'ASBI', NULL, NULL, NULL, 'P', 'Utc.rabinarayan', '2020-04-30 13:39:52', 'Utc.rabinarayan', '2020-04-30 13:39:52'),
(23, 23, 72247, 'Mr  Udayatel Office', 7008079252, '2019-09-06', 'utel.office', '20190906ORDS89729430', 'S', 'O', '0.00', '2019-09-06', 'FAILED', '20190906ORDS89729430', '2019-09-06', '20190906111212800110168712586513217', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 'F', 'utel.office', '2019-09-06 15:36:40', 'utel.office', '2019-09-06 15:36:40'),
(21, 21, 72247, 'Mr  Udayatel Office', 7008079252, '2019-09-06', 'utel.office', '20190906ORDS80903037', 'S', 'O', '1.00', '2019-09-06', '', '20190906ORDS80903037', '2019-09-06', NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 'N', 'utel.office', '2019-09-06 15:19:29', 'utel.office', '2019-09-06 15:19:29'),
(22, 22, 72247, 'Mr  Udayatel Office', 7008079252, '2019-09-06', 'utel.office', '20190906ORDS44194369', 'S', 'O', '1.00', '2019-09-06', 'SUCCESS', '20190906ORDS44194369', '2019-09-06', '20190906111212800110168995286313754', '2019-09-06 15:21:44', NULL, NULL, NULL, NULL, 'P', 'utel.office', '2019-09-06 15:21:44', 'utel.office', '2019-09-06 15:21:44'),
(20, 20, 72247, 'Mr  Udayatel Office', 7008079252, '2019-08-28', 'utel.office', '20190828ORDS36211705', 'S', 'O', '1.00', '2019-08-28', 'SUCCESS', '20190828ORDS36211705', '2019-08-28', '20190828111212800110168137784983261', '2019-08-28 09:09:27', NULL, NULL, NULL, NULL, 'P', 'utel.office', '2019-08-28 09:09:26', 'utel.office', '2019-08-28 09:09:26'),
(19, 19, 72247, 'Mr  Udayatel Office', 7008079252, '2019-08-28', 'utel.office', '20190828ORDS14723938', 'S', 'O', '1.00', '2019-08-28', 'SUCCESS', '20190828ORDS14723938', '2019-08-28', '20190828111212800110168538685097263', '2019-08-28 01:39:33', 'ASBI', NULL, NULL, NULL, 'P', 'utel.office', '2019-08-28 01:39:32', 'utel.office', '2019-08-28 01:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_paypal_conf`
--

CREATE TABLE `tbl_paypal_conf` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `port_no` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `smtp_encryption` varchar(5) NOT NULL,
  `cont_email` varchar(100) NOT NULL,
  `disply_phone` varchar(100) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_paypal_conf`
--

INSERT INTO `tbl_paypal_conf` (`id`, `company_name`, `port_no`, `hostname`, `username`, `password`, `smtp_encryption`, `cont_email`, `disply_phone`, `deleted_status`, `inserted_date`) VALUES
(1, 'http://localhost/topnotch/', 'sdfsd', 'fgsdf', 'AZ80UbSZQkglt1SdwR9q5cZiBwAOHxKA-hbzchZkTB4hJRs8bbg0UbOmVZZF9hCWTyBz-GrHto7VXfCv', 'EHYtg80Kqsq_8Um72WcrwkmGHpwO1L3VbW8hV_yXxMBqE0IzCitl76tHZdWBmDSFgBZ-NZ0GSHOVDONn', '1', '', '', 0, '2021-06-04 10:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plans`
--

CREATE TABLE `tbl_plans` (
  `id` int(11) NOT NULL,
  `categoryname` int(3) NOT NULL,
  `price` int(11) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `planname` varchar(200) NOT NULL,
  `plandetails` text NOT NULL,
  `display_order` int(2) NOT NULL DEFAULT '0',
  `cat_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_plans`
--

INSERT INTO `tbl_plans` (`id`, `categoryname`, `price`, `duration`, `planname`, `plandetails`, `display_order`, `cat_status`, `deleted_status`, `inserted_date`) VALUES
(1, 1, 50, '3 Months', 'Seminar 1', '<div class=\"course_text\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipi elitsed do eiusmod tempor</p>\r\n<ul>\r\n<li>6 Hour Required Curriculum</li>\r\n<li>Distracted Driving</li>\r\n<li>Rules of the Road</li>\r\n<li>Defensive Driving & More</li>\r\n<li>DMV Approved Course</li>\r\n<li>Instructor and/or Operator</li>\r\n</ul>\r\n</div>', 1, 1, 0, '2020-10-04 10:42:54'),
(2, 1, 50, '6 Months', 'Seminar 2', '<div class=\"course_text\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipi elitsed do eiusmod tempor</p>\r\n<ul>\r\n<li>6 Hour Required Curriculum</li>\r\n<li>Distracted Driving</li>\r\n<li>Rules of the Road</li>\r\n<li>Defensive Driving & More</li>\r\n<li>DMV Approved Course</li>\r\n<li>Instructor and/or Operator</li>\r\n</ul>\r\n</div>', 2, 1, 0, '2020-10-04 10:43:01'),
(3, 1, 50, '1 Year', 'Seminar 3', '<div class=\"course_text\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipi elitsed do eiusmod tempor</p>\r\n<ul>\r\n<li>6 Hour Required Curriculum</li>\r\n<li>Distracted Driving</li>\r\n<li>Rules of the Road</li>\r\n<li>Defensive Driving & More</li>\r\n<li>DMV Approved Course</li>\r\n<li>Instructor and/or Operator</li>\r\n</ul>\r\n</div>', 3, 1, 0, '2020-10-04 10:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reading_status`
--

CREATE TABLE `tbl_reading_status` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `topicid` int(11) NOT NULL,
  `when_read` datetime NOT NULL,
  `reading_starttime` datetime NOT NULL,
  `reading_endtime` datetime NOT NULL,
  `total_time_spend` varchar(20) NOT NULL,
  `ipaddress` varchar(20) NOT NULL,
  `insert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_reading_status`
--

INSERT INTO `tbl_reading_status` (`id`, `userid`, `courseid`, `topicid`, `when_read`, `reading_starttime`, `reading_endtime`, `total_time_spend`, `ipaddress`, `insert_date`) VALUES
(1, 2, 3, 2, '2021-02-28 19:13:52', '2021-06-04 03:32:28', '2021-06-04 03:32:28', '710', '::1', '2021-06-04 03:32:28'),
(2, 2, 3, 7, '2021-02-28 19:16:26', '2021-04-20 15:55:00', '2021-04-20 15:55:00', '265', '127.0.0.1', '2021-04-20 15:55:00'),
(3, 2, 3, 6, '2021-03-01 19:26:07', '2021-05-11 10:55:21', '2021-05-11 10:55:21', '3950', '::1', '2021-05-11 10:55:21'),
(4, 6, 1, 1, '2021-04-12 06:43:32', '2021-04-12 06:43:37', '2021-04-12 06:43:37', '10', '127.0.0.1', '2021-04-12 06:43:37'),
(5, 6, 3, 2, '2021-04-12 06:43:51', '2021-04-12 07:03:22', '2021-04-12 07:03:22', '1160', '127.0.0.1', '2021-04-12 07:03:22'),
(6, 2, 1, 16, '2021-04-15 15:45:49', '2021-04-15 15:45:49', '2021-04-15 15:45:49', '5', '127.0.0.1', '2021-04-15 15:45:49'),
(7, 2, 2, 13, '2021-04-15 15:45:58', '2021-06-04 03:32:35', '2021-06-04 03:32:35', '1760', '::1', '2021-06-04 03:32:35'),
(8, 2, 1, 1, '2021-05-11 05:14:48', '2021-05-11 05:14:48', '2021-05-11 05:14:48', '5', '::1', '2021-05-11 05:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `id` int(11) NOT NULL,
  `faname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` int(11) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `school_name` varchar(200) NOT NULL,
  `driver_license` varchar(200) NOT NULL,
  `school_operator` varchar(200) NOT NULL,
  `instructor_license` varchar(200) NOT NULL,
  `operator_license` varchar(200) NOT NULL,
  `show_certificate` varchar(50) NOT NULL,
  `ole_date` date NOT NULL,
  `ile_date` date NOT NULL,
  `frm_gender` varchar(20) NOT NULL,
  `hear` int(11) NOT NULL,
  `dob_date` date NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `account_created` datetime DEFAULT NULL,
  `account_status` int(1) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`id`, `faname`, `lname`, `email`, `phone`, `address`, `city`, `state`, `zip`, `school_name`, `driver_license`, `school_operator`, `instructor_license`, `operator_license`, `show_certificate`, `ole_date`, `ile_date`, `frm_gender`, `hear`, `dob_date`, `course_id`, `username`, `password`, `account_created`, `account_status`, `updated_by`, `updated_date`) VALUES
(1, 'Bhaba12', 'sankar', 'sankarbhabawd@gmail.com', 7008100676, 'bbsr', 'bbsr', 1, '741582', 'Driving school', '123456', '7890', '951753', '456456', 'Both', '2020-01-10', '2020-02-10', 'Male', 0, '1987-06-16', '1', '', '$2y$10$P8PVlDt66hLIDR6K6fDvdudZLprM8a/4fCHuFEzEPVSZi6AZOuUnK', '2020-10-03 08:39:32', 0, '1', '2021-04-11 19:06:08'),
(2, 'Bhabasankar', 'Dagar', 'sankarbhaba@gmail.com', 9338688163, 'Laxmisagar', 'bbsr', 2, '85693', 'utkal222', '74100', '852', '963000', '7410123', 'Operator', '2021-04-27', '0000-00-00', 'Male', 0, '1987-06-17', '1', '', '$2y$10$sxlLNGOw4DKEZKe70tcOB.52mO9o1Qwv1XvizvjJ54WiPlOaaYsUS', '2020-10-03 08:46:47', 0, '1', '2021-04-20 01:25:31'),
(4, 'Bhaba', 'Sankar', 'sltechnoway12@gmail.com', 9363868856, 'Jitikarsuanlo', 'BHubaneswar', 2, '658768756', 'Debray', '123', '456', '789', '111', 'Both', '2020-02-10', '2020-03-10', 'Male', 0, '2020-03-10', '3', '', '$2y$10$2fTxzo8TkpSGhU6BnGwHBeHv9NW9JeirJ4cJ0Faub425sQfYDrt3m', '2020-10-03 22:05:10', 1, '1', '2021-04-13 04:26:38'),
(5, 'Bhaba', 'sankar', 'sankarbhaba2@gmail.com', 7008100810, 'dfjutgofig', 'bhabhgasdhjg', 1, '741258', 'bhjagsdfhj', '567259687', '6465', '64546', '4565465', 'Both', '0000-00-00', '2021-04-20', 'Male', 0, '1987-06-16', '', NULL, '$2y$10$smUrQHwEe.sQJ0clh9nO0OWEsXxlIymfvuF/i5tC2aMrUGP8SkbSm', NULL, 0, '1', '2021-04-18 21:41:14'),
(7, 'Bhaba', 'sankar', 'sankarbhaba77@gmail.com', 9338688163, 'asda', 'asda', 29, '9685768', 'asdasd', 'asd123123', '2313', 'aswda', '23123', 'Instructor', '0000-00-00', '2021-04-27', 'Male', 0, '2021-04-20', '', NULL, '$2y$10$dTYUkBUDCwMHEE9baxUUre6HK1QbEPBtJuphRt/KECLk.UBkoR1oi', '2021-04-18 22:27:32', 0, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration_deleted_user_detail`
--

CREATE TABLE `tbl_registration_deleted_user_detail` (
  `id` int(11) NOT NULL,
  `faname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` int(11) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `school_name` varchar(200) NOT NULL,
  `driver_license` varchar(200) NOT NULL,
  `school_operator` varchar(200) NOT NULL,
  `instructor_license` varchar(200) NOT NULL,
  `operator_license` varchar(200) NOT NULL,
  `show_certificate` varchar(50) NOT NULL,
  `ole_date` date NOT NULL,
  `ile_date` date NOT NULL,
  `frm_gender` varchar(20) NOT NULL,
  `hear` int(11) NOT NULL,
  `dob_date` date NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `account_created` datetime DEFAULT NULL,
  `account_status` int(1) NOT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registration_deleted_user_detail`
--

INSERT INTO `tbl_registration_deleted_user_detail` (`id`, `faname`, `lname`, `email`, `phone`, `address`, `city`, `state`, `zip`, `school_name`, `driver_license`, `school_operator`, `instructor_license`, `operator_license`, `show_certificate`, `ole_date`, `ile_date`, `frm_gender`, `hear`, `dob_date`, `course_id`, `username`, `password`, `account_created`, `account_status`, `updated_by`, `updated_date`) VALUES
(6, 'sdjtgf rt', 'we', 'sankarbhaba23@gmail.com', 9338688163, 'qdeasdasd', 'sdfsdfds', 1, '6857402589', 'dfgdfg', 'dfgdfg', '', '', '', '0', '0000-00-00', '0000-00-00', 'Female', 0, '0000-00-00', '', NULL, '$2y$10$6x/U6RlFjaVmMZ/cHnQrTORKGv5XMTLmWvvOz1JBmarAuvLtkpfCS', '2021-04-11 23:11:16', 0, '1', '2021-04-19 06:03:13'),
(6, 'sdjtgf rt', 'we', 'sankarbhaba23@gmail.com', 9338688163, 'qdeasdasd', 'sdfsdfds', 1, '6857402589', 'dfgdfg', 'dfgdfg', '', '', '', '0', '0000-00-00', '0000-00-00', 'Female', 0, '0000-00-00', '', NULL, '$2y$10$6x/U6RlFjaVmMZ/cHnQrTORKGv5XMTLmWvvOz1JBmarAuvLtkpfCS', '2021-04-11 23:11:16', 0, '1', '2021-04-19 06:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(2, 'Sub-Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seminar_certificate_details`
--

CREATE TABLE `tbl_seminar_certificate_details` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `seminarid` int(11) NOT NULL,
  `onthisday` varchar(20) DEFAULT NULL,
  `dayof` varchar(20) DEFAULT NULL,
  `inthisyr` varchar(20) DEFAULT NULL,
  `certificatename` varchar(200) NOT NULL,
  `certificate_old_name_backup` varchar(200) DEFAULT NULL,
  `certicated_created_on` datetime NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `is_emailed` int(11) NOT NULL,
  `how_many_time_emailed` int(11) NOT NULL,
  `insert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_seminar_certificate_details`
--

INSERT INTO `tbl_seminar_certificate_details` (`id`, `userid`, `seminarid`, `onthisday`, `dayof`, `inthisyr`, `certificatename`, `certificate_old_name_backup`, `certicated_created_on`, `ip_address`, `is_emailed`, `how_many_time_emailed`, `insert_date`) VALUES
(1, 2, 3, '20th', 'April', '2021', 'Seminar 3_completion_certificate_Bhabasankar_Dagar_2_2095489199.pdf', NULL, '2021-05-10 15:55:00', '127.0.0.1', 0, 0, '2021-04-20 15:55:00'),
(2, 2, 2, '20th', 'April', '2021', 'Seminar 2_completion_certificate_Bhabasankar_Dagar_2_1333129304.pdf', 'Seminar 2_completion_certificate_Bhabasankar_Dagar_2_1333129304.pdf', '2021-04-20 15:55:17', '127.0.0.1', 1, 0, '2021-04-20 15:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seminar_certificate_details_by_admin`
--

CREATE TABLE `tbl_seminar_certificate_details_by_admin` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `seminarid` int(11) NOT NULL,
  `onthisday` varchar(10) NOT NULL,
  `dayof` varchar(10) NOT NULL,
  `inthisyr` varchar(10) NOT NULL,
  `certificatename` varchar(200) NOT NULL,
  `user_certificate_name_version_2` varchar(200) DEFAULT NULL,
  `is_version_2_display` int(11) NOT NULL DEFAULT '0' COMMENT '1=Yes,0=No',
  `certicated_created_on` datetime NOT NULL,
  `certicated_created_onv2` datetime DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL,
  `is_emailed` int(11) NOT NULL,
  `how_many_time_emailed` int(11) NOT NULL,
  `insert_date` datetime NOT NULL,
  `infoupdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_seminar_certificate_details_by_admin`
--

INSERT INTO `tbl_seminar_certificate_details_by_admin` (`id`, `userid`, `seminarid`, `onthisday`, `dayof`, `inthisyr`, `certificatename`, `user_certificate_name_version_2`, `is_version_2_display`, `certicated_created_on`, `certicated_created_onv2`, `ip_address`, `is_emailed`, `how_many_time_emailed`, `insert_date`, `infoupdate`) VALUES
(1, 2, 2, '', '', '', '', 'Seminar_2_completion_certificate_Bhabasankar_Dagar_2_1773258130_v2.pdf', 0, '0000-00-00 00:00:00', '2021-04-20 16:12:56', '::1', 0, 0, '2021-04-20 16:12:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seminar_content`
--

CREATE TABLE `tbl_seminar_content` (
  `id` int(11) NOT NULL,
  `seminartypename` int(3) NOT NULL,
  `seminar_title_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `seminardetailsdata` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `skiptime` int(11) NOT NULL DEFAULT '0',
  `display_order` int(2) NOT NULL DEFAULT '0',
  `cat_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_seminar_content`
--

INSERT INTO `tbl_seminar_content` (`id`, `seminartypename`, `seminar_title_name`, `seminardetailsdata`, `skiptime`, `display_order`, `cat_status`, `deleted_status`, `inserted_date`) VALUES
(1, 1, 'Welcome', '<p>Welcome to our site, Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume .</p>\r\n<figure class=\"table\">\r\n<table style=\"height: 87px;\" width=\"506\">\r\n<tbody>\r\n<tr style=\"height: 29px;\">\r\n<td style=\"width: 108.219px; text-align: justify; height: 29px;\">1</td>\r\n<td style=\"width: 198.219px; height: 29px;\">2</td>\r\n<td style=\"width: 157.219px; height: 29px;\">3</td>\r\n</tr>\r\n<tr style=\"height: 29px;\">\r\n<td style=\"width: 108.219px; height: 29px;\">3</td>\r\n<td style=\"width: 198.219px; height: 29px;\">&nbsp;</td>\r\n<td style=\"width: 157.219px; height: 29px;\">33</td>\r\n</tr>\r\n<tr style=\"height: 29px;\">\r\n<td style=\"width: 108.219px; height: 29px;\">3</td>\r\n<td style=\"width: 198.219px; height: 29px;\">333</td>\r\n<td style=\"width: 157.219px; height: 29px;\">33</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</figure>\r\n<div style=\"text-align: center;\"><br /><iframe src=\"//www.youtube.com/embed/at-Pt0GhJfs?ab_channel=RedFMBangla\" width=\"560\" height=\"314\" allowfullscreen=\"allowfullscreen\"></iframe><br /><!-- pagebreak --><br />gfdfgdfg<br /><br /><br /></div>\r\n<figure class=\"media\"></figure>\r\n<p><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', 3, 1, 1, 0, '2021-02-06 00:51:07'),
(2, 3, 'seminar 3 title', '<section id=\"existing-id\" class=\"my-class\">\n                    <div class=\"container\">\n                        <div class=\"row\">\n						 <div class=\"col-sm-12 ui-resizable\" data-type=\"container-content\"><section data-type=\"component-text\">\n<div class=\"page-header\">\n<h3><b class=\"text-uppercase\">Any heading </b></h3>\n</div>\n</section>\n<div class=\"col-sm-12\" data-type=\"component-blank\">\n                                <section data-type=\"component-text\">\n                                    <div class=\"page-header\">\n                                        <h1><b class=\"text-uppercase\">Heading</b>\n                                        </h1>\n                                \n                                        <p class=\"lead\">\n                                            <em>Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume </em>\n                                        </p>\n                                    </div>\n                                </section>\n\n                            </div></div>\n                    </div>\n                </div></section>', 5, 1, 1, 0, '2021-02-28 13:44:20'),
(3, 1, 'Artitute', '', 0, 1, 1, 0, '2021-01-10 15:21:39'),
(4, 1, 'Stress, anger', 'lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume lorem ipsume<br /><br /><iframe src=\"https://www.youtube.com/embed/57V49dQDUJY\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe><br /><br /><br /><br /><br /><img src=\"/images/blog_3.jpg\" alt=\"\" width=\"690\" height=\"476\" />\r\n<div class=\"row\">\r\n<div class=\"col-md-6\">Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume&nbsp;</div>\r\n<div class=\"col-md-6\"><img class=\"img-responsive\" src=\"/topnotch/contentimages/9b90e870dd86469d9e85dcc2c6041c12.png\" alt=\"\" width=\"422\" height=\"554\" /></div>\r\n</div>', 0, 2, 1, 0, '2020-10-05 02:21:15'),
(5, 1, 'Distraction', '<section id=\"existing-id\" class=\"my-class\">\n                    <div class=\"container\">\n                        <div class=\"row\">\n						 <div class=\"col-sm-12 ui-resizable\" data-type=\"container-content\"><section data-type=\"component-text\">\n<div class=\"page-header\">\n<h1><b class=\"text-uppercase\">Any heading </b></h1>\n</div>\n</section>\n<div class=\"col-sm-12\" data-type=\"component-blank\">\n                                <section data-type=\"component-photo\">\n                                    <div class=\"photo-panel\">\n                                        <img src=\"d1fe6b1f8862e50a59747b20f33062ff.jpg\" style=\"display: inline-block;\" height=\"\" width=\"100%\">\n                                    </div>\n                                </section>\n                            </div><div class=\"col-sm-12\" data-type=\"component-blank\">\n                                <section data-type=\"component-text\">\n                                    <div class=\"page-header\">\n                                        <h1><b class=\"text-uppercase\">Heading</b>\n                                        </h1>\n                                \n                                        <p class=\"lead\">\n                                            <em>Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume </em>\n                                        </p>\n                                    </div>\n                                </section>\n\n                            </div><div data-type=\"component-text\">\n<h1>Heading text 1</h1>\n\n<p>your brand is puma, bata, adidas, nike etc.</p>\n</div>\n<div class=\"row\">\n        <div class=\"col-sm-6 ui-resizable\" data-type=\"container-content\"><div data-type=\"component-photo\">\n                <div class=\"photo-panel\" style=\"text-align: center;\">\n                    <img src=\"snippets/img/cl.jpg\" width=\"100%\" height=\"\" style=\"display: inline-block; height: 334px; width: 334px;\" class=\"img-responsive img-circle\">\n                </div>\n            </div></div>\n        <div class=\"col-sm-6 ui-resizable\" data-type=\"container-content\"><div data-type=\"component-text\">\n<h3>Buy Now</h3>\n\n<p>Footwear has been in use since the earliest human history, archeological finds of complete shoes date back to the Chalcolithic (ca. 5.000 BCE). Some ancient civilizations, such as Egypt and Greece however saw no practical need for footwear due to convenient climatic and landscape situations and used shoes primarily as ornaments and insignia of power. The Romans saw clothing and footwear as unmistakable signs of power and status in society, and most Romans wore footwear, while slaves and peasants remained barefoot. The Middle Ages saw the rise of high-heeled shoes, also associated with power, and the desire to look larger than life, and artwork from that period often depicts bare feet as a symbol of poverty.</p>\n</div>\n</div>\n    </div></div>\n                    </div>\n                </div></section>', 0, 3, 1, 0, '2021-01-10 15:23:09'),
(6, 3, 'Advance courses', '', 20, 2, 1, 0, '2021-04-20 01:29:24'),
(7, 3, 'bootstrap', '<section id=\"existing-id\" class=\"my-class\">\n                    <div class=\"container\">\n                        <div class=\"row\">\n						 <div class=\"col-sm-12 ui-resizable\" data-type=\"container-content\"><section data-type=\"component-text\">\n<div class=\"page-header\">\n<h1><b class=\"text-uppercase\">Any heading </b></h1>\n</div>\n</section>\n<div class=\"col-sm-12\" data-type=\"component-blank\">\n                                <section data-type=\"component-photo\">\n                                    <div class=\"photo-panel\">\n                                        <img src=\"d1fe6b1f8862e50a59747b20f33062ff.jpg\" style=\"display: inline-block;\" height=\"\" width=\"100%\">\n                                    </div>\n                                </section>\n                            </div><div class=\"col-sm-12\" data-type=\"component-blank\">\n                                <section data-type=\"component-text\">\n                                    <div class=\"page-header\">\n                                        <h1><b class=\"text-uppercase\">Heading</b>\n                                        </h1>\n                                \n                                        <p class=\"lead\">\n                                            <em>Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume Lorem ipsume </em>\n                                        </p>\n                                    </div>\n                                </section>\n\n                            </div></div>\n                    </div>\n                </div></section>', 0, 4, 1, 0, '2021-04-19 17:52:56'),
(8, 1, 'bootstrap', '<div class=\"container-fluid\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small></p>\r\n</div>\r\n</div>\r\n</div>', 0, 1, 1, 1, '2020-12-20 13:16:42'),
(9, 1, 'Bootstrap 2', '<div class=\"container-fluid\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12\"><img src=\"https://www.layoutit.com/img/sports-q-c-140-140-3.jpg\" alt=\"Bootstrap Image Preview\" />\r\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small></p>\r\n</div>\r\n</div>\r\n</div>', 0, 2, 1, 1, '2020-12-20 13:39:16'),
(10, 1, 'Bootstrap 2', '<div class=\"container-fluid\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"/topnotch/contentimages/0c696bc555f52306981aaa9fbf8fe1d4.png\" alt=\"Bootstrap Image Preview\" width=\"200\" height=\"109\" /></div>\r\n</div>\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\n<h3>&nbsp;</h3>\r\n<p style=\"margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; direction: ltr; unicode-bidi: embed; word-break: normal;\"><span style=\"font-size: 16.0pt; font-family: Georgia; mso-ascii-font-family: Georgia; mso-fareast-font-family: +mn-ea; mso-bidi-font-family: +mn-cs; color: black; mso-color-index: 1; mso-font-kerning: 12.0pt; language: en-US;\">Welcome to the 1</span><span style=\"font-size: 16.0pt; font-family: Georgia; mso-ascii-font-family: Georgia; mso-fareast-font-family: +mn-ea; mso-bidi-font-family: +mn-cs; color: black; mso-color-index: 1; mso-font-kerning: 12.0pt; language: en-US; vertical-align: super; mso-text-raise: 30%;\">st</span><span style=\"font-size: 16.0pt; font-family: Georgia; mso-ascii-font-family: Georgia; mso-fareast-font-family: +mn-ea; mso-bidi-font-family: +mn-cs; color: black; mso-color-index: 1; mso-font-kerning: 12.0pt; language: en-US;\"> session.<br /><br /></span></p>\r\n<p><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14pt;\"><small><span style=\"font-size: 18.6667px;\">&nbsp;</span></small></span><span style=\"font-size: 16.0pt; font-family: Georgia; mso-ascii-font-family: Georgia; mso-fareast-font-family: +mn-ea; mso-bidi-font-family: +mn-cs; color: black; mso-color-index: 1; mso-font-kerning: 12.0pt; language: en-US;\">Different aspects that contributes to making a good driver will be tackled here including having the proper state of mind before you start to drive, rules/laws in driving, alertness, planning and preparation and everything that will teach you how to be a safe driver.</span></p>\r\n</div>\r\n</div>\r\n</div>', 0, 2, 1, 0, '2020-12-20 14:05:45'),
(11, 1, 'bootsrap 3', 'hello', 0, 2, 1, 1, '2020-12-20 13:40:34'),
(12, 1, 'bootstrap 3 layout', '<section id=\"existing-id\" class=\"my-class\">\n                    <div class=\"container\">\n                        <div class=\"row\">\n						 <div class=\"col-sm-12 ui-resizable\" data-type=\"container-content\"><section data-type=\"component-text\">\n<div class=\"page-header\">\n<h1><b class=\"text-uppercase\">Footware Shop</b></h1>\n</div>\n</section>\n<div class=\"col-sm-12\" data-type=\"component-blank\">\n                                <section data-type=\"component-text\">\n                                    <div class=\"page-header\">\n                                        <h1><b class=\"text-uppercase\">Footware</b>\n                                        </h1>\n                                \n                                        <p class=\"lead\">\n                                            <em>Footwear refers to garments worn on the feet, which originally serves to purpose \n											of protection against adversities of the environment, usually regarding ground textures and \n											temperature. Footwear in the manner of shoes \n											therefore primarily serves the purpose to ease the locomotion and prevent injuries.</em>\n                                        </p>\n                                    </div>\n                                </section>\n\n                            </div></div>\n                    </div>\n                </div></section>', 0, 2, 1, 0, '2021-01-10 06:31:11'),
(13, 2, 'abcd', '<section id=\"existing-id\" class=\"my-class\">\n                    <div class=\"container\">\n                        <div class=\"row\">\n						 <div class=\"col-sm-12 ui-resizable col-lg-12\" data-type=\"container-content\" style=\"\"><section data-type=\"component-text\">\n<div class=\"page-header\">\n<h1><b class=\"text-uppercase\">Footware Shop</b></h1>\n</div>\n</section><div class=\"col-sm-12\" data-type=\"component-blank\">\n                                <section data-type=\"component-text\">\n                                    <div class=\"page-header\">\n                                        <h1><b class=\"text-uppercase\">Footware</b>\n                                        </h1>\n                                \n                                        <p class=\"lead\">\n                                            <em>Footwear refers to garments worn on the feet, which originally serves to purpose \n											of protection against adversities of the environment, usually regarding ground textures and \n											temperature. Footwear in the manner of shoes \n											therefore primarily serves the purpose to ease the locomotion and prevent injuries.</em>\n                                        </p>\n                                    </div>\n                                </section>\n\n                            </div><div data-type=\"component-text\">\n<p>Modern footwear is usually made up of leather or plastic, and rubber. In fact, leather was one of the original materials used for the first versions of a shoe. The soles can be made of rubber or plastic, sometimes having a sheet of metal inside. Roman sandals had sheets of metal on their soles so that it would not bend out of shape.</p>\n</div></div>\n                    </div>\n                </div></section><div class=\"row\">\n        <div class=\"col-sm-4 ui-resizable\" data-type=\"container-content\"><div data-type=\"component-photo\">\n                <div class=\"photo-panel\">\n                    <img src=\"snippets/img/a.jpg\" width=\"100%\" height=\"\" style=\"display: inline-block;\" class=\"img-circle\">\n                </div>\n            </div><div data-type=\"component-text\">\n<h3 style=\"text-align: center;\">Adidas</h3>\n\n<p style=\"text-align: center;\">Adidas AG is a German multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing and accessories. It is the largest sportswear manufacturer in Europe, and the second largest in the world, after Nike.</p>\n</div></div>\n        <div class=\"col-sm-4 ui-resizable\" data-type=\"container-content\"><div data-type=\"component-photo\">\n                <div class=\"photo-panel\">\n                    <img src=\"snippets/img/nk.jpg\" width=\"100%\" height=\"\" style=\"display: inline-block;\" class=\"img-circle\">\n                </div>\n            </div><div data-type=\"component-text\">\n<h3 style=\"text-align: center;\">Nike</h3>\n\n<p style=\"text-align: center;\">NIKE, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon</p>\n</div></div>\n        <div class=\"col-sm-4 ui-resizable\" data-type=\"container-content\"><div data-type=\"component-photo\">\n                <div class=\"photo-panel\">\n                    <img src=\"snippets/img/pm.jpg\" width=\"100%\" height=\"\" style=\"display: inline-block;\" class=\"img-circle\">\n                </div>\n            </div><div data-type=\"component-text\">\n<h3 style=\"text-align: center;\">Puma</h3>\n\n<p style=\"text-align: center;\">Puma SE, branded as Puma, is a German multinational corporation that designs and manufactures athletic and casual footwear, apparel and accessories, which is headquartered in Herzogenaurach, Bavaria, Germany. Puma is the third largest sportswear manufacturer in the world.</p>\n</div></div>\n    </div>', 2, 9, 1, 0, '2021-02-06 00:50:50'),
(14, 1, 'Bhaba', '', 4, 21, 1, 0, '2021-02-06 00:57:46'),
(15, 1, 'Bhaba', '', 4, 21, 1, 0, '2021-02-06 00:57:46'),
(16, 1, 'bhba2', '', 5, 12, 1, 0, '2021-02-06 00:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`id`, `state_name`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
(20, 'Punjab'),
(21, 'Rajasthan'),
(22, 'Sikkim'),
(23, 'Tamil Nadu'),
(24, 'Telangana'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal'),
(29, 'Andaman and Nicobar Island'),
(30, 'Chandigarh'),
(31, 'Dadra and Nagar Haveli and Daman and Diu'),
(32, 'Delhi'),
(33, 'Ladakh'),
(34, 'Lakshadweep'),
(35, 'Jammu and Kashmir'),
(36, 'Puducherry'),

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonial_content`
--

CREATE TABLE `tbl_testimonial_content` (
  `id` int(11) NOT NULL,
  `section_page_title` varchar(200) NOT NULL,
  `banner_name` varchar(100) NOT NULL,
  `banner_alt` longtext NOT NULL,
  `banner_status` int(1) NOT NULL,
  `deleted_status` int(1) NOT NULL DEFAULT '0' COMMENT '1=deleted',
  `inserted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_testimonial_content`
--

INSERT INTO `tbl_testimonial_content` (`id`, `section_page_title`, `banner_name`, `banner_alt`, `banner_status`, `deleted_status`, `inserted_date`) VALUES
(1, 'Bhabasankar', '', 'If Shai Reznik\'s TDD videos don\'t convince you to add automated testing your code, I don\'t know what will.This was the very best explanation of frameworks for brginners that I\'ve ever seen.', 1, 0, '2020-09-28 06:33:59'),
(2, 'Cromption Greves', '', 'If Shai Reznik\'s TDD videos don\'t convince you to add automated testing your code, I don\'t know what will.This was the very best explanation of frameworks for brginners that I\'ve ever seen.', 1, 0, '2020-09-28 06:34:23'),
(3, 'Registration Success Message', '', 'If Shai Reznik\'s TDD videos don\'t convince you to add automated testing your code, I don\'t know what will.This was the very best explanation of frameworks for brginners that I\'ve ever seen.', 0, 0, '2021-02-28 06:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(1, 'sankarbhabawd@gmail.com', '$2y$10$t0J24GEoopF4lYFebHifC..nMTIDqE6.sel7QDZjwldaEPytzB0Ia', 'Bhabasankar Dagar', '9338688163', 1, 0, 0, '2015-07-01 18:56:49', 1, '2019-07-08 18:28:25'),
(2, 'manager@example.com', '$2y$10$quODe6vkNma30rcxbAHbYuKYAZQqUaflBgc4YpV9/90ywd.5Koklm', 'Manager', '9890098901', 2, 1, 1, '2016-12-09 17:49:56', 1, '2021-02-17 21:26:56'),
(3, 'employee@example.com', '$2y$10$Q0ZFHiDzC.2R.38upu3el.iOwdxirxpaGl21vHUOvAn4YWmPdo0Ii', 'Swornali', '9338688163', 2, 0, 1, '2016-12-09 17:50:22', 3, '2021-03-03 06:44:46'),
(9, 'sankarbhaba@gmail.com', '$2y$10$hyg9Eo8mEZ5ZdED6G6K3O.JCDRYOADoroRO9ocwHzwucbaLSWZapm', 'Bhabasankar Dagar', '9338688163', 1, 0, 1, '2021-02-17 21:27:43', 1, '2021-03-03 06:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_menu_access`
--

CREATE TABLE `tbl_user_menu_access` (
  `SLNO` int(11) NOT NULL,
  `USER_ID` varchar(8) DEFAULT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(8) DEFAULT NULL,
  `MENU_ID` varchar(50) NOT NULL,
  `ACTIIVATION_DATE` date NOT NULL,
  `DE_ACTIVATION_DATE` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  `CREATED_BY` varchar(8) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `UPDATED_BY` varchar(8) DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_menu_access`
--

INSERT INTO `tbl_user_menu_access` (`SLNO`, `USER_ID`, `ROLE_ID`, `MODULE_ID`, `MENU_ID`, `ACTIIVATION_DATE`, `DE_ACTIVATION_DATE`, `STATUS`, `CREATED_BY`, `CREATED_DATE`, `UPDATED_BY`, `UPDATED_DATE`) VALUES
(35, NULL, 2, NULL, '8', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:26', NULL, NULL),
(34, NULL, 2, NULL, '7', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:24', NULL, NULL),
(33, NULL, 2, NULL, '6', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:23', NULL, NULL),
(32, NULL, 2, NULL, '5', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:23', NULL, NULL),
(31, NULL, 2, NULL, '4', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:22', NULL, NULL),
(38, NULL, 1, NULL, '17', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:39:25', NULL, NULL),
(29, NULL, 2, NULL, '2', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:20', NULL, NULL),
(30, NULL, 2, NULL, '3', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:22', NULL, NULL),
(36, NULL, 2, NULL, '9', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:35:27', NULL, NULL),
(60, NULL, 1, NULL, '18', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 20:40:54', NULL, NULL),
(43, NULL, 1, NULL, '2', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:46:59', NULL, NULL),
(44, NULL, 1, NULL, '3', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:00', NULL, NULL),
(45, NULL, 1, NULL, '4', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:01', NULL, NULL),
(46, NULL, 1, NULL, '5', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:02', NULL, NULL),
(47, NULL, 1, NULL, '6', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:02', NULL, NULL),
(48, NULL, 1, NULL, '7', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:03', NULL, NULL),
(49, NULL, 1, NULL, '8', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:04', NULL, NULL),
(50, NULL, 1, NULL, '9', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:05', NULL, NULL),
(51, NULL, 1, NULL, '10', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:09', NULL, NULL),
(52, NULL, 1, NULL, '11', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:11', NULL, NULL),
(53, NULL, 1, NULL, '12', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:11', NULL, NULL),
(54, NULL, 1, NULL, '13', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:12', NULL, NULL),
(55, NULL, 1, NULL, '14', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:13', NULL, NULL),
(56, NULL, 1, NULL, '15', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:14', NULL, NULL),
(57, NULL, 1, NULL, '16', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 11:47:15', NULL, NULL),
(59, NULL, 1, NULL, '1', '2021-02-28', NULL, 'A', 'Systemad', '2021-02-28 15:48:23', NULL, NULL),
(61, NULL, 1, NULL, '19', '2021-03-29', NULL, 'A', 'Systemad', '2021-03-29 04:57:45', NULL, NULL),
(62, NULL, 1, NULL, '20', '2021-04-04', NULL, 'A', 'Systemad', '2021-04-04 15:09:52', NULL, NULL),
(63, NULL, 1, NULL, '21', '2021-04-13', NULL, 'A', 'Systemad', '2021-04-13 21:42:25', NULL, NULL),
(64, NULL, 1, NULL, '22', '2021-05-22', NULL, 'A', 'Systemad', '2021-05-22 04:16:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_module_access`
--

CREATE TABLE `tbl_user_module_access` (
  `SLNO` int(11) NOT NULL,
  `USER_ID` varchar(8) NOT NULL,
  `MODULE_ID` varchar(8) NOT NULL,
  `ACTIIVATION_DATE` date NOT NULL,
  `DE_ACTIVATION_DATE` date DEFAULT NULL,
  `STATUS` char(1) NOT NULL,
  `CREATED_BY` varchar(8) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `UPDATED_BY` varchar(8) DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ads_manager`
--
ALTER TABLE `tbl_ads_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bakupdetails`
--
ALTER TABLE `tbl_bakupdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_client_scroll`
--
ALTER TABLE `tbl_client_scroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_coupon_content`
--
ALTER TABLE `tbl_coupon_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_email_smtp_conf`
--
ALTER TABLE `tbl_email_smtp_conf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_email_template_content`
--
ALTER TABLE `tbl_email_template_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_maintenace_mode`
--
ALTER TABLE `tbl_maintenace_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_page_content`
--
ALTER TABLE `tbl_page_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_page_section`
--
ALTER TABLE `tbl_page_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_request`
--
ALTER TABLE `tbl_payment_request`
  ADD PRIMARY KEY (`SL_NO`);

--
-- Indexes for table `tbl_payment_request_status`
--
ALTER TABLE `tbl_payment_request_status`
  ADD PRIMARY KEY (`SL_NO`);

--
-- Indexes for table `tbl_paypal_conf`
--
ALTER TABLE `tbl_paypal_conf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reading_status`
--
ALTER TABLE `tbl_reading_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `tbl_seminar_certificate_details`
--
ALTER TABLE `tbl_seminar_certificate_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_seminar_certificate_details_by_admin`
--
ALTER TABLE `tbl_seminar_certificate_details_by_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_seminar_content`
--
ALTER TABLE `tbl_seminar_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_testimonial_content`
--
ALTER TABLE `tbl_testimonial_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  ADD PRIMARY KEY (`SLNO`);

--
-- Indexes for table `tbl_user_module_access`
--
ALTER TABLE `tbl_user_module_access`
  ADD PRIMARY KEY (`SLNO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_ads_manager`
--
ALTER TABLE `tbl_ads_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_bakupdetails`
--
ALTER TABLE `tbl_bakupdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_client_scroll`
--
ALTER TABLE `tbl_client_scroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_coupon_content`
--
ALTER TABLE `tbl_coupon_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_email_template_content`
--
ALTER TABLE `tbl_email_template_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `tbl_maintenace_mode`
--
ALTER TABLE `tbl_maintenace_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `SLNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_page_content`
--
ALTER TABLE `tbl_page_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_page_section`
--
ALTER TABLE `tbl_page_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_payment_request`
--
ALTER TABLE `tbl_payment_request`
  MODIFY `SL_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_payment_request_status`
--
ALTER TABLE `tbl_payment_request_status`
  MODIFY `SL_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_reading_status`
--
ALTER TABLE `tbl_reading_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_seminar_certificate_details`
--
ALTER TABLE `tbl_seminar_certificate_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_seminar_certificate_details_by_admin`
--
ALTER TABLE `tbl_seminar_certificate_details_by_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_seminar_content`
--
ALTER TABLE `tbl_seminar_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tbl_testimonial_content`
--
ALTER TABLE `tbl_testimonial_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  MODIFY `SLNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `tbl_user_module_access`
--
ALTER TABLE `tbl_user_module_access`
  MODIFY `SLNO` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
