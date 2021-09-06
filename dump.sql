-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th9 04, 2021 lúc 09:57 AM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dump`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `biolinks_blocks`
--

DROP TABLE IF EXISTS `biolinks_blocks`;
CREATE TABLE IF NOT EXISTS `biolinks_blocks` (
  `biolink_block_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `location_url` varchar(512) DEFAULT NULL,
  `clicks` int(11) NOT NULL DEFAULT '0',
  `settings` text,
  `order` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`biolink_block_id`),
  KEY `user_id` (`user_id`),
  KEY `links_type_index` (`type`),
  KEY `links_links_link_id_fk` (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `biolinks_blocks`
--

INSERT INTO `biolinks_blocks` (`biolink_block_id`, `user_id`, `link_id`, `type`, `location_url`, `clicks`, `settings`, `order`, `start_date`, `end_date`, `is_enabled`, `datetime`) VALUES
(63, 2, 25, 'youtube', 'https://www.youtube.com/watch?v=uAXpEmTZhfA', 0, '[]', 0, NULL, NULL, 1, '2021-08-31 01:48:02'),
(64, 2, 25, 'youtube', 'https://www.youtube.com/watch?v=v9JulN7LrIc', 0, '[]', 0, NULL, NULL, 1, '2021-08-31 01:48:22'),
(191, 3, 123, 'youtube', 'https://www.youtube.com/watch?v=uAXpEmTZhfA', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 08:49:03'),
(192, 3, 123, 'youtube', 'https://www.youtube.com/watch?v=v9JulN7LrIc', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 08:49:03'),
(195, 3, 125, 'youtube', 'https://www.youtube.com/watch?v=uAXpEmTZhfA', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 08:52:45'),
(196, 3, 125, 'youtube', 'https://www.youtube.com/watch?v=v9JulN7LrIc', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 08:52:45'),
(201, 3, 128, 'youtube', 'https://www.youtube.com/watch?v=uAXpEmTZhfA', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 09:02:39'),
(202, 3, 128, 'youtube', 'https://www.youtube.com/watch?v=v9JulN7LrIc', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 09:02:39'),
(203, 2, 129, 'link', 'http://localhost/package/product/', 0, '{\"name\":\"L\\u00ea Li\\u00eam\",\"text_color\":\"black\",\"background_color\":\"white\",\"outline\":false,\"border_radius\":\"rounded\",\"animation\":false,\"animation_runs\":\"repeat-1\",\"icon\":\"\",\"image\":\"\"}', 0, NULL, NULL, 1, '2021-09-04 09:08:48'),
(206, 2, 132, 'youtube', 'https://www.youtube.com/watch?v=uAXpEmTZhfA', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 09:12:14'),
(207, 2, 132, 'youtube', 'https://www.youtube.com/watch?v=v9JulN7LrIc', 0, '[]', 0, NULL, NULL, 1, '2021-09-04 09:12:14'),
(208, 3, 135, 'link', 'http://localhost/package/product/', 0, '{\"name\":\"Lu00ea Liu00eam\",\"text_color\":\"black\",\"background_color\":\"white\",\"outline\":false,\"border_radius\":\"rounded\",\"animation\":false,\"animation_runs\":\"repeat-1\",\"icon\":\"\",\"image\":\"\"}', 0, NULL, NULL, 1, '2021-09-04 09:25:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `domains`
--

DROP TABLE IF EXISTS `domains`;
CREATE TABLE IF NOT EXISTS `domains` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `scheme` varchar(8) NOT NULL DEFAULT '',
  `host` varchar(256) NOT NULL DEFAULT '',
  `custom_index_url` varchar(256) DEFAULT NULL,
  `custom_not_found_url` varchar(256) DEFAULT NULL,
  `type` tinyint(11) DEFAULT '1',
  `is_enabled` tinyint(4) DEFAULT '0',
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`domain_id`),
  KEY `user_id` (`user_id`),
  KEY `host` (`host`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `biolink_id` int(11) DEFAULT NULL,
  `domain_id` int(11) DEFAULT '0',
  `pixels_ids` text,
  `type` varchar(32) NOT NULL DEFAULT '',
  `subtype` varchar(32) DEFAULT NULL,
  `url` varchar(256) NOT NULL DEFAULT '',
  `location_url` varchar(512) DEFAULT NULL,
  `clicks` int(11) NOT NULL DEFAULT '0',
  `settings` text,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  KEY `url` (`url`),
  KEY `links_subtype_index` (`subtype`),
  KEY `links_type_index` (`type`),
  KEY `links_links_link_id_fk` (`biolink_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `links`
--

INSERT INTO `links` (`link_id`, `project_id`, `user_id`, `biolink_id`, `domain_id`, `pixels_ids`, `type`, `subtype`, `url`, `location_url`, `clicks`, `settings`, `start_date`, `end_date`, `is_enabled`, `datetime`) VALUES
(25, 4, 2, NULL, 0, '[]', 'biolink', NULL, 'https-gumiviet.com-vi-trang-chu', NULL, 0, '{\"title\":\"ABC\",\"description\":\"\",\"display_verified\":false,\"image\":\"a36c8b70e8761467f80573bf76940268.jpg\",\"background_type\":\"image\",\"background\":\"d7b5400e355e71d39961552b605e205f.jpg\",\"text_color\":\"#fff\",\"socials_color\":\"#fff\",\"display_branding\":true,\"branding\":{\"name\":\"\",\"url\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"socials\":{\"email\":\"\",\"tel\":\"\",\"telegram\":\"\",\"whatsapp\":\"\",\"facebook\":\"\",\"facebook-messenger\":\"\",\"instagram\":\"\",\"twitter\":\"\",\"tiktok\":\"\",\"youtube\":\"\",\"soundcloud\":\"\",\"linkedin\":\"\",\"spotify\":\"\",\"pinterest\":\"\"},\"font\":\"lato\",\"password\":null,\"sensitive_content\":false,\"leap_link\":\"\"}', NULL, NULL, 1, '2021-08-31 01:09:20'),
(123, 4, 3, NULL, 0, NULL, 'biolink', NULL, 'https-gumiviet.com-vi-trang-chu', NULL, 0, '{\"title\":\"ABC\",\"description\":\"\",\"display_verified\":false,\"image\":\"a36c8b70e8761467f80573bf76940268.jpg\",\"background_type\":\"image\",\"background\":\"d7b5400e355e71d39961552b605e205f.jpg\",\"text_color\":\"#fff\",\"socials_color\":\"#fff\",\"display_branding\":true,\"branding\":{\"name\":\"\",\"url\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"socials\":{\"email\":\"\",\"tel\":\"\",\"telegram\":\"\",\"whatsapp\":\"\",\"facebook\":\"\",\"facebook-messenger\":\"\",\"instagram\":\"\",\"twitter\":\"\",\"tiktok\":\"\",\"youtube\":\"\",\"soundcloud\":\"\",\"linkedin\":\"\",\"spotify\":\"\",\"pinterest\":\"\"},\"font\":\"lato\",\"password\":null,\"sensitive_content\":false,\"leap_link\":\"\"}', NULL, NULL, 1, '2021-09-04 08:49:03'),
(125, 4, 3, NULL, 0, NULL, 'biolink', NULL, 'https-gumiviet.com-vi-trang-chu', NULL, 0, '{\"title\":\"ABC\",\"description\":\"\",\"display_verified\":false,\"image\":\"a36c8b70e8761467f80573bf76940268.jpg\",\"background_type\":\"image\",\"background\":\"d7b5400e355e71d39961552b605e205f.jpg\",\"text_color\":\"#fff\",\"socials_color\":\"#fff\",\"display_branding\":true,\"branding\":{\"name\":\"\",\"url\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"socials\":{\"email\":\"\",\"tel\":\"\",\"telegram\":\"\",\"whatsapp\":\"\",\"facebook\":\"\",\"facebook-messenger\":\"\",\"instagram\":\"\",\"twitter\":\"\",\"tiktok\":\"\",\"youtube\":\"\",\"soundcloud\":\"\",\"linkedin\":\"\",\"spotify\":\"\",\"pinterest\":\"\"},\"font\":\"lato\",\"password\":null,\"sensitive_content\":false,\"leap_link\":\"\"}', NULL, NULL, 1, '2021-09-04 08:52:45'),
(128, 4, 3, NULL, 0, NULL, 'biolink', NULL, 'https-gumiviet.com-vi-trang-chu', NULL, 0, '{\"title\":\"ABC\",\"description\":\"\",\"display_verified\":false,\"image\":\"a36c8b70e8761467f80573bf76940268.jpg\",\"background_type\":\"image\",\"background\":\"d7b5400e355e71d39961552b605e205f.jpg\",\"text_color\":\"#fff\",\"socials_color\":\"#fff\",\"display_branding\":true,\"branding\":{\"name\":\"\",\"url\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"socials\":{\"email\":\"\",\"tel\":\"\",\"telegram\":\"\",\"whatsapp\":\"\",\"facebook\":\"\",\"facebook-messenger\":\"\",\"instagram\":\"\",\"twitter\":\"\",\"tiktok\":\"\",\"youtube\":\"\",\"soundcloud\":\"\",\"linkedin\":\"\",\"spotify\":\"\",\"pinterest\":\"\"},\"font\":\"lato\",\"password\":null,\"sensitive_content\":false,\"leap_link\":\"\"}', NULL, NULL, 1, '2021-09-04 09:02:39'),
(129, NULL, 2, NULL, 0, NULL, 'biolink', NULL, 'https-atplink.com-link-8206-sample-interface', NULL, 0, '{\"title\":\"https-atplink.com-link-8206-sample-interface\",\"description\":null,\"display_verified\":false,\"image\":\"\",\"background_type\":\"preset\",\"background\":\"one\",\"text_color\":\"white\",\"socials_color\":\"white\",\"display_branding\":true,\"branding\":{\"url\":\"\",\"name\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"socials\":[],\"font\":null,\"password\":null,\"sensitive_content\":false,\"leap_link\":null}', NULL, NULL, 1, '2021-09-04 09:08:48'),
(132, 4, 2, NULL, 0, NULL, 'biolink', NULL, 'https-gumiviet.com-vi-trang-chu', NULL, 0, '{\"title\":\"ABC\",\"description\":\"\",\"display_verified\":false,\"image\":\"a36c8b70e8761467f80573bf76940268.jpg\",\"background_type\":\"image\",\"background\":\"d7b5400e355e71d39961552b605e205f.jpg\",\"text_color\":\"#fff\",\"socials_color\":\"#fff\",\"display_branding\":true,\"branding\":{\"name\":\"\",\"url\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"socials\":{\"email\":\"\",\"tel\":\"\",\"telegram\":\"\",\"whatsapp\":\"\",\"facebook\":\"\",\"facebook-messenger\":\"\",\"instagram\":\"\",\"twitter\":\"\",\"tiktok\":\"\",\"youtube\":\"\",\"soundcloud\":\"\",\"linkedin\":\"\",\"spotify\":\"\",\"pinterest\":\"\"},\"font\":\"lato\",\"password\":null,\"sensitive_content\":false,\"leap_link\":\"\"}', NULL, NULL, 1, '2021-09-04 09:12:14'),
(135, NULL, 3, NULL, 0, NULL, 'biolink', NULL, 'https-atplink.com-link-8206-sample-interface', NULL, 0, '{\"title\":\"https-atplink.com-link-8206-sample-interface\",\"description\":null,\"display_verified\":false,\"image\":\"\",\"background_type\":\"preset\",\"background\":\"one\",\"text_color\":\"white\",\"socials_color\":\"white\",\"display_branding\":true,\"branding\":{\"url\":\"\",\"name\":\"\"},\"seo\":{\"block\":false,\"title\":\"\",\"meta_description\":\"\",\"image\":\"\"},\"utm\":{\"medium\":\"\",\"source\":\"\"},\"socials\":[],\"font\":null,\"password\":null,\"sensitive_content\":false,\"leap_link\":null}', NULL, NULL, 1, '2021-09-04 09:25:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `pages_category_id` int(11) DEFAULT NULL,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `position` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order` int(11) DEFAULT '0',
  `total_views` int(11) DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `pages_pages_category_id_index` (`pages_category_id`),
  KEY `pages_url_index` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`page_id`, `pages_category_id`, `url`, `title`, `description`, `content`, `type`, `position`, `order`, `total_views`, `date`, `last_date`) VALUES
(1, NULL, 'https://altumcode.com/', 'Software by AltumCode', '', '', 'external', 'bottom', 1, 0, '2021-08-11 15:06:37', '2021-08-11 15:06:37'),
(2, NULL, 'https://altumco.de/phpbiolinks-buy', 'Built with phpBiolinks', '', '', 'external', 'bottom', 0, 0, '2021-08-11 15:06:37', '2021-08-11 15:06:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages_categories`
--

DROP TABLE IF EXISTS `pages_categories`;
CREATE TABLE IF NOT EXISTS `pages_categories` (
  `pages_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `icon` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_category_id`),
  KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pixels`
--

DROP TABLE IF EXISTS `pixels`;
CREATE TABLE IF NOT EXISTS `pixels` (
  `pixel_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `pixel` varchar(64) NOT NULL,
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`pixel_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL DEFAULT '',
  `monthly_price` float DEFAULT NULL,
  `annual_price` float DEFAULT NULL,
  `lifetime_price` float DEFAULT NULL,
  `settings` text NOT NULL,
  `taxes_ids` text,
  `status` tinyint(4) NOT NULL,
  `order` int(10) UNSIGNED DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `color` varchar(16) DEFAULT '#000',
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `projects`
--

INSERT INTO `projects` (`project_id`, `user_id`, `name`, `color`, `last_datetime`, `datetime`) VALUES
(1, 2, 'Thực phẩm', '#000000', NULL, '2021-08-23 03:31:48'),
(2, 2, 'Kinh tế', '#000000', '2021-08-28 06:53:58', '2021-08-28 06:53:40'),
(3, 2, 'Giáo dục', '#000000', NULL, '2021-08-28 06:53:44'),
(4, 2, 'Phim ảnh', '#000000', NULL, '2021-08-28 07:33:51'),
(5, 2, 'Nhạc', '#000000', NULL, '2021-08-28 07:33:58'),
(6, 2, 'Đồ ăn', '#000000', NULL, '2021-08-28 07:34:06'),
(7, 2, 'Thể thao', '#000000', NULL, '2021-08-28 07:34:12'),
(8, 2, 'Thức uống', '#000000', NULL, '2021-08-28 07:34:24'),
(9, 2, 'Quần áo', '#000000', NULL, '2021-08-28 07:34:28'),
(10, 3, 'aaa', '#000000', NULL, '2021-08-30 00:37:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'ads', '{\"header\":\"\",\"footer\":\"\",\"header_biolink\":\"\",\"footer_biolink\":\"\"}'),
(2, 'captcha', '{\"type\":\"basic\",\"recaptcha_public_key\":\"\",\"recaptcha_private_key\":\"\",\"login_is_enabled\":0,\"register_is_enabled\":0,\"lost_password_is_enabled\":0,\"resend_activation_is_enabled\":0}'),
(3, 'cron', '{\"key\":\"a3e8292ec897748752113bab23dc7022\"}'),
(4, 'default_language', 'english'),
(5, 'default_theme_style', 'light'),
(6, 'email_confirmation', '0'),
(7, 'register_is_enabled', '1'),
(8, 'email_notifications', '{\"emails\":\"\",\"new_user\":\"0\",\"new_payment\":\"0\"}'),
(9, 'facebook', '{\"is_enabled\":\"0\",\"app_id\":\"\",\"app_secret\":\"\"}'),
(10, 'favicon', ''),
(11, 'logo', ''),
(12, 'opengraph', ''),
(13, 'plan_custom', '{\"plan_id\":\"custom\",\"name\":\"Custom\",\"status\":1}'),
(14, 'plan_free', '{\"plan_id\":\"free\",\"name\":\"Free\",\"days\":null,\"status\":1,\"settings\":{\"additional_global_domains\":true,\"custom_url\":true,\"deep_links\":true,\"no_ads\":true,\"removable_branding\":true,\"custom_branding\":true,\"custom_colored_links\":true,\"statistics\":true,\"custom_backgrounds\":true,\"verified\":true,\"temporary_url_is_enabled\":true,\"seo\":true,\"utm\":true,\"socials\":true,\"fonts\":true,\"password\":true,\"sensitive_content\":true,\"leap_link\":true,\"api_is_enabled\":true,\"affiliate_is_enabled\":true,\"projects_limit\":10,\"pixels_limit\":10,\"biolinks_limit\":15,\"links_limit\":25,\"domains_limit\":1,\"enabled_biolink_blocks\":{\"link\":true,\"text\":true,\"image\":true,\"mail\":true,\"soundcloud\":true,\"spotify\":true,\"youtube\":true,\"twitch\":true,\"vimeo\":true,\"tiktok\":true,\"applemusic\":true,\"tidal\":true,\"anchor\":true,\"twitter_tweet\":true,\"instagram_media\":true,\"rss_feed\":true,\"custom_html\":true,\"vcard\":true,\"image_grid\":true,\"divider\":true}}}'),
(15, 'plan_trial', '{\"plan_id\":\"trial\",\"name\":\"Trial\",\"days\":7,\"status\":1,\"settings\":{\"additional_global_domains\":true,\"custom_url\":true,\"deep_links\":true,\"no_ads\":true,\"removable_branding\":true,\"custom_branding\":true,\"custom_colored_links\":true,\"statistics\":true,\"custom_backgrounds\":true,\"verified\":true,\"temporary_url_is_enabled\":true,\"seo\":true,\"utm\":true,\"socials\":true,\"fonts\":true,\"password\":true,\"sensitive_content\":true,\"leap_link\":true,\"api_is_enabled\":true,\"affiliate_is_enabled\":true,\"projects_limit\":25,\"pixels_limit\":25,\"biolinks_limit\":25,\"links_limit\":100,\"domains_limit\":5,\"enabled_biolink_blocks\":{\"link\":true,\"text\":true,\"image\":true,\"mail\":true,\"soundcloud\":true,\"spotify\":true,\"youtube\":true,\"twitch\":true,\"vimeo\":true,\"tiktok\":true,\"applemusic\":true,\"tidal\":true,\"anchor\":true,\"twitter_tweet\":true,\"instagram_media\":true,\"rss_feed\":true,\"custom_html\":true,\"vcard\":true,\"image_grid\":true,\"divider\":true}}}'),
(16, 'payment', '{\"is_enabled\":\"0\",\"type\":\"both\",\"brand_name\":\"phpBiolinks\",\"currency\":\"USD\", \"codes_is_enabled\": false}'),
(17, 'paypal', '{\"is_enabled\":\"0\",\"mode\":\"sandbox\",\"client_id\":\"\",\"secret\":\"\"}'),
(18, 'stripe', '{\"is_enabled\":\"0\",\"publishable_key\":\"\",\"secret_key\":\"\",\"webhook_secret\":\"\"}'),
(19, 'offline_payment', '{\"is_enabled\":\"0\",\"instructions\":\"Your offline payment instructions go here..\"}'),
(20, 'smtp', '{\"host\":\"\",\"from\":\"\",\"from_name\":\"\",\"encryption\":\"tls\",\"port\":\"587\",\"auth\":\"0\",\"username\":\"\",\"password\":\"\"}'),
(21, 'custom', '{\"head_js\":\"\",\"head_css\":\"\"}'),
(22, 'socials', '{\"facebook\":\"\",\"instagram\":\"\",\"twitter\":\"\",\"youtube\":\"\"}'),
(23, 'default_timezone', 'UTC'),
(24, 'title', 'phpBiolinks.com'),
(25, 'privacy_policy_url', ''),
(26, 'terms_and_conditions_url', ''),
(27, 'index_url', ''),
(28, 'announcements', '{\"id\":\"\",\"content\":\"\",\"show_logged_in\":\"\",\"show_logged_out\":\"\"}'),
(29, 'business', '{\"invoice_is_enabled\":\"0\",\"name\":\"\",\"address\":\"\",\"city\":\"\",\"county\":\"\",\"zip\":\"\",\"country\":\"\",\"email\":\"\",\"phone\":\"\",\"tax_type\":\"\",\"tax_id\":\"\",\"custom_key_one\":\"\",\"custom_value_one\":\"\",\"custom_key_two\":\"\",\"custom_value_two\":\"\"}'),
(30, 'webhooks', '{\"user_new\": \"\", \"user_delete\": \"\"}'),
(31, 'links', '{\"branding\":\"by AltumCode\",\"shortener_is_enabled\":\"1\",\"domains_is_enabled\":\"1\",\"main_domain_is_enabled\":\"1\",\"blacklisted_domains\":\"\",\"blacklisted_keywords\":\"\",\"google_safe_browsing_is_enabled\":\"\",\"google_safe_browsing_api_key\":\"\",\"avatar_size_limit\":\"2\",\"background_size_limit\":\"2\",\"thumbnail_image_size_limit\":\"2\",\"image_size_limit\":\"2\"}'),
(32, 'license', '{\"license\":\"\",\"type\":\"\"}'),
(33, 'product_info', '{\"version\":\"9.3.0\", \"code\":\"930\"}'),
(34, 'aaa', 'bbb'),
(36, 'bbb', 'ccc'),
(39, 'sss', 'aaa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `track_links`
--

DROP TABLE IF EXISTS `track_links`;
CREATE TABLE IF NOT EXISTS `track_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `biolink_block_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `city_name` varchar(128) DEFAULT NULL,
  `os_name` varchar(16) DEFAULT NULL,
  `browser_name` varchar(32) DEFAULT NULL,
  `referrer_host` varchar(256) DEFAULT NULL,
  `referrer_path` varchar(1024) DEFAULT NULL,
  `device_type` varchar(16) DEFAULT NULL,
  `browser_language` varchar(16) DEFAULT NULL,
  `utm_source` varchar(128) DEFAULT NULL,
  `utm_medium` varchar(128) DEFAULT NULL,
  `utm_campaign` varchar(128) DEFAULT NULL,
  `is_unique` tinyint(4) DEFAULT '0',
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_id` (`link_id`),
  KEY `track_links_date_index` (`datetime`),
  KEY `track_links_project_id_index` (`project_id`),
  KEY `track_links_users_user_id_fk` (`user_id`),
  KEY `track_links_biolink_block_id_index` (`biolink_block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `track_links`
--

INSERT INTO `track_links` (`id`, `user_id`, `link_id`, `biolink_block_id`, `project_id`, `country_code`, `city_name`, `os_name`, `browser_name`, `referrer_host`, `referrer_path`, `device_type`, `browser_language`, `utm_source`, `utm_medium`, `utm_campaign`, `is_unique`, `datetime`) VALUES
(49, 2, NULL, 46, NULL, NULL, NULL, 'Windows', 'Chrome', 'localhost', '/package/product/wdxwawcxa', 'desktop', 'vi', NULL, NULL, NULL, 1, '2021-08-30 13:14:33'),
(51, 2, NULL, 35, NULL, NULL, NULL, 'Windows', 'Chrome', 'localhost', '/package/product/https-gumiviet.com-vi-trang-c', 'desktop', 'vi', NULL, NULL, NULL, 1, '2021-08-30 13:16:37'),
(61, 2, NULL, 3, NULL, NULL, NULL, 'Windows', 'Chrome', 'localhost', '/package/product/https-www.facebook.com-profile.php-id-100016141177983', 'desktop', 'vi', NULL, NULL, NULL, 1, '2021-08-30 16:31:49'),
(63, 2, NULL, 10, NULL, NULL, NULL, 'Windows', 'Chrome', 'localhost', '/package/product/HwbDex2H8A', 'desktop', 'vi', NULL, NULL, NULL, 0, '2021-08-30 16:31:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `api_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `twofa_secret` varchar(16) DEFAULT NULL,
  `one_time_login_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending_email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_activation_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lost_password_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `plan_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plan_expiration_date` datetime DEFAULT NULL,
  `plan_settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `plan_trial_done` tinyint(4) DEFAULT '0',
  `plan_expiry_reminder` tinyint(4) DEFAULT '0',
  `payment_subscription_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `referral_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by_has_converted` tinyint(4) DEFAULT '0',
  `language` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'english',
  `timezone` varchar(32) DEFAULT 'UTC',
  `date` datetime DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_user_agent` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `total_logins` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `plan_id` (`plan_id`),
  KEY `api_key` (`api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `billing`, `api_key`, `token_code`, `twofa_secret`, `one_time_login_code`, `pending_email`, `email_activation_code`, `lost_password_code`, `facebook_id`, `type`, `active`, `plan_id`, `plan_expiration_date`, `plan_settings`, `plan_trial_done`, `plan_expiry_reminder`, `payment_subscription_id`, `referral_key`, `referred_by`, `referred_by_has_converted`, `language`, `timezone`, `date`, `ip`, `country`, `last_activity`, `last_user_agent`, `total_logins`) VALUES
(1, 'admin', '$2y$10$uFNO0pQKEHSFcus1zSFlveiPCB3EvG9ZlES7XKgJFTAl5JbRGFCWy', 'AltumCode', NULL, '728d948f6ea5d1828154376a9cc4afb0', '', NULL, NULL, NULL, '', '', NULL, 1, 1, 'custom', '2030-01-01 12:00:00', '{\"additional_global_domains\":true,\"custom_url\":true,\"deep_links\":true,\"no_ads\":true,\"removable_branding\":true,\"custom_branding\":true,\"custom_colored_links\":true,\"statistics\":true,\"custom_backgrounds\":true,\"verified\":true,\"temporary_url_is_enabled\":true,\"seo\":true,\"utm\":true,\"socials\":true,\"fonts\":true,\"password\":true,\"sensitive_content\":true,\"leap_link\":true,\"api_is_enabled\":true,\"affiliate_is_enabled\":true,\"projects_limit\":-1,\"pixels_limit\":-1,\"biolinks_limit\":-1,\"links_limit\":-1,\"domains_limit\":-1,\"enabled_biolink_blocks\":{\"link\":true,\"text\":true,\"image\":true,\"mail\":true,\"soundcloud\":true,\"spotify\":true,\"youtube\":true,\"twitch\":true,\"vimeo\":true,\"tiktok\":true,\"applemusic\":true,\"tidal\":true,\"anchor\":true,\"twitter_tweet\":true,\"instagram_media\":true,\"rss_feed\":true,\"custom_html\":true,\"vcard\":true,\"image_grid\":true,\"divider\":true}}', 1, 0, '', '59f2f5c8c6798e66481a337ae85c8503', NULL, 0, 'english', 'UTC', '2021-08-11 15:06:35', '', NULL, '2021-08-11 15:06:35', '', 0),
(2, 'admin@admin.com', '$2y$10$0biqWCHtYxPG4OANHd66nOWZO6.SSnhT/fpPLX/3NmTe0McwPcn/6', 'Lê Liêm', '{\"type\":\"personal\",\"name\":\"\",\"address\":\"\",\"city\":\"\",\"county\":\"\",\"zip\":\"\",\"country\":\"\",\"phone\":\"\",\"tax_id\":\"\"}', '10bc79281e3d6c69f649590cde688a49', '', NULL, NULL, NULL, '13cefe2869419fed02f3c91997632b51', NULL, NULL, 1, 1, 'free', '2021-08-11 08:11:51', '{\"additional_global_domains\":true,\"custom_url\":true,\"deep_links\":true,\"no_ads\":true,\"removable_branding\":true,\"custom_branding\":true,\"custom_colored_links\":true,\"statistics\":true,\"custom_backgrounds\":true,\"verified\":true,\"temporary_url_is_enabled\":true,\"seo\":true,\"utm\":true,\"socials\":true,\"fonts\":true,\"password\":true,\"sensitive_content\":true,\"leap_link\":true,\"api_is_enabled\":true,\"affiliate_is_enabled\":true,\"projects_limit\":10,\"pixels_limit\":10,\"biolinks_limit\":15,\"links_limit\":25,\"domains_limit\":1,\"enabled_biolink_blocks\":{\"link\":true,\"text\":true,\"image\":true,\"mail\":true,\"soundcloud\":true,\"spotify\":true,\"youtube\":true,\"twitch\":true,\"vimeo\":true,\"tiktok\":true,\"applemusic\":true,\"tidal\":true,\"anchor\":true,\"twitter_tweet\":true,\"instagram_media\":true,\"rss_feed\":true,\"custom_html\":true,\"vcard\":true,\"image_grid\":true,\"divider\":true}}', 0, 0, NULL, 'a117d346ec77efe3ede2c8c3550d6023', NULL, 0, 'english', 'UTC', '2021-08-11 08:11:51', '::1', NULL, '2021-09-04 09:16:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 74),
(3, 'admin@abc.com', '$2y$10$XOMrAter0YxQYDZn9hKXh.jUKEySSXG/7yDzUGCgsqFDw5m/uZUJW', 'abc', '{\"type\":\"personal\",\"name\":\"\",\"address\":\"\",\"city\":\"\",\"county\":\"\",\"zip\":\"\",\"country\":\"\",\"phone\":\"\",\"tax_id\":\"\"}', '5ddb944afa9a1061dd715ed84d3d9721', '', NULL, NULL, NULL, '885555d5fc2eb4d9b332906bbe0a2c57', NULL, NULL, 0, 1, 'free', '2021-08-30 00:37:13', '{\"additional_global_domains\":true,\"custom_url\":true,\"deep_links\":true,\"no_ads\":true,\"removable_branding\":true,\"custom_branding\":true,\"custom_colored_links\":true,\"statistics\":true,\"custom_backgrounds\":true,\"verified\":true,\"temporary_url_is_enabled\":true,\"seo\":true,\"utm\":true,\"socials\":true,\"fonts\":true,\"password\":true,\"sensitive_content\":true,\"leap_link\":true,\"api_is_enabled\":true,\"affiliate_is_enabled\":true,\"projects_limit\":10,\"pixels_limit\":10,\"biolinks_limit\":15,\"links_limit\":25,\"domains_limit\":1,\"enabled_biolink_blocks\":{\"link\":true,\"text\":true,\"image\":true,\"mail\":true,\"soundcloud\":true,\"spotify\":true,\"youtube\":true,\"twitch\":true,\"vimeo\":true,\"tiktok\":true,\"applemusic\":true,\"tidal\":true,\"anchor\":true,\"twitter_tweet\":true,\"instagram_media\":true,\"rss_feed\":true,\"custom_html\":true,\"vcard\":true,\"image_grid\":true,\"divider\":true}}', 0, 0, NULL, '63a902caea5c6f4e4dbdebd5f68181be', NULL, 0, 'english', 'UTC', '2021-08-30 00:37:13', '::1', NULL, '2021-09-04 09:46:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_logs`
--

DROP TABLE IF EXISTS `users_logs`;
CREATE TABLE IF NOT EXISTS `users_logs` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `public` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `users_logs_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users_logs`
--

INSERT INTO `users_logs` (`id`, `user_id`, `type`, `date`, `ip`, `public`) VALUES
(1, 1, 'login.wrong_password', '2021-08-11 08:10:41', '::1', 1),
(2, 1, 'login.wrong_password', '2021-08-11 08:10:46', '::1', 1),
(3, 1, 'login.wrong_password', '2021-08-11 08:10:55', '::1', 1),
(4, 2, 'register.success', '2021-08-11 08:11:51', '::1', 1),
(5, 2, 'login.success', '2021-08-11 08:11:51', '::1', 1),
(6, 2, 'login.success', '2021-08-11 08:16:03', '::1', 1),
(7, 2, 'login.success', '2021-08-11 09:52:28', '::1', 1),
(8, 2, 'login.success', '2021-08-12 08:12:16', '::1', 1),
(9, 2, 'login.success', '2021-08-14 06:07:07', '::1', 1),
(10, 2, 'login.success', '2021-08-14 06:41:30', '::1', 1),
(11, 2, 'login.success', '2021-08-14 07:20:48', '::1', 1),
(12, 2, 'login.success', '2021-08-14 07:23:01', '::1', 1),
(13, 2, 'login.success', '2021-08-14 07:32:48', '::1', 1),
(14, 2, 'login.success', '2021-08-14 07:33:41', '::1', 1),
(15, 2, 'login.success', '2021-08-16 01:49:59', '::1', 1),
(16, 2, 'login.success', '2021-08-16 01:59:18', '::1', 1),
(17, 2, 'login.success', '2021-08-16 03:25:14', '::1', 1),
(18, 2, 'login.success', '2021-08-16 03:28:23', '::1', 1),
(19, 2, 'login.success', '2021-08-17 01:36:30', '::1', 1),
(20, 2, 'login.success', '2021-08-17 07:29:35', '::1', 1),
(21, 2, 'login.success', '2021-08-17 07:35:57', '::1', 1),
(22, 2, 'login.success', '2021-08-17 07:36:57', '::1', 1),
(23, 2, 'login.success', '2021-08-17 07:40:09', '::1', 1),
(24, 2, 'login.success', '2021-08-18 01:51:04', '::1', 1),
(25, 2, 'login.success', '2021-08-18 08:33:56', '::1', 1),
(26, 2, 'login.success', '2021-08-18 08:34:57', '::1', 1),
(27, 2, 'login.success', '2021-08-18 09:01:47', '::1', 1),
(28, 2, 'login.success', '2021-08-18 09:02:13', '::1', 1),
(29, 2, 'login.success', '2021-08-18 09:57:23', '::1', 1),
(30, 2, 'login.success', '2021-08-18 10:20:51', '::1', 1),
(31, 2, 'login.success', '2021-08-19 00:56:47', '::1', 1),
(32, 2, 'login.success', '2021-08-19 00:59:08', '::1', 1),
(33, 2, 'login.success', '2021-08-19 07:55:08', '::1', 1),
(34, 2, 'login.success', '2021-08-19 09:20:09', '::1', 1),
(35, 2, 'login.success', '2021-08-20 01:13:35', '::1', 1),
(36, 2, 'login.success', '2021-08-20 01:23:59', '::1', 1),
(37, 2, 'login.success', '2021-08-20 08:12:51', '::1', 1),
(38, 2, 'login.success', '2021-08-20 08:34:03', '::1', 1),
(39, 2, 'login.success', '2021-08-20 09:06:14', '::1', 1),
(40, 2, 'login.success', '2021-08-20 12:56:01', '::1', 1),
(41, 2, 'login.success', '2021-08-21 01:27:39', '::1', 1),
(42, 2, 'login.success', '2021-08-21 12:55:59', '::1', 1),
(43, 2, 'login.success', '2021-08-23 01:25:21', '::1', 1),
(44, 2, 'login.success', '2021-08-23 01:26:24', '::1', 1),
(45, 2, 'login.success', '2021-08-23 03:19:54', '127.0.0.1', 1),
(46, 2, 'login.success', '2021-08-24 02:46:09', '::1', 1),
(47, 2, 'login.success', '2021-08-24 03:26:51', '::1', 1),
(48, 2, 'login.success', '2021-08-24 07:28:02', '::1', 1),
(49, 2, 'login.success', '2021-08-26 01:19:57', '::1', 1),
(50, 2, 'login.success', '2021-08-26 08:43:24', '::1', 1),
(51, 2, 'login.success', '2021-08-26 08:51:57', '::1', 1),
(52, 2, 'login.success', '2021-08-27 02:21:03', '::1', 1),
(53, 2, 'login.success', '2021-08-27 08:22:46', '::1', 1),
(54, 2, 'login.success', '2021-08-27 14:07:49', '::1', 1),
(55, 2, 'login.success', '2021-08-28 02:25:54', '::1', 1),
(56, 2, 'login.success', '2021-08-28 06:35:18', '::1', 1),
(57, 2, 'login.success', '2021-08-28 10:26:41', '::1', 1),
(58, 2, 'login.success', '2021-08-28 14:10:51', '::1', 1),
(59, 2, 'login.success', '2021-08-29 01:51:33', '::1', 1),
(60, 2, 'login.success', '2021-08-29 03:22:22', '::1', 1),
(61, 2, 'login.success', '2021-08-29 03:31:14', '::1', 1),
(62, 2, 'login.success', '2021-08-29 03:58:43', '::1', 1),
(63, 2, 'login.success', '2021-08-29 15:45:58', '::1', 1),
(64, 2, 'login.success', '2021-08-30 00:35:12', '::1', 1),
(65, 3, 'register.success', '2021-08-30 00:37:13', '::1', 1),
(66, 3, 'login.success', '2021-08-30 00:37:13', '::1', 1),
(67, 3, 'login.success', '2021-08-30 00:38:33', '::1', 1),
(68, 3, 'login.success', '2021-08-30 01:14:40', '::1', 1),
(69, 3, 'login.success', '2021-08-30 01:14:52', '::1', 1),
(70, 3, 'login.success', '2021-08-30 01:15:29', '::1', 1),
(71, 2, 'login.success', '2021-08-30 01:15:43', '::1', 1),
(72, 2, 'login.success', '2021-08-30 04:03:20', '::1', 1),
(73, 2, 'login.success', '2021-08-30 08:19:49', '::1', 1),
(74, 2, 'login.success', '2021-08-30 13:13:50', '::1', 1),
(75, 2, 'login.success', '2021-08-30 14:37:57', '::1', 1),
(76, 3, 'login.success', '2021-08-30 14:42:11', '::1', 1),
(77, 2, 'login.success', '2021-08-30 14:44:25', '::1', 1),
(78, 2, 'login.success', '2021-08-30 16:35:51', '::1', 1),
(79, 2, 'login.success', '2021-08-30 16:47:28', '::1', 1),
(80, 2, 'login.success', '2021-08-31 00:59:38', '::1', 1),
(81, 2, 'login.success', '2021-08-31 07:40:31', '::1', 1),
(82, 3, 'login.success', '2021-08-31 08:35:45', '::1', 1),
(83, 3, 'login.success', '2021-09-01 00:52:24', '::1', 1),
(84, 3, 'login.success', '2021-09-03 01:20:46', '::1', 1),
(85, 3, 'login.success', '2021-09-03 01:45:01', '::1', 1),
(86, 3, 'login.success', '2021-09-03 08:58:47', '::1', 1),
(87, 3, 'login.success', '2021-09-03 14:03:58', '::1', 1),
(88, 3, 'login.success', '2021-09-04 00:33:51', '::1', 1),
(89, 2, 'login.success', '2021-09-04 00:36:12', '::1', 1),
(90, 3, 'login.success', '2021-09-04 00:37:19', '::1', 1),
(91, 2, 'login.success', '2021-09-04 01:38:07', '::1', 1),
(92, 3, 'login.success', '2021-09-04 01:39:23', '::1', 1),
(93, 2, 'login.success', '2021-09-04 02:31:49', '::1', 1),
(94, 3, 'login.success', '2021-09-04 02:35:02', '::1', 1),
(95, 3, 'login.success', '2021-09-04 05:59:23', '::1', 1),
(96, 3, 'login.success', '2021-09-04 08:27:44', '::1', 1),
(97, 3, 'login.success', '2021-09-04 09:08:13', '::1', 1),
(98, 2, 'login.success', '2021-09-04 09:08:28', '::1', 1),
(99, 3, 'login.success', '2021-09-04 09:16:26', '::1', 1);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `biolinks_blocks`
--
ALTER TABLE `biolinks_blocks`
  ADD CONSTRAINT `biolinks_blocks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `biolinks_blocks_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `domains`
--
ALTER TABLE `domains`
  ADD CONSTRAINT `domains_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `links_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `links_links_link_id_fk` FOREIGN KEY (`biolink_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_pages_categories_pages_category_id_fk` FOREIGN KEY (`pages_category_id`) REFERENCES `pages_categories` (`pages_category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `pixels`
--
ALTER TABLE `pixels`
  ADD CONSTRAINT `pixels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `track_links`
--
ALTER TABLE `track_links`
  ADD CONSTRAINT `track_links_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_links_links_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `links` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_links_projects_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `track_links_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users_logs`
--
ALTER TABLE `users_logs`
  ADD CONSTRAINT `users_logs_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
