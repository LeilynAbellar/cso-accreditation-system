-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2025 at 05:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cso`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_application`
--

CREATE TABLE `accreditation_application` (
  `application_id` int(11) NOT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `datasheet_org` varchar(255) DEFAULT NULL,
  `datasheet_org_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_lce` varchar(255) DEFAULT NULL,
  `goodstanding_lce_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_mayor` varchar(255) DEFAULT NULL,
  `permit_mayor_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_bir` varchar(255) DEFAULT NULL,
  `permit_bir_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `certificate_reg` varchar(255) DEFAULT NULL,
  `certificate_reg_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_ga` varchar(255) DEFAULT NULL,
  `goodstanding_ga_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `omnibus` varchar(255) DEFAULT NULL,
  `omnibus_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `bio_data` varchar(255) DEFAULT NULL,
  `bio_data_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `articles_of_incorporation` varchar(255) DEFAULT NULL,
  `articles_of_incorporation_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `incumbent_officers` varchar(255) DEFAULT NULL,
  `incumbent_officers_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `accomplishment_reports` varchar(255) DEFAULT NULL,
  `accomplishment_reports_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `disclosure` varchar(255) DEFAULT NULL,
  `disclosure_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `affidavit` varchar(255) DEFAULT NULL,
  `affidavit_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `status` enum('Pending','Accredited','Denied') DEFAULT 'Pending',
  `overall_status` enum('Pending','Accepted','Denied') DEFAULT 'Pending',
  `remarks` text DEFAULT 'No Remarks.',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `schedule` date DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `hardcopy_submission_date` date DEFAULT NULL,
  `datasheet_org_remarks` text DEFAULT NULL,
  `goodstanding_lce_remarks` text DEFAULT NULL,
  `permit_mayor_remarks` text DEFAULT NULL,
  `permit_bir_remarks` text DEFAULT NULL,
  `certificate_reg_remarks` text DEFAULT NULL,
  `goodstanding_ga_remarks` text DEFAULT NULL,
  `omnibus_remarks` text DEFAULT NULL,
  `bio_data_remarks` text DEFAULT NULL,
  `articles_of_incorporation_remarks` text DEFAULT NULL,
  `incumbent_officers_remarks` text DEFAULT NULL,
  `accomplishment_reports_remarks` text DEFAULT NULL,
  `disclosure_remarks` text DEFAULT NULL,
  `affidavit_remarks` text DEFAULT NULL,
  `cso_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `datasheet_org_admin_remarks` text DEFAULT NULL,
  `goodstanding_lce_admin_remarks` text DEFAULT NULL,
  `permit_mayor_admin_remarks` text DEFAULT NULL,
  `permit_bir_admin_remarks` text DEFAULT NULL,
  `certificate_reg_admin_remarks` text DEFAULT NULL,
  `goodstanding_ga_admin_remarks` text DEFAULT NULL,
  `omnibus_admin_remarks` text DEFAULT NULL,
  `bio_data_admin_remarks` text DEFAULT NULL,
  `articles_of_incorporation_admin_remarks` text DEFAULT NULL,
  `incumbent_officers_admin_remarks` text DEFAULT NULL,
  `accomplishment_reports_admin_remarks` text DEFAULT NULL,
  `disclosure_admin_remarks` text DEFAULT NULL,
  `affidavit_admin_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accreditation_application`
--

INSERT INTO `accreditation_application` (`application_id`, `cso_representative_id`, `datasheet_org`, `datasheet_org_status`, `goodstanding_lce`, `goodstanding_lce_status`, `permit_mayor`, `permit_mayor_status`, `permit_bir`, `permit_bir_status`, `certificate_reg`, `certificate_reg_status`, `goodstanding_ga`, `goodstanding_ga_status`, `omnibus`, `omnibus_status`, `bio_data`, `bio_data_status`, `articles_of_incorporation`, `articles_of_incorporation_status`, `incumbent_officers`, `incumbent_officers_status`, `accomplishment_reports`, `accomplishment_reports_status`, `disclosure`, `disclosure_status`, `affidavit`, `affidavit_status`, `status`, `overall_status`, `remarks`, `created_at`, `last_updated`, `schedule`, `status_updated_at`, `hardcopy_submission_date`, `datasheet_org_remarks`, `goodstanding_lce_remarks`, `permit_mayor_remarks`, `permit_bir_remarks`, `certificate_reg_remarks`, `goodstanding_ga_remarks`, `omnibus_remarks`, `bio_data_remarks`, `articles_of_incorporation_remarks`, `incumbent_officers_remarks`, `accomplishment_reports_remarks`, `disclosure_remarks`, `affidavit_remarks`, `cso_status`, `datasheet_org_admin_remarks`, `goodstanding_lce_admin_remarks`, `permit_mayor_admin_remarks`, `permit_bir_admin_remarks`, `certificate_reg_admin_remarks`, `goodstanding_ga_admin_remarks`, `omnibus_admin_remarks`, `bio_data_admin_remarks`, `articles_of_incorporation_admin_remarks`, `incumbent_officers_admin_remarks`, `accomplishment_reports_admin_remarks`, `disclosure_admin_remarks`, `affidavit_admin_remarks`) VALUES
(29, 42, 'uploads/accreditation/42/acomplished_data_sheet_agricoop.pdf', 'Approved', 'uploads/accreditation/42/goodstanding_local_agricoop.pdf', 'Approved', 'uploads/accreditation/42/mayors_permit_agricoop.pdf', 'Approved', 'uploads/accreditation/42/bir_reg_agricoop.pdf', 'Approved', 'uploads/accreditation/42/cert_reg_sec_agricoop.pdf', 'Approved', 'uploads/accreditation/42/goodstanding_government_agricoop.pdf', 'Approved', 'uploads/accreditation/42/omnibus_agri-agricoop.pdf', 'Approved', 'uploads/accreditation/42/biodata_agricoop.pdf', 'Approved', 'uploads/accreditation/42/articles_inc_agri-agricoop.pdf', 'Approved', 'uploads/accreditation/42/secretary_cert_agricoop.pdf', 'Approved', 'uploads/accreditation/42/report_accomp_agricoop.pdf', 'Approved', 'uploads/accreditation/42/business_disclosure_agricoop.pdf', 'Approved', 'uploads/accreditation/42/sworn_affidavit_agricoop.pdf', 'Approved', 'Accredited', 'Pending', 'All documents are complete', '2025-03-06 01:52:12', '2025-04-21 02:56:20', '2025-04-21', NULL, NULL, 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'Approved', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks'),
(30, 43, 'uploads/accreditation/43/acomplished_data_sheet_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/goodstanding_local_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/mayors_permit_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/bir_reg_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/cert_reg_sec_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/goodstanding_government_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/omnibus_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/biodata_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/articles_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/secretary_cert_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/report_accomp_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/business_disclosure_greenharvest-mult.pdf', 'Approved', 'uploads/accreditation/43/sworn_affidavit_greenharvest-mult.pdf', 'Approved', 'Accredited', 'Pending', 'Congratulations.', '2025-03-06 02:32:59', '2025-04-21 02:59:28', '2025-04-21', NULL, NULL, 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'Approved', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks'),
(31, 44, 'uploads/accreditation/44/acomplished_data_sheet_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/goodstanding_local_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/mayors_permit_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/bir_reg_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/cert_reg_sec_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/goodstanding_government_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/omnibus_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/biodata_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/articles_inc_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/secretary_cert_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/report_accomp_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/business_disclosure_agri-aqua.pdf', 'Approved', 'uploads/accreditation/44/sworn_affidavit_agri-aqua.pdf', 'Approved', 'Accredited', 'Pending', '', '2025-03-06 03:13:57', '2025-03-06 03:15:48', '2025-03-24', NULL, NULL, 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'Approved', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks'),
(32, 45, 'uploads/accreditation/45/acomplished_data_sheet_agripinas.pdf', 'Approved', 'uploads/accreditation/45/goodstanding_local_agripinas.pdf', 'Approved', 'uploads/accreditation/45/mayors_permit_agripinas.pdf', 'Approved', 'uploads/accreditation/45/bir_reg_agripinas.pdf', 'Approved', 'uploads/accreditation/45/cert_reg_sec_agripinas.pdf', 'Approved', 'uploads/accreditation/45/goodstanding_government_agripinas.pdf', 'Approved', 'uploads/accreditation/45/omnibus_agripinas.pdf', 'Approved', 'uploads/accreditation/45/biodata_agripinas.pdf', 'Approved', 'uploads/accreditation/45/articles_agripinas.pdf', 'Approved', 'uploads/accreditation/45/secretary_cert_agripinas.pdf', 'Approved', 'uploads/accreditation/45/report_accomp_agripinas.pdf', 'Approved', 'uploads/accreditation/45/business_disclosure_agripinas.pdf', 'Approved', 'uploads/accreditation/45/sworn_affidavit_agripinas.pdf', 'Approved', 'Accredited', 'Pending', '', '2025-03-06 04:01:45', '2025-03-06 04:03:19', '2025-03-25', NULL, NULL, 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'Approved', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks'),
(33, 46, 'uploads/accreditation/46/acomplished_data_sheet_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/goodstanding_local_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/mayors_permit_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/bir_reg_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/cert_reg_sec_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/goodstanding_government_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/omnibus_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/biodata_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/articles_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/secretary_cert_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/report_accomp_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/business_disclosure_rural-roots.pdf', 'Approved', 'uploads/accreditation/46/sworn_affidavit_rural-roots.pdf', 'Approved', 'Accredited', 'Pending', 'All documents are complete', '2025-03-06 12:05:01', '2025-04-20 10:02:31', '2025-03-26', NULL, NULL, 'No remarks.', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'Approved', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks'),
(34, 47, 'uploads/accreditation/47/acomplished_data_sheet_greenfields.pdf', 'Approved', 'uploads/accreditation/47/goodstanding_local_greenfields.pdf', 'Approved', 'uploads/accreditation/47/mayors_permit_greenfields.pdf', 'Approved', 'uploads/accreditation/47/bir_reg_greenfields.pdf', 'Approved', 'uploads/accreditation/47/cert_reg_sec_greenfields.pdf', 'Approved', 'uploads/accreditation/47/goodstanding_government_greenfields.pdf', 'Approved', 'uploads/accreditation/47/omnibus_greenfields.pdf', 'Approved', 'uploads/accreditation/47/biodata_greenfields.pdf', 'Approved', 'uploads/accreditation/47/articles_greenfields.pdf', 'Approved', 'uploads/accreditation/47/secretary_cert_greenfields.pdf', 'Approved', 'uploads/accreditation/47/report_accomp_greenfields.pdf', 'Approved', 'uploads/accreditation/47/business_disclosure_greenfields.pdf', 'Approved', 'uploads/accreditation/47/sworn_affidavit_greenfields.pdf', 'Approved', 'Accredited', 'Pending', '', '2025-03-06 13:17:45', '2025-03-06 13:26:18', '2025-03-27', NULL, NULL, 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'Approved', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks'),
(35, 48, 'uploads/accreditation/48/acomplished_data_sheet_agrimar.pdf', 'Approved', 'uploads/accreditation/48/goodstanding_local_agrimar.pdf', 'Approved', 'uploads/accreditation/48/mayors_permit_agrimar.pdf', 'Approved', 'uploads/accreditation/48/bir_reg_agrimar.pdf', 'Approved', 'uploads/accreditation/48/cert_reg_sec_agrimar.pdf', 'Approved', 'uploads/accreditation/48/goodstanding_government_agrimar.pdf', 'Approved', 'uploads/accreditation/48/omnibus_agrimar.pdf', 'Approved', 'uploads/accreditation/48/biodata_agrimar.pdf', 'Approved', 'uploads/accreditation/48/articles_agrimar.pdf', 'Approved', 'uploads/accreditation/48/secretary_cert_agrimar.pdf', 'Approved', 'uploads/accreditation/48/report_accomp_agrimar.pdf', 'Approved', 'uploads/accreditation/48/business_disclosure_agrimar.pdf', 'Approved', 'uploads/accreditation/48/report_accomp_agrimar.pdf', 'Approved', 'Accredited', 'Pending', '', '2025-03-06 14:42:55', '2025-04-21 03:02:40', '2025-03-28', NULL, NULL, 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'No remarks', 'Approved', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks', 'No admin remarks');

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_documents`
--

CREATE TABLE `accreditation_documents` (
  `id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ann_content` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `ann_content`, `status`, `uploaded_at`, `updated_at`) VALUES
(16, 'sdsd', 'sdssd', 'Active', '2025-04-28 09:29:51', '2025-04-28 17:50:28'),
(20, 'zxzxczx', 'zxczxczxcxc', 'Active', '2025-04-28 10:28:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cso_chairperson`
--

CREATE TABLE `cso_chairperson` (
  `id` int(11) NOT NULL,
  `cso_name` varchar(255) NOT NULL,
  `cso_address` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL DEFAULT 'Region VI',
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `telephone_number` varchar(20) DEFAULT NULL,
  `office_telephone_number` varchar(20) DEFAULT NULL,
  `gov_id_type` varchar(50) DEFAULT NULL,
  `gov_id_file` varchar(255) DEFAULT NULL,
  `certificate_type` varchar(50) DEFAULT NULL,
  `certificate_file` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `verify_token` varchar(255) NOT NULL,
  `verify_status` tinyint(1) NOT NULL DEFAULT 0,
  `usertype` varchar(50) NOT NULL DEFAULT 'cso',
  `profile_image` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'Unverified',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cso_chairperson`
--

INSERT INTO `cso_chairperson` (`id`, `cso_name`, `cso_address`, `region`, `province`, `city`, `barangay`, `street`, `zip_code`, `last_name`, `first_name`, `middle_name`, `suffix`, `birthday`, `birth_place`, `nationality`, `religion`, `sex`, `civil_status`, `email`, `mobile_number`, `telephone_number`, `office_telephone_number`, `gov_id_type`, `gov_id_file`, `certificate_type`, `certificate_file`, `latitude`, `longitude`, `password`, `verify_token`, `verify_status`, `usertype`, `profile_image`, `status`, `date_created`, `verified_at`) VALUES
(24, 'AgriBetter CSO', '456 Agriculture Lane', 'Region VI', 'Antique', 'Hamtic', 'San Jose', 'Mango Avenue', '5700', 'Dela Cruz', 'Maria', 'Santos', '', '1985-05-12', 'Capiz', 'Filipino', 'Christianity', 'Female', 'Married', 'cikotem413@xcmexico.com', '09171234567', '036-1234567', '036-7891234', 'National ID', 'id_uploads/AgriBetter CSO/Dela Cruz_Maria/SEC.pdf', 'DOLE', 'id_uploads/AgriBetter CSO/Dela Cruz_Maria/DOLE-BRW.pdf', 10.7202000, 122.5621000, '$2y$10$GsIdBjp5DgFlCv3qhIAEaOa25rkZzljzgL.FskwNVcAXxb2i8T7vG', 'cd13a06544dc4295afe8823fd00fe8cf', 1, 'cso', 'profile/chairperson/Screenshot 2025-04-25 094408.png', 'Verified', '2025-01-11 09:08:59', '2025-04-28 14:05:15'),
(25, 'GreenHarvest CSO', '789 EcoFarm Road', 'Region VI', 'Capiz', 'Roxas', 'Barangay 9', 'Green Avenue', '5800', 'Santos', 'Maria', 'Rivera', '', '1975-08-18', 'Roxas', 'Filipino', 'Christianity', 'Female', 'Married', 'kidin65480@sfxeur.com', '09175678901', '033-4567890', '036-9876543', 'PWD', 'id_uploads/GreenHarvest CSO/Santos_Maria/SEC.pdf', 'DOLE', 'id_uploads/GreenHarvest CSO/Santos_Maria/DOLE-BRW.pdf', 11.5851000, 122.7532000, '$2y$10$5Wh.9q3XXvv.Dng.iu5Q0OPkNUasO1FaZXdhp81dh2yGwvcYY/7qu', '7d3d64baccbde650d7c87771548d84de', 1, 'cso', '', 'Verified', '2025-01-11 14:15:35', NULL),
(36, 'AgriCoop Alliance', 'Brgy. Balabag, Pavia, Iloilo, 5001', 'Region VI', ': Iloilo', 'Pavia', 'Balabag', 'Delgado Street', '5001', 'Dela Cruz', 'John', 'Ramirez', '', '1975-05-03', 'Iloilo City, Iloilo', 'Filipino', 'Christianity', 'Male', 'Married', 'civam31290@jomspar.com', '+63 917-123-4567', '(033) 320-5678', '(033) 329-8796', 'DOLE', 'id_uploads/AgriCoop Alliance/Dela Cruz_John/id_juan_delacruz.pdf', 'DOLE', 'id_uploads/AgriCoop Alliance/Dela Cruz_John/cert_agricoop.pdf', 10.7724810, 122.5108500, '$2y$10$ktTZxB272kmSYuQR4umkOOKmy6YIbeKTwHl8P0gbbKVlhach36FqK', '76d5c930e43ee18217ce2b9ffd7f3166', 1, 'cso', '', 'Verified', '2025-03-06 01:45:19', '2025-04-28 13:49:56'),
(37, 'GreenHarvest Multipurpose Cooperative', ' Brgy. Baybay, Roxas City, Capiz, 5800', 'Region VI', 'Capiz', 'Roxas City', ' Baybay', 'Zamora Street', '5800', 'Santos', 'Mary', 'Lopez', '', '1980-08-15', 'Roxas City, Capiz', 'Filipino', 'Christianity', 'Female', 'Single', 'capol55048@egvoo.com', '+63 927-654-3210', '(036) 621-3456', '(036) 621-6789', 'National ID', 'id_uploads/GreenHarvest Multipurpose Cooperative/Santos_Mary/id_maria_santos.pdf', 'SEC', 'id_uploads/GreenHarvest Multipurpose Cooperative/Santos_Mary/cert_greenharvest.pdf', 11.5853000, 122.7510000, '$2y$10$GUqoA.kt/1u3uPZuiLKaXuibkDuJdav2AEXHI1Irdy7AyP0dhT33e', '74e9da4e8977361cf8a11ff795c08cab', 1, 'cso', '', 'Verified', '2025-03-06 02:25:13', NULL),
(38, 'Agri-Aqua Development Association', 'Brgy. Estancia, Kalibo, Aklan, 5600', 'Region VI', 'Aklan', ' Kalibo', 'Estancia', 'Rizal Avenue', ' 5600', 'Mendoza', 'Carlos', 'Reyes', '', '1968-06-20', ' Kalibo, Aklan', 'Filipino', 'Christianity', 'Male', 'Married', 'jelah28276@lassora.com', '+63 915-234-5678', '003-0987-9291', ' (036) 268-4567', 'Voters', 'id_uploads/Agri-Aqua Development Association/Mendoza_Carlos/id_carlos_mendoza.pdf', 'CDA', 'id_uploads/Agri-Aqua Development Association/Mendoza_Carlos/cert_agri-aqua.pdf', 11.6998770, 122.3577080, '$2y$10$cNh2T09YHiZwI3ClUDL8V..Vs7cAlI0UMYug6SpkJsT2nDiuRGKx6', 'cb2f2b73b3aebfc2a580f050c09b0ddc', 1, 'cso', '', 'Verified', '2025-03-06 03:07:55', '2025-04-27 04:03:45'),
(39, 'AgriPinas Foundation', 'Brgy. San Pedro, San Jose, Antique, 5700', 'Region VI', 'Antique', ' San Jose', 'San Pedro', 'Magallanes Street', '5700', 'Villanueva', ' Ricardo', 'Torreses', '', '1973-05-10', 'San Jose, Antique', 'Filipino', 'Christianity', 'Male', 'Married', 'titaga9779@jomspar.com', '09261309396', ' (036) 320-4532', '(036) 320-7890', 'National', 'id_uploads/AgriPinas Foundation/Villanueva_ Ricardo/document.pdf', 'DOLE', 'id_uploads/AgriPinas Foundation/Villanueva_ Ricardo/cert_agripinas.pdf', 10.7356000, 121.9412000, '$2y$10$7UcCQRnT5Cj/Z4fbUTIK8OPJ9rMk6QsVqAjAdGU1bB3Rk74AZg8GC', 'a1da05642645631d03220fb8cbcd167e', 1, 'cso', 'profile/chairperson/AgriPinas Foundation/Villanueva_ Ricardo.jpg', 'Verified', '2025-03-06 03:56:04', NULL),
(40, 'Rural Roots Organization', 'Brgy. Villamonte, Bacolod City, Negros Occidental, 6100', 'Region VI', 'Negros Occidental', 'Bacolod City', ' Villamonte', 'Lacson Street', '6100', 'Ramirez', 'Ana', 'Gonzales', '', '1982-09-22', 'Bacolod City, Negros Occidental', 'Filipino', 'Christianity', 'Female', 'Widowed', 'todip37263@lassora.com', '+63 917-567-8900', '(034) 433-4020', '(034) 433-7890', 'Passport', 'id_uploads/Rural Roots Organization/Ramirez_Ana/document.pdf', 'SEC', 'id_uploads/Rural Roots Organization/Ramirez_Ana/cert_rural-roots.pdf', 10.6684220, 122.9648940, '$2y$10$aZilGqEVWv4TCwqakNw6qeFhMMk5GSHrazzFtmHrpdOsNd8q6KVMu', '84601311615248923833955a4c7800c9', 1, 'cso', '', 'Verified', '2025-03-06 08:24:17', '2025-04-26 06:21:42'),
(41, ' GreenFields & BlueWaters Initiative', ' Brgy. Prosperidad, San Carlos City, Negros Occidental, 6127', 'Region VI', 'Negros Occidental', 'San Carlos City', ' Prosperidad', 'Gonzales Street', ' 6127', 'Nievera', 'Donny Mark', 'Cruz', '', '1970-11-19', 'San Carlos City, Negros Occidental', 'Filipino', 'Christianity', 'Male', 'Married', 'fikener995@lassora.com', '+63 920-234-4465', '(034) 312-4567', ': (034) 312-6789', 'DOLE', 'id_uploads/ GreenFields & BlueWaters Initiative/Nievera_Donny Mark/id_daniel_navarro.pdf', 'DOLE', 'id_uploads/ GreenFields & BlueWaters Initiative/Nievera_Donny Mark/cert_greenfields.pdf', 10.4956000, 123.4167000, '$2y$10$XhcKLEMsd3EvthO2j2T/qOaZvk9C7nAHUtPLqjjkIJpACXAxPx5fy', '36948265b80b3b737229c832f8fb325b', 1, 'cso', 'profile/chairperson/ GreenFields & BlueWaters Initiative/Nievera_Donny Mark.jpg', 'Verified', '2025-03-06 13:12:54', '2025-04-26 06:30:50'),
(42, 'AgriMar Coop Alliance', 'Brgy. Rizal, Jordan, Guimaras, 5045', 'Region VI', 'Guimaras', ': Jordan', 'Rizal', 'Magsaysay Street', '5045', 'Castillo', 'Elena', 'Reyes', '', '1985-07-14', 'Jordan, Guimaras', 'Filipino', 'Christianity', 'Female', 'Married', 'gacemif480@hartaria.com', '+63 926-789-0123', '(033) 581-2345', '(033) 581-6789', 'Drivers', 'id_uploads/AgriMar Coop Alliance/Castillo_Elena/id_elena_castillo.pdf', 'SEC', 'id_uploads/AgriMar Coop Alliance/Castillo_Elena/cert_agrimar.pdf', 10.6560350, 122.5918260, '$2y$10$LGq1RxMYG5m2MoImf/2Kdu8QFvkU2qi1SsVxjboZ0SkccQ5iWSNCa', '2f1be9dcc027ef88e5febec4b1ac850b', 1, 'cso', '', 'Verified', '2025-03-06 14:08:25', '2025-04-26 06:36:52'),
(43, 'Integrated Agri-Aqua Cooperative', ' Brgy. Tabugon, Kabankalan City, Negros Occidental, 6111', 'Region VI', ' Negros Occidental', 'Kabankalan City', 'Tabugon', 'Mabini Street', '6111', 'Falcon', 'Robert', 'Crisanto', '', '1978-04-18', 'Kabankalan City, Negros Occidental', 'Filipino', 'Christianity', 'Male', 'Married', 'yowono3909@jomspar.com', '+63 923-456-7890', '', '(034) 471-6789', 'CDA', 'id_uploads/Integrated Agri-Aqua Cooperative/Falcon_Robert/id_roberto_fernandez.pdf', 'CDA', 'id_uploads/Integrated Agri-Aqua Cooperative/Falcon_Robert/cert_integ-agri-aqua.pdf', 9.7875680, 122.8016140, '$2y$10$XfIkYKgGf.9kz2XgMUk2QOFLtf4tdXGEIVQUtyn3vuFtZaQEzsjuu', '471132ccc471b1f642d1b70d42ed9e0c', 1, 'cso', '', 'Verified', '2025-03-06 14:19:51', '2025-04-26 06:39:33'),
(44, 'Agri-Livestock and Fisheries Advancement Coalition', 'Brgy. Caduhaan, Cadiz City, Negros Occidental, 6121', 'Region VI', 'Negros Occidental', 'Cadiz City', 'Caduhaan', 'Roxas Avenue', '6121', 'Gutierrez', 'Benjamin', 'Santos', '', '1965-01-30', ' Cadiz City, Negros Occidental', 'Filipino', 'Christianity', 'Male', 'Widowed', 'jepaneh345@jomspar.com', '+63 921-345-6789', '(033)-0927-928', '(034) 491-7890', 'PRC', 'id_uploads/Agri-Livestock and Fisheries Advancement Coalition/Gutierrez_Benjamin/id_benjamin_gutierrez.pdf', 'DOLE', 'id_uploads/Agri-Livestock and Fisheries Advancement Coalition/Gutierrez_Benjamin/cert_agri-livestock.pdf', 10.9510000, 123.3086000, '$2y$10$YMKWLwqtDxHyo8XqH5WhZuhMxNgmfXzRwqPLhCDEA3zH1IBjpgC0W', 'b1d5393408f32d3c8947bbf19b80d324', 1, 'cso', 'profile/chairperson/Agri-Livestock and Fisheries Advancement Coalition/Gutierrez_Benjamin.png', 'Verified', '2025-03-06 14:28:59', '2025-04-26 06:41:42'),
(45, 'Sustainable AgriPH ', 'Brgy. Pulao, Dumangas, Iloilo,  5006', 'Region VI', 'Iloilo', 'Dumangas', 'Pulao', 'Arroyo Street', '5006', 'Alvarado', 'Cynthia', 'Torres', '', '1976-12-08', 'Dumangas, Iloilo', 'Filipino', 'Christianity', 'Female', 'Single', 'yafov95345@egvoo.com', ': +63 919-234-5678', '(033) 555-6789', '(033) 555-1234', 'DOLE', 'C:\\xampp\\htdocs\\DA/id_uploads/Sustainable_AgriPH_/Alvarado_Cynthia/Letter for Evaluators_Miagao Farmers Agriculture Cooperative_1745678741.pdf', 'DOLE', 'id_uploads/Sustainable AgriPH /Alvarado_Cynthia/cert_rural-roots.pdf', 10.7642000, 122.6703000, '$2y$10$XWxSZGzefU.ve.7ic4EoaOyISgHh2UjSNO7p.xgQ/953o/YTDTcTG', '77c79abbcc8544f9de6f41b0ffc04010', 1, 'cso', '', 'Verified', '2025-03-06 14:38:17', '2025-04-26 15:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `cso_evaluations`
--

CREATE TABLE `cso_evaluations` (
  `id` int(11) NOT NULL,
  `cso_id` int(11) NOT NULL,
  `accuracy_score` tinyint(4) NOT NULL DEFAULT 3,
  `compliance_score` tinyint(4) NOT NULL DEFAULT 3,
  `community_engagement_score` tinyint(4) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cso_representative`
--

CREATE TABLE `cso_representative` (
  `id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cso_name` varchar(255) NOT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `telephone_number` varchar(20) NOT NULL,
  `gov_id_type` varchar(50) DEFAULT NULL,
  `gov_id_file` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Unverified',
  `usertype` varchar(50) NOT NULL DEFAULT 'representative',
  `verify_token` varchar(255) NOT NULL,
  `verify_status` tinyint(1) NOT NULL DEFAULT 0,
  `profile_image` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cso_representative`
--

INSERT INTO `cso_representative` (`id`, `last_name`, `first_name`, `middle_name`, `suffix`, `birthday`, `birth_place`, `nationality`, `religion`, `sex`, `civil_status`, `email`, `cso_name`, `mobile_number`, `telephone_number`, `gov_id_type`, `gov_id_file`, `password`, `status`, `usertype`, `verify_token`, `verify_status`, `profile_image`, `date_created`, `verified_at`) VALUES
(28, 'Reyes', 'Antonio', 'Delos Santos', 'Sr.', '1990-07-23', 'Roxas', 'Filipino', 'Christianity', 'Male', 'Single', 'rokecen770@xcmexico.com', 'AgriBetter CSO', '09271234567', '', 'SSS', 'id_uploads/AgriBetter CSO/Reyes_Antonio/CDA.pdf', '$2y$10$rd/MdXD1UCdXOz5T9lazae/1BoI2jbzJuvPwPHoDU7DzPx4zTv.wK', 'Verified', 'representative', '0138752dc22236113a698123e2e76eba', 1, 'profile/user/Screenshot 2025-04-25 094227.png', '2025-01-11 09:12:18', '2025-04-28 14:22:04'),
(29, 'Ramirez', 'Miguel', 'Gutierrez', 'Sr.', '1990-12-12', 'Bacolod', 'Filipino', 'Christianity', 'Male', 'Single', 'polivor611@xcmexico.com', 'GreenHarvest CSO', '09271234567', '036-1234567', 'DOLE', 'id_uploads/GreenHarvest CSO/Ramirez_Miguel/DOLE-BRW.pdf', '$2y$10$sc1tvx.OYtU0nDSJ9uNzQ.Gmtdx74XwSaucC7CpiO.2DUrhbechQ6', 'Verified', 'representative', '33da869fb24513172f637b53bb665a7e', 1, '', '2025-01-11 14:24:58', NULL),
(42, 'Gonzales', 'Mark', 'Rivera', '', '1985-04-12', 'Passi City, Iloilo', 'Filipino', 'Christianity', 'Male', 'Married', 'lifan92327@hartaria.com', 'AgriCoop Alliance', '+63 917-456-7890', '', 'DOLE', 'id_uploads/AgriCoop Alliance/Gonzales_Mark/id_gonzales_mark.pdf', '$2y$10$KxncMzkfsWAp9EEgKdL2H.v8GYAiuM9Kv62W4co.2llh37lPtAuLm', 'Verified', 'representative', 'c2c4c6107b1550610678e7d96ad4a3ab', 1, '', '2025-03-06 01:48:50', NULL),
(43, 'Reyes', 'Angela', 'Santillan', '', '1990-06-30', 'Roxas City, Capiz', 'Filipino', 'Christianity', 'Female', 'Single', 'safire1874@jomspar.com', 'GreenHarvest Multipurpose Cooperative', '+63 927-987-6543', '(036) 621-5678', 'PRC', 'id_uploads/GreenHarvest Multipurpose Cooperative/Reyes_Angela/id_reyes_angela.pdf', '$2y$10$edTYNbMYJjcYSaa83Xmgx.cfsnML0jpIFnzi.jgregK1GsxDkFi82', 'Verified', 'representative', '99f7eff0e2ad2461e03151df8036c67d', 1, '', '2025-03-06 02:27:36', '2025-04-28 13:59:25'),
(44, 'Mendoza', 'Carlos', 'Reyes', '', '1968-06-20', ' Kalibo, Aklan', 'Filipino', 'Christianity', 'Male', 'Married', 'koyer84225@jomspar.com', 'Agri-Aqua Development Association', '+63 915-234-5600', '003-0987-9291', 'National', 'id_uploads/Agri-Aqua Development Association/Mendoza_Carlos/id_carlos_mendoza.pdf', '$2y$10$/RR1dC0.acXA8I.lH6N3LeZ02Nquv65oQkHXnIbVOehSB7Ki3cjcK', 'Verified', 'representative', 'd94d93c67510233e792c9f22ba1ca314', 1, '', '2025-03-06 03:11:13', '2025-04-27 04:04:20'),
(45, 'Toledo', 'Dan', 'Cruz', '', '1977-05-22', 'San Jose, Antique', 'Filipino', 'Christianity', 'Male', 'Married', 'vasode9477@hartaria.com', 'AgriPinas Foundation', '+63 918-345-6789', '(036) 320-6789', 'DOLE', 'id_uploads/AgriPinas Foundation/Toledo_Dan/id_torres_daniel.pdf', '$2y$10$rbVtS23PyoGqrarfP2CdAe8il4rgKtidEwZlsxNeyattuVrZXvJhO', 'Verified', 'representative', 'a76b5cb80dcf491c76a1c2aa1e1ad615', 1, '', '2025-03-06 03:58:58', NULL),
(46, 'Navarro', 'Jose', 'Mendoza', '', '1986-09-03', ' Bacolod City, Negros Occidental', 'Filipino', 'Christianity', 'Male', 'Married', 'sokoyo6303@egvoo.com', 'Rural Roots Organization', '+63 917-654-7890', '(034) 433-5678', 'National', 'id_uploads/Rural Roots Organization/Navarro_Jose/id_navarro_jose.pdf', '$2y$10$TRihv7ooWfynJSE.q1nFPOJxLjzFLKVwJA76yfVNLNvpO0dcFl6Si', 'Verified', 'representative', 'f3c8f23ba627ba0a6f4370ae4592a048', 1, '', '2025-03-06 11:59:39', NULL),
(47, 'Domingo', 'Anne', 'Santos', '', '1991-11-14', 'San Carlos City, Negros Occidental', 'Filipino', 'Christianity', 'Female', 'Single', 'faxog34392@jomspar.com', ' GreenFields & BlueWaters Initiative', '+63 927-890-1234', ' (034) 312-4567', 'DOLE', 'id_uploads/ GreenFields & BlueWaters Initiative/Domingo_Anne/id_domingo_anne.pdf', '$2y$10$jR.5.Mib5XYpkihrrZzyYe6vFxo6Mi431ZCbtx8V2Y3P77izotoGK', 'Verified', 'representative', '5c1c6a4f2d701ba09c732b58dc9fe377', 1, '', '2025-03-06 13:15:20', '2025-04-28 14:00:33'),
(48, 'Rivera', 'Manuel', 'Roxas', '', '1980-07-05', 'Dumangas, Iloilo', 'Filipino', 'Christianity', 'Male', 'Married', 'cilak87573@jomspar.com', 'AgriMar Coop Alliance', '+63 916-789-0123', '', 'DOLE', 'id_uploads/AgriMar Coop Alliance/Rivera_Manuel/id_rivera_manuel.pdf', '$2y$10$kUqAZOWV5Wfx8miVpofhUutOcIjI2PcruswzPDPte5VGSmcng5Yu2', 'Verified', 'representative', '440e9df3b51d6217c1b91746daf94306', 1, '', '2025-03-06 14:13:19', NULL),
(49, 'Roa', 'Ricardo', 'Santos', '', '1983-01-09', 'Jordan, Guimaras', 'Filipino', 'Christianity', 'Male', 'Single', 'xevik35188@egvoo.com', 'Integrated Agri-Aqua Cooperative', '+63 917-345-6789', '', 'PRC', 'id_uploads/Integrated Agri-Aqua Cooperative/Roa_Ricardo/id_valdez_ricardo.pdf', '$2y$10$kgU5iVB1mVh.l8fgdW88pudxfKvd2HmIdJ0MnMSMV7T6iOX31.v3m', 'Verified', 'representative', 'a51adc40ceee8f212196f3f86e043532', 1, '', '2025-03-06 14:23:47', NULL),
(50, 'Bautista', 'Edwin', 'Reyes', '', '1987-08-21', 'Cadiz City, Negros Occidental', 'Filipino', 'Christianity', 'Male', 'Married', 'wejekod567@hartaria.com', 'Agri-Livestock and Fisheries Advancement Coalition', '+63 927-678-2345', '', 'DOLE', 'id_uploads/Agri-Livestock and Fisheries Advancement Coalition/Bautista_Edwin/id_bautista_edwin.pdf', '$2y$10$rJDPQma.Y/HNKdLWxwmf7.wC6ZAzs96dAfMmPSbqqtCRI.RqRXlP2', 'Verified', 'representative', 'a0fc9ecc6d167046f9fab5f0b118f3d6', 1, '', '2025-03-06 14:33:02', '2025-04-27 03:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `announcement_id`, `document_name`, `file_path`, `uploaded_at`) VALUES
(17, 16, 'admin_post_projects.php', 'uploads/admin_post_projects.php', '2025-04-28 09:50:23'),
(18, 16, 'admin_cso_users.php', 'uploads/admin_cso_users.php', '2025-04-28 09:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `financial_report`
--

CREATE TABLE `financial_report` (
  `id` int(11) NOT NULL,
  `cso_representative_id` int(11) DEFAULT NULL,
  `solvency` decimal(10,2) DEFAULT NULL,
  `roi` decimal(10,2) DEFAULT NULL,
  `liquidity` decimal(10,2) DEFAULT NULL,
  `indication` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `net_operating_income` decimal(10,2) DEFAULT NULL,
  `avg_operating_assets` decimal(10,2) DEFAULT NULL,
  `current_assets` decimal(10,2) DEFAULT NULL,
  `current_liabilities` decimal(10,2) DEFAULT NULL,
  `total_liabilities` decimal(10,2) DEFAULT NULL,
  `total_assets` decimal(10,2) DEFAULT NULL,
  `accomplishment_file_path` varchar(255) DEFAULT NULL,
  `financial_file_path` varchar(255) DEFAULT NULL,
  `admin_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `cso_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `liability` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `financial_report`
--

INSERT INTO `financial_report` (`id`, `cso_representative_id`, `solvency`, `roi`, `liquidity`, `indication`, `upload_date`, `net_operating_income`, `avg_operating_assets`, `current_assets`, `current_liabilities`, `total_liabilities`, `total_assets`, `accomplishment_file_path`, `financial_file_path`, `admin_status`, `cso_status`, `liability`) VALUES
(22, 42, 38.46, 50.00, 2.92, '', '2025-03-06 02:29:53', 2500000.00, 5000000.00, 3500000.00, 1200000.00, 2500000.00, 6500000.00, 'accomplishment/AgriCoop Alliance/Accomplishment Report.pdf', 'financial_reports/42/Financial  Statement.pdf', 'Pending', 'Approved', 2.92),
(23, 43, 80.00, 5.00, 0.57, '', '2025-03-06 03:01:48', 50000.00, 1000000.00, 200000.00, 350000.00, 1200000.00, 1500000.00, 'accomplishment/GreenHarvest Multipurpose Cooperative/Accomplishment Report.pdf', 'financial_reports/43/Financial  Statement.pdf', 'Pending', 'Approved', 0.57),
(24, 44, 51.43, 12.80, 1.50, '', '2025-03-06 03:49:17', 320000.00, 2500000.00, 750000.00, 500000.00, 1800000.00, 3500000.00, 'accomplishment/Agri-Aqua Development Association/Accomplishment Report.pdf', 'financial_reports/44/Financial  Statement.pdf', 'Pending', 'Pending', 1.50),
(25, 45, 60.00, 18.67, 1.27, '', '2025-03-06 04:36:58', 280000.00, 1500000.00, 700000.00, 550000.00, 1200000.00, 2000000.00, 'accomplishment/AgriPinas Foundation/Accomplishment Report.pdf', 'financial_reports/45/Financial  Statement.pdf', 'Pending', 'Approved', 1.27),
(26, 46, 46.67, 12.50, 1.67, '', '2025-03-06 12:53:44', 150000.00, 1200000.00, 500000.00, 300000.00, 700000.00, 1500000.00, 'accomplishment/Rural Roots Organization/Accomplishment Report.pdf', 'financial_reports/46/Financial  Statement.pdf', 'Pending', 'Pending', 1.67),
(27, 46, 75.00, 4.38, 0.83, '', '2025-03-06 13:02:45', 35000.00, 800000.00, 150000.00, 180000.00, 900000.00, 1200000.00, 'accomplishment/Rural Roots Organization/Accomplishment Report.pdf', 'financial_reports/46/Financial  Statement.pdf', 'Pending', 'Approved', 0.83),
(28, 44, 60.00, 7.78, 1.20, '', '2025-03-06 13:06:32', 350000.00, 4500000.00, 1200000.00, 1000000.00, 3000000.00, 5000000.00, 'accomplishment/Agri-Aqua Development Association/Accomplishment Report.pdf', 'financial_reports/44/Financial  Statement.pdf', 'Pending', 'Approved', 1.20),
(29, 47, 250.00, 8.00, 1.25, '', '2025-03-06 13:57:45', 280000.00, 3500000.00, 750000.00, 600000.00, 4500000.00, 1800000.00, 'accomplishment/ GreenFields & BlueWaters Initiative/Accomplishment Report.pdf', 'financial_reports/47/Financial  Statement.pdf', 'Pending', 'Pending', 1.25),
(30, 47, 235.29, 6.00, 0.11, '', '2025-03-06 14:01:38', 210000.00, 3500000.00, 65000.00, 600000.00, 4000000.00, 1700000.00, 'accomplishment/ GreenFields & BlueWaters Initiative/Accomplishment Report.pdf', 'financial_reports/47/Financial  Statement.pdf', 'Pending', 'Approved', 0.11);

--
-- Triggers `financial_report`
--
DELIMITER $$
CREATE TRIGGER `before_insert_sync_liquidity_liability` BEFORE INSERT ON `financial_report` FOR EACH ROW BEGIN
    SET NEW.liability = NEW.liquidity;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_sync_liquidity_liability` BEFORE UPDATE ON `financial_report` FOR EACH ROW BEGIN
    SET NEW.liability = NEW.liquidity;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `actual_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `comments` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `project_id`, `title`, `description`, `target_date`, `actual_date`, `status`, `comments`, `file_path`, `created_at`) VALUES
(28, 74, 'Milestone 1', '1', '2025-05-05', NULL, 'Pending', '1', '', '2025-04-30 03:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `milestone_tasks`
--

CREATE TABLE `milestone_tasks` (
  `id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `milestone_tasks`
--

INSERT INTO `milestone_tasks` (`id`, `milestone_id`, `task_id`, `created_at`) VALUES
(71, 28, 137, '2025-04-30 03:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `project_desc` text NOT NULL,
  `budget` decimal(50,0) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `cso_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `objectives` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `status` enum('Assigned','In Progress','Completed') DEFAULT 'Assigned',
  `days_over` int(11) NOT NULL DEFAULT 0,
  `budget_over` decimal(10,2) NOT NULL DEFAULT 0.00,
  `outcomes` text DEFAULT NULL,
  `milestones` text DEFAULT NULL,
  `risks` text DEFAULT NULL,
  `team` text DEFAULT NULL,
  `date_submitted` date DEFAULT NULL,
  `funding_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `proposal_status` enum('Pending','Approved','Denied') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `project_desc`, `budget`, `file_path`, `created_at`, `cso_id`, `start_date`, `end_date`, `duration`, `objectives`, `location`, `latitude`, `longitude`, `status`, `days_over`, `budget_over`, `outcomes`, `milestones`, `risks`, `team`, `date_submitted`, `funding_status`, `proposal_status`) VALUES
(74, 'Test', 'Test 1 & 2!!!\r\n\r\nTest 3', 123456, 'proposals/GreenHarvest_Multipurpose_Cooperative/Supporting Document.pdf', '2025-04-30 09:17:45', 37, '2025-04-29', '2025-06-22', 54, 'Test 1 & 2!!!\r\n\r\nTest 3', 'Iloilo', 10.9522, 122.58, 'Assigned', 0, 0.00, 'Test 1 & 2!!!\r\n\r\nTest 3', 'Test 1 & 2!!!\r\n\r\nTest 3', 'Test 1 & 2!!!\r\n\r\nTest 3', 'Test 1', '2025-04-29', 'Approved', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `project_cso`
--

CREATE TABLE `project_cso` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `cso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_cso`
--

INSERT INTO `project_cso` (`id`, `project_id`, `task_id`, `cso_id`) VALUES
(101, 74, NULL, 37);

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `objectives` text NOT NULL,
  `outcomes` text DEFAULT NULL,
  `milestones` text DEFAULT NULL,
  `team` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `risks` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_updated_at` date DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `date_submitted` date DEFAULT curdate(),
  `funding_status` varchar(255) DEFAULT 'Pending',
  `cso_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `cso_status_updated_at` timestamp NULL DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL,
  `funding_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`id`, `title`, `content`, `objectives`, `outcomes`, `milestones`, `team`, `location`, `latitude`, `longitude`, `risks`, `file_path`, `cso_representative_id`, `status`, `created_at`, `start_date`, `end_date`, `status_updated_at`, `budget`, `date_submitted`, `funding_status`, `cso_status`, `cso_status_updated_at`, `remarks`, `funding_updated_at`) VALUES
(71, 'Test', 'Test 1 & 2!!!\r\n\r\nTest 3', 'Test 1 & 2!!!\r\n\r\nTest 3', 'Test 1 & 2!!!\r\n\r\nTest 3', 'Test 1 & 2!!!\r\n\r\nTest 3', 'Test 1', 'Iloilo', 10.952217, 122.579946, 'Test 1 & 2!!!\r\n\r\nTest 3', 'proposals/GreenHarvest_Multipurpose_Cooperative/Supporting Document.pdf', 43, 'Approved', '2025-04-29 15:37:48', '2025-04-29', '2025-06-22', '2025-04-30', 123456.00, '2025-04-29', 'Approved', 'Approved', '2025-04-29 15:37:48', 'Test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ranking_weights`
--

CREATE TABLE `ranking_weights` (
  `id` int(11) NOT NULL,
  `weightSolvency` float DEFAULT NULL,
  `weightLiquidity` float DEFAULT NULL,
  `weightROI` float DEFAULT NULL,
  `weightCompletionRate` float DEFAULT 0.1,
  `weightApprovalRate` float DEFAULT 0.1,
  `weightProjectDelayImpact` float DEFAULT 0.1,
  `weightBudgetDeviationImpact` float DEFAULT 0.1,
  `weightAccuracy` float DEFAULT 0.05,
  `weightCompliance` float DEFAULT 0.05,
  `weightCommunityEngagement` float DEFAULT 0.05,
  `weightTotalProjects` float DEFAULT NULL,
  `weightCompletedProjects` float DEFAULT NULL,
  `weightTotalTasks` float DEFAULT NULL,
  `weightCompletedTasks` float DEFAULT NULL,
  `weightTotalProposals` float DEFAULT NULL,
  `weightApprovedProposals` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ranking_weights`
--

INSERT INTO `ranking_weights` (`id`, `weightSolvency`, `weightLiquidity`, `weightROI`, `weightCompletionRate`, `weightApprovalRate`, `weightProjectDelayImpact`, `weightBudgetDeviationImpact`, `weightAccuracy`, `weightCompliance`, `weightCommunityEngagement`, `weightTotalProjects`, `weightCompletedProjects`, `weightTotalTasks`, `weightCompletedTasks`, `weightTotalProposals`, `weightApprovedProposals`) VALUES
(1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1);

-- --------------------------------------------------------

--
-- Table structure for table `renewal_application`
--

CREATE TABLE `renewal_application` (
  `application_id` int(11) NOT NULL,
  `cso_representative_id` int(11) NOT NULL,
  `datasheet_org` varchar(255) DEFAULT NULL,
  `datasheet_org_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_lce` varchar(255) DEFAULT NULL,
  `goodstanding_lce_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_mayor` varchar(255) DEFAULT NULL,
  `permit_mayor_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `permit_bir` varchar(255) DEFAULT NULL,
  `permit_bir_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `certificate_reg` varchar(255) DEFAULT NULL,
  `certificate_reg_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `goodstanding_ga` varchar(255) DEFAULT NULL,
  `goodstanding_ga_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `omnibus` varchar(255) DEFAULT NULL,
  `omnibus_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `bio_data` varchar(255) DEFAULT NULL,
  `bio_data_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `articles_of_incorporation` varchar(255) DEFAULT NULL,
  `articles_of_incorporation_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `incumbent_officers` varchar(255) DEFAULT NULL,
  `incumbent_officers_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `accomplishment_reports` varchar(255) DEFAULT NULL,
  `accomplishment_reports_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `disclosure` varchar(255) DEFAULT NULL,
  `disclosure_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `affidavit` varchar(255) DEFAULT NULL,
  `affidavit_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `status` enum('Pending','Accredited','Denied') DEFAULT 'Pending',
  `overall_status` enum('Pending','Accepted','Denied') DEFAULT 'Pending',
  `remarks` text DEFAULT 'No Remarks.',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `schedule` datetime DEFAULT NULL,
  `status_updated_at` datetime DEFAULT NULL,
  `hardcopy_submission_date` date DEFAULT NULL,
  `datasheet_org_remarks` text DEFAULT NULL,
  `goodstanding_lce_remarks` text DEFAULT NULL,
  `permit_mayor_remarks` text DEFAULT NULL,
  `permit_bir_remarks` text DEFAULT NULL,
  `certificate_reg_remarks` text DEFAULT NULL,
  `goodstanding_ga_remarks` text DEFAULT NULL,
  `omnibus_remarks` text DEFAULT NULL,
  `bio_data_remarks` text DEFAULT NULL,
  `articles_of_incorporation_remarks` text DEFAULT NULL,
  `incumbent_officers_remarks` text DEFAULT NULL,
  `accomplishment_reports_remarks` text DEFAULT NULL,
  `disclosure_remarks` text DEFAULT NULL,
  `affidavit_remarks` text DEFAULT NULL,
  `cso_status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `datasheet_org_admin_remarks` text DEFAULT NULL,
  `goodstanding_lce_admin_remarks` text DEFAULT NULL,
  `permit_mayor_admin_remarks` text DEFAULT NULL,
  `permit_bir_admin_remarks` text DEFAULT NULL,
  `certificate_reg_admin_remarks` text DEFAULT NULL,
  `goodstanding_ga_admin_remarks` text DEFAULT NULL,
  `omnibus_admin_remarks` text DEFAULT NULL,
  `bio_data_admin_remarks` text DEFAULT NULL,
  `articles_of_incorporation_admin_remarks` text DEFAULT NULL,
  `incumbent_officers_admin_remarks` text DEFAULT NULL,
  `accomplishment_reports_admin_remarks` text DEFAULT NULL,
  `disclosure_admin_remarks` text DEFAULT NULL,
  `affidavit_admin_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` enum('Pending','In Progress','Done') NOT NULL DEFAULT 'Pending',
  `file_path` varchar(255) DEFAULT NULL,
  `spent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comments` text DEFAULT NULL,
  `proposed_start_date` date DEFAULT NULL,
  `proposed_end_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `project_id`, `title`, `description`, `duration`, `status`, `file_path`, `spent`, `created_at`, `updated_at`, `comments`, `proposed_start_date`, `proposed_end_date`, `actual_start_date`, `actual_end_date`, `milestone_id`) VALUES
(137, 74, 'Task 1', '1', 0, 'Pending', NULL, 0.00, '2025-04-30 03:16:30', '2025-04-30 03:16:30', '1', '2025-04-30', '2025-05-01', '0000-00-00', '0000-00-00', NULL),
(140, 74, 'Task 2', '2', 0, 'In Progress', NULL, 0.00, '2025-04-30 03:28:59', '2025-04-30 03:30:06', '2', '2025-05-05', '2025-05-08', '2025-05-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task_dependencies`
--

CREATE TABLE `task_dependencies` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `predecessor_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thresholds`
--

CREATE TABLE `thresholds` (
  `id` int(11) NOT NULL,
  `roi_threshold` decimal(5,2) NOT NULL,
  `liability_threshold` decimal(5,2) NOT NULL,
  `solvency_threshold` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thresholds`
--

INSERT INTO `thresholds` (`id`, `roi_threshold`, `liability_threshold`, `solvency_threshold`) VALUES
(1, 0.07, 1.00, 0.60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accreditation_application`
--
ALTER TABLE `accreditation_application`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `idx_cso_representative` (`cso_representative_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_overall_status` (`overall_status`);

--
-- Indexes for table `accreditation_documents`
--
ALTER TABLE `accreditation_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cso_chairperson`
--
ALTER TABLE `cso_chairperson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cso_name` (`cso_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `latitude` (`latitude`),
  ADD KEY `longitude` (`longitude`);

--
-- Indexes for table `cso_evaluations`
--
ALTER TABLE `cso_evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cso_id` (`cso_id`);

--
-- Indexes for table `cso_representative`
--
ALTER TABLE `cso_representative`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `cso_name` (`cso_name`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cso_representative_id` (`cso_representative_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`);

--
-- Indexes for table `financial_report`
--
ALTER TABLE `financial_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `milestone_tasks`
--
ALTER TABLE `milestone_tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `milestone_id` (`milestone_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cso_id` (`cso_id`);

--
-- Indexes for table `project_cso`
--
ALTER TABLE `project_cso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `cso_id` (`cso_id`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proposal_cso_representative` (`cso_representative_id`);

--
-- Indexes for table `ranking_weights`
--
ALTER TABLE `ranking_weights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `renewal_application`
--
ALTER TABLE `renewal_application`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tasks_project` (`project_id`),
  ADD KEY `fk_tasks_milestone` (`milestone_id`);

--
-- Indexes for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_dependency` (`task_id`,`predecessor_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `predecessor_id` (`predecessor_id`);

--
-- Indexes for table `thresholds`
--
ALTER TABLE `thresholds`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accreditation_application`
--
ALTER TABLE `accreditation_application`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `accreditation_documents`
--
ALTER TABLE `accreditation_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cso_chairperson`
--
ALTER TABLE `cso_chairperson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `cso_evaluations`
--
ALTER TABLE `cso_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cso_representative`
--
ALTER TABLE `cso_representative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `financial_report`
--
ALTER TABLE `financial_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `milestone_tasks`
--
ALTER TABLE `milestone_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `project_cso`
--
ALTER TABLE `project_cso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `ranking_weights`
--
ALTER TABLE `ranking_weights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `renewal_application`
--
ALTER TABLE `renewal_application`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `thresholds`
--
ALTER TABLE `thresholds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accreditation_application`
--
ALTER TABLE `accreditation_application`
  ADD CONSTRAINT `accreditation_application_ibfk_1` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`);

--
-- Constraints for table `accreditation_documents`
--
ALTER TABLE `accreditation_documents`
  ADD CONSTRAINT `accreditation_documents_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `accreditation_application` (`application_id`) ON DELETE CASCADE;

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cso_evaluations`
--
ALTER TABLE `cso_evaluations`
  ADD CONSTRAINT `cso_evaluations_ibfk_1` FOREIGN KEY (`cso_id`) REFERENCES `cso_chairperson` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cso_representative`
--
ALTER TABLE `cso_representative`
  ADD CONSTRAINT `cso_representative_ibfk_1` FOREIGN KEY (`cso_name`) REFERENCES `cso_chairperson` (`cso_name`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `milestones`
--
ALTER TABLE `milestones`
  ADD CONSTRAINT `milestones_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `milestone_tasks`
--
ALTER TABLE `milestone_tasks`
  ADD CONSTRAINT `milestone_tasks_ibfk_1` FOREIGN KEY (`milestone_id`) REFERENCES `milestones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `milestone_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`cso_id`) REFERENCES `cso_chairperson` (`id`);

--
-- Constraints for table `project_cso`
--
ALTER TABLE `project_cso`
  ADD CONSTRAINT `project_cso_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_cso_ibfk_2` FOREIGN KEY (`cso_id`) REFERENCES `cso_chairperson` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proposal`
--
ALTER TABLE `proposal`
  ADD CONSTRAINT `fk_proposal_cso_representative` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `proposal_ibfk_1` FOREIGN KEY (`cso_representative_id`) REFERENCES `cso_representative` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tasks_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_dependencies`
--
ALTER TABLE `task_dependencies`
  ADD CONSTRAINT `task_dependencies_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_dependencies_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_dependencies_ibfk_3` FOREIGN KEY (`predecessor_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
