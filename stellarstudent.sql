-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2021 at 12:45 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stellarstudent`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `certificate_id` int(11) NOT NULL,
  `certificate_type_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `certificate_date` date NOT NULL,
  `cerficate_place` varchar(100) NOT NULL,
  `event_name` varchar(250) NOT NULL,
  `price_won` varchar(300) NOT NULL,
  `certificate_detail` text NOT NULL,
  `certificate_file` varchar(300) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificate`
--

INSERT INTO `certificate` (`certificate_id`, `certificate_type_id`, `student_id`, `certificate_date`, `cerficate_place`, `event_name`, `price_won`, `certificate_detail`, `certificate_file`, `note`, `status`) VALUES
(9, 2, 224, '2019-06-11', 'BVRITH ', 'Hour of code', 'Participation certificate', '', '1154733665hour_of_code_certificate.jpg', 'Congrats!', 'Accept'),
(15, 11, 227, '2020-06-17', 'SIH- BVRITH', 'Smart India Hackathon 2020', '', 'Team Techgoals', '1308139124Sih.pdf', 'Good', 'Accept'),
(16, 10, 227, '2018-10-15', 'NPTEL', 'The Joy of Computing using Python', '81%', '', '1355387356python.pdf', 'Good', 'Accept'),
(17, 12, 227, '2018-10-03', 'FOSS ASIA', 'Jugaad Fest', '', '', '999940896N.HARSHINI_FOSSASIA Certificate Of Participation.pdf', '', 'Pending'),
(18, 10, 225, '2020-08-05', 'Georgia Institute of Technology', 'Coursera', '', 'Build your professional ePortfolio in English', '318470756Coursera ePortFolio.pdf', '', 'Pending'),
(19, 4, 225, '2020-06-16', 'BVRITH', 'Medhanvesh', '95%', 'Online python Quiz', '1100648069Certificate for Python Basics.pdf', '', 'Pending'),
(20, 10, 225, '2020-05-12', 'University of London', 'Coursera', '', 'Responsive Website Basics: Code with HTML, CSS, and JavaScript', '1940617661Coursera HTML CSS.pdf', 'Very good', 'Accept'),
(21, 10, 226, '2021-04-02', 'NDG ', ' Linux Unhatched course', '', 'Issued by NDG X Cisco Networking Academy', '1611209522SrividyaGhanta-NDG Linux Unhatc-certificate.pdf', '', 'Pending'),
(22, 10, 226, '2021-04-17', 'SoloLearn', 'Python Core', '', '', '1512221918cert-21315151-1073.pdf', 'Good', 'Accept'),
(23, 11, 226, '2020-09-14', 'Flipr', 'Flipr Hackathon 6.0', '', 'Team Gladiators - Machine Learning task', '532574364GLADIATORS.jpg', '', 'Pending'),
(24, 10, 231, '2020-01-05', 'Coursera', 'Introduction to Psychology', '', '', '1479211297Coursera MWDVBCKC28DF.pdf', 'Thoughtful topic', 'Accept'),
(25, 7, 233, '2019-09-29', 'Aliens Fest X GITAMS Hyderabad College', 'Fill stack web development', '', '', '547803196final aliens fest certifiate.jpg', '', 'Pending'),
(26, 10, 233, '2020-07-25', 'edX IBM', 'ML0101EN: Machine Learning with Python: A Practical Introduction', '', '', '1281926055EDX IBM MLCertificate.pdf', '', 'Pending'),
(27, 9, 233, '2020-06-02', 'Flipkart', '#GirlsWannaCode Program', '', 'Scholarship Certificate', '1700648588GWC_Scholar Flipkart mentorship.pdf', 'Excellent', 'Accept'),
(28, 11, 235, '2021-01-29', 'BVRIT HYDERABAD College of Engineering for Women', 'Medhanvesh-2021', '', '', '840780560WhatsApp Image 2021-05-10 at 08.38.56.jpeg', 'Nice', 'Accept'),
(29, 4, 235, '2020-05-30', 'Indian Servers', 'Python Programming E-Quiz', 'In Top 30%', '', '1887925723WhatsApp Image 2021-05-10 at 08.41.19.jpeg', '', 'Pending'),
(30, 7, 232, '2020-02-27', 'Developers Circle from Facebook Hyderabad', 'Internet of Things', '', '', '1994616076590.pdf', 'Good', 'Accept'),
(31, 7, 231, '2020-02-27', 'Developer Circles from Facebook Hyderabad', 'IOT', '', '', '1164618178572.pdf', 'Mention full event name', 'Reject');

-- --------------------------------------------------------

--
-- Table structure for table `certificate_type`
--

CREATE TABLE `certificate_type` (
  `certificate_type_id` int(11) NOT NULL,
  `certificate_type` varchar(50) NOT NULL,
  `certificate_type_note` text NOT NULL,
  `certificate_type_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificate_type`
--

INSERT INTO `certificate_type` (`certificate_type_id`, `certificate_type`, `certificate_type_note`, `certificate_type_status`) VALUES
(2, 'Coding Contest', 'College Level Coding Contests', 'Active'),
(3, 'Sports & Games', 'Sports & Games like cricket , athletics, hockey, football, etc', 'Active'),
(4, 'Quiz Competition', 'Quiz Competition', 'Active'),
(6, 'Singing Competition', 'Store records of Singing Competition winners', 'Active'),
(7, 'Workshops', 'Enter details about any workshops attended', 'Active'),
(8, 'Cambridge', 'Cambridge English Assessment ', 'Active'),
(9, 'Mentorship Programs', 'Details about mentorships attended like Flipkart, ACMS, Microsoft etc', 'Active'),
(10, 'Online Courses', 'Online courses on platforms like Coursera, EDX, LinkedIn, Google, Udemy, Unschool, Internshala, SoloLearn etc.', 'Active'),
(11, 'Hackathons', 'A hackathon is a design sprint-like event; often, in which computer programmers and others involved in software development, including graphic designers, interface designers, project managers, domain experts, and others collaborate intensively on software projects', 'Active'),
(12, 'Fests', 'Technical or Non-Technical', 'Active'),
(13, 'Others', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` int(10) NOT NULL,
  `student_id1` int(10) NOT NULL,
  `student_id2` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chat_id`, `student_id1`, `student_id2`) VALUES
(4, 229, 220),
(5, 229, 227),
(6, 229, 221),
(7, 232, 220),
(8, 232, 227),
(9, 232, 230),
(10, 232, 229),
(11, 232, 233),
(12, 227, 233),
(13, 232, 226);

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(10) NOT NULL,
  `chat_id` int(10) NOT NULL,
  `group_chat_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `message` text NOT NULL,
  `message_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `chat_id`, `group_chat_id`, `student_id`, `date`, `time`, `message`, `message_status`) VALUES
(27, 4, 0, 229, '2021-05-15', '07:41:50', 'hi', 'Active'),
(28, 5, 0, 229, '2021-05-15', '08:38:56', 'Hi', 'Active'),
(29, 6, 0, 229, '2021-05-21', '05:49:05', 'hi', 'Active'),
(30, 5, 0, 227, '2021-05-21', '05:51:47', 'hello', 'Active'),
(31, 7, 0, 232, '2021-05-23', '12:51:37', 'hi', 'Active'),
(32, 8, 0, 232, '2021-05-23', '12:53:51', 'hi', 'Active'),
(33, 9, 0, 232, '2021-05-23', '12:54:15', 'Hiii', 'Active'),
(34, 10, 0, 232, '2021-05-23', '12:54:22', 'Hi raga', 'Active'),
(35, 10, 0, 229, '2021-05-23', '12:56:10', 'Hi sravya', 'Active'),
(36, 0, 9, 233, '2021-05-24', '12:29:06', 'Hi', 'Active'),
(37, 0, 9, 232, '2021-05-24', '12:30:25', '<img src=smile/smile2.gif style=/max-height:250px;max-width:230px;/ >', 'Active'),
(38, 0, 9, 232, '2021-05-24', '12:30:32', 'Hello! Are u attending classes?', 'Active'),
(39, 0, 9, 232, '2021-05-24', '12:30:37', '<img src=smile/smile2.gif style=/max-height:250px;max-width:230px;/ >', 'Active'),
(40, 11, 0, 232, '2021-05-24', '09:01:38', 'Raga', 'Active'),
(41, 11, 0, 232, '2021-05-24', '09:01:45', 'Send me notes', 'Active'),
(42, 0, 9, 227, '2021-05-24', '12:32:16', 'No sravya I have internship', 'Active'),
(43, 12, 0, 227, '2021-05-24', '09:04:06', 'Can u send me assignment', 'Active'),
(44, 12, 0, 233, '2021-05-24', '10:39:54', 'Which subj?', 'Active'),
(45, 11, 0, 233, '2021-05-24', '10:40:11', 'Ok', 'Active'),
(46, 13, 0, 232, '2021-05-25', '03:35:48', 'Hi', 'Active'),
(47, 0, 9, 233, '2021-05-25', '06:09:35', 'Ohh ok harshini', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(10) NOT NULL,
  `course` varchar(25) NOT NULL,
  `course_description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course`, `course_description`, `status`) VALUES
(7, 'CSE', 'Computer Science Engineering', 'Active'),
(8, 'IT', 'Information Technology', 'Active'),
(9, 'ECE', 'Electronics and Communication Engineering', 'Active'),
(10, 'EEE', 'Electronics and Electrical Engineering', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `discussion`
--

CREATE TABLE `discussion` (
  `discussion_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `discussion_title` varchar(100) NOT NULL,
  `discussion_description` text NOT NULL,
  `date_time` datetime NOT NULL,
  `student_id` int(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussion`
--

INSERT INTO `discussion` (`discussion_id`, `course_id`, `semester`, `subject_id`, `discussion_title`, `discussion_description`, `date_time`, `student_id`, `status`) VALUES
(13, 7, '', 96, 'Unit 5 ', '<p>Guys today sir has completed 5th unit!!</p>', '2021-05-23 04:40:25', 233, 'Active'),
(14, 7, '', 102, 'Oracle Drive', '<p>Does anyone know the crieteria for Oracle company drive?</p>', '2021-05-24 12:36:10', 227, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_reply`
--

CREATE TABLE `discussion_reply` (
  `discussion_reply_id` int(10) NOT NULL,
  `discussion_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussion_reply`
--

INSERT INTO `discussion_reply` (`discussion_reply_id`, `discussion_id`, `student_id`, `user_id`, `message`, `uploads`, `date_time`) VALUES
(11, 12, 227, 0, 'It will be in June 1st week', '', '2021-05-21 09:26:04'),
(12, 12, 232, 0, 'Yeah', '', '2021-05-23 04:20:15'),
(13, 13, 234, 0, 'Woahhhh', '', '2021-05-23 04:40:55'),
(15, 14, 233, 0, '7GPA above', '', '2021-05-25 06:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `group_chat`
--

CREATE TABLE `group_chat` (
  `group_chat_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `semester` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_chat`
--

INSERT INTO `group_chat` (`group_chat_id`, `course_id`, `semester`) VALUES
(9, 7, '');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(10) NOT NULL,
  `notice_type` varchar(25) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `uploads` text NOT NULL,
  `date_time` datetime NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`notice_id`, `notice_type`, `user_id`, `title`, `description`, `uploads`, `date_time`, `status`) VALUES
(22, 'News and Updates', 0, 'Medhanvesh', '<p>&nbsp;Come join us for the&nbsp;national level student\'s tech fest!</p>', '332120734Medhanvesh-2021.jpg', '2021-05-09 01:39:15', 'Active'),
(24, 'Meeting', 8, '4-2 sem exams', '<p>&nbsp;Jntuh to conduct online sem exams</p>', '125892800black-mix-icon-test-trial-check-up-examination-logo-symbol-159889003.jpg', '2021-05-09 11:52:20', 'Active'),
(27, 'Meeting', 2, 'Farewell for 2017-2021 batch ', '<p>&nbsp;I invite all the HODs to join meeting to discuss how to plan farewell celebration for 2017-2021 batch students. We ll discuss possibilities of having the party&nbsp;at college or online.</p>', '1984829089farewell.png', '2021-05-09 03:29:51', 'Active'),
(28, 'Meeting', 0, 'Status of Placed students (IT)', '<p>Meeting will be conducted to know if the placed students are able to manage their internship work along with college activities. Also, to know when will they be tentatively onboarded.</p>', '102983694919368312.jpg', '2021-05-10 08:33:39', 'Active'),
(30, 'Placements', 2, 'Oracle Drive', '<p>&nbsp;Students who are interested can check mail to participate in Oracle drive</p>', '297334897oracle-rac-19c-with-standard-edition-se-2-support-update-1-638.jpg', '2021-05-21 08:43:17', 'Active'),
(31, 'Placements', 2, 'TCS Drive', '<p>&nbsp;Eligible students join TCS drive on 24th May 2021</p>', '828810647K7Eqhxab_400x400.jpg', '2021-05-21 08:47:46', 'Active'),
(32, 'News and Updates', 0, '4-2 Exam fees', '<p>The Last date for paying exam fee without fine is 28-05-2021. &nbsp;</p>\r\n<p>Exam fee per student is 1600/-&nbsp;(800 exam fee, 200 Provisional certificate, 600 Original certificate)</p>', '2788520091580895961_EXAMINATION-FEE.jpg', '2021-05-26 01:53:48', 'Active'),
(33, 'Events', 2, 'Speech Marathon', '<p>&nbsp;Toasmaters event</p>', '294086WhatsApp Image 2021-05-22 at 09.20.14.jpeg', '2021-05-26 01:58:06', 'Active'),
(34, 'Placements', 12, 'Dell Technologies', '<p>&nbsp;Unplaced students may check mail for link to apply for Dell.</p>\r\n<ul style=\"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small; margin-top: 0in;\" type=\"disc\">\r\n<li style=\"margin-left: 0in; color: black;\">\r\n<p><span style=\"font-size: 10.5pt; font-family: \'Segoe UI\', sans-serif; color: windowtext;\">Eligibility -&nbsp;</span><span style=\"font-size: 10pt; font-family: Arial, sans-serif;\">60% or 6 CGPA in 10<sup>th</sup>, 12<sup>th</sup>&nbsp;and Graduation throughout</span></p>\r\n</li>\r\n</ul>', '361545255Dell_logo_2016.svg.png', '2021-05-26 02:02:32', 'Active'),
(35, 'Placements', 12, 'Ivy Software', '<p>&nbsp;Check mail to apply for Ivy Software.</p>\r\n<p>Last date- 28th May. Salary -8LPA</p>', '1889117649social-logo.jpg', '2021-05-26 02:06:54', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `quiz_question_id` int(10) NOT NULL,
  `quiz_id` int(10) NOT NULL,
  `question` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `correct_ans` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`quiz_question_id`, `quiz_id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_ans`, `status`) VALUES
(79, 37, 'Which of the following is generally used for performing tasks like creating the structure of the relations, deleting relation?', 'DML(Data Manipulation Language)', 'Query', 'Relational Schema', 'DDL(Data Definition Language)', 'Option 4', 'Active'),
(80, 37, 'Which of the following provides the ability to query information from the database and insert tuples into, delete tuples from, and modify tuples in the database?', 'DML', 'DDL', 'Query', 'Relational Schema', 'Option 1', 'Active'),
(81, 37, 'The given Query can also be replaced with_______:\r\n\r\nSELECT name, course_id  \r\nFROM instructor, teaches  \r\nWHERE instructor_ID= teaches_ID;  ', 'Select name,course_id from teaches,instructor where instructor_id=course_id;', 'Select name, course_id from instructor natural join teaches;', 'Select name, course_id from instructor;', 'Select course_id from instructor join teaches;', 'Option 2', 'Active'),
(82, 37, 'What do you mean by one to many relationships?', 'One class may have many teachers ', 'One teacher can have many classes ', 'Many classes may have many teachers ', 'Many teachers may have many classes', 'Option 2', 'Active'),
(83, 37, 'A Database Management System is a type of _________software', 'It is a type of system software', 'It is a kind of application software', 'It is a kind of general software', 'Both A and C', 'Option 1', 'Active'),
(84, 38, 'What is Software', 'Software is documentation and configuration of data  ', 'Software is set of programs  ', 'Software is set of programs, documentation & configuration of data ', ' None of the mentioned', 'Option 3', 'Active'),
(85, 38, 'RAD stands for?', 'Relative Application Development', 'Rapid Application Development', 'Rapid Application Document', 'None of the mentioned', 'Option 2', 'Active'),
(86, 38, 'SDLC stands for?', 'Software Development Life Cycle', ' System Development Life cycle', ' Software Design Life Cycle', 'System Design Life Cycle', 'Option 1', 'Active'),
(87, 38, 'Which model can be selected if user is involved in all the phases of SDLC?', 'Waterfall Model', 'Prototyping Model', ' RAD Model', 'both Prototyping Model & RAD Model', 'Option 3', 'Active'),
(88, 38, ' “Software engineers should not use their technical skills to misuse other people’s computers.”Here the term misuse refers to:', 'Unauthorized access to computer material', 'Unauthorized modification of computer material', 'Dissemination of viruses or other malware', 'All of the mentioned', 'Option 4', 'Active'),
(89, 39, 'Organization structure primarily refers to ________', 'how activities are coordinated & controlled ', 'how resources are allocated', ' the location of departments and office space', 'the policy statements developed by the firm', 'Option 1', 'Active'),
(90, 39, 'Which of the following is not an important aspect of employee involvement?', 'Employee motivation', 'Employee empowerment', 'Team and Teamwork', 'Keeping employee morale down', 'Option 4', 'Active'),
(91, 39, 'According to Herzberg, which of the following is a maintenance factor?', 'Salary', 'Work itself', 'Responsibility', 'Recognition', 'Option 4', 'Active'),
(92, 39, 'Communication begins with', 'encoding', 'idea origination', ' decoding', 'channel selection', 'Option 2', 'Active'),
(93, 39, 'A study of the culture and practises in different societies is called', 'Personality', 'Anthropology', 'Perception', 'Attitude', 'Option 2', 'Active'),
(94, 40, 'Process of inserting an element in stack is called __________', 'Create', 'Push ', 'Evaluation ', 'Pop', 'Option 2', 'Active'),
(95, 40, 'In a stack, if a user tries to remove an element from an empty stack it is called _______', ' Underflow', ' Empty collection', 'Overflow ', 'Garbage Collection', 'Option 1', 'Active'),
(96, 40, 'Entries in a stack are “ordered”. What is the meaning of this statement?', ' A collection of stacks is sortable', 'Stack entries may be compared with the ‘<‘ operation', 'The entries are stored in a linked list', 'There is a Sequential entry that is one by one', 'Option 4', 'Active'),
(97, 40, 'Consider the usual algorithm for determining whether a sequence of parentheses is balanced. The maximum number of parentheses that appear on the stack AT ANY ONE TIME when the algorithm analyzes: (()(())(()))?', '1', '2', '3', '4', 'Option 3', 'Active'),
(98, 40, 'What is the value of the postfix expression 6 3 2 4 + – *?', '1', '40', '74', '-18', 'Option 4', 'Active'),
(99, 42, 'What is the time complexity of the brute force algorithm used to find the longest common subsequence?', 'O(n) ', 'O(n2)', 'O(n3)', 'O(2n)', 'Option 4', 'Active'),
(100, 42, 'Longest common subsequence is an example of ____________', 'Greedy algorithm', '2D dynamic programming', '1D dynamic programming', 'Divide and conquer', 'Option 2', 'Active'),
(101, 42, 'Consider the strings “PQRSTPQRS” and “PRATPBRQRPS”. What is the length of the longest common subsequence?', '9', '8', '7', '6', 'Option 3', 'Active'),
(102, 42, 'Which of the following methods can be used to solve the longest common subsequence problem?', 'Recursion', 'Dynamic programming', ' Both recursion and dynamic programming ', 'Greedy algorithm', 'Option 3', 'Active'),
(103, 43, 'What is testing process’ first goal?', ' Bug prevention', 'Testing ', 'Execution ', 'Analyses', 'Option 1', 'Active'),
(104, 43, 'Test should be conducted for every possible __________', 'data', 'case', 'variable', 'all of the mentioned', 'Option 4', 'Active'),
(105, 43, 'Which of the following is not a part of bug report?', 'Test Case', 'Output', 'Software Version', 'LOC', 'Option 4', 'Active'),
(106, 43, 'Which of the following is the way of ensuring that the tests are actually testing code?', 'Control structure testing', 'Complex path testing', 'Code coverage', 'Quality assurance of software', 'Option 3', 'Active'),
(107, 44, 'Consider the strings “PQRSTPQRS” and “PRATPBRQRPS”. What is the length of the longest common subsequence?\r\n', '9', '8', '7', '6', 'Option 3', 'Active'),
(109, 44, ' Which of the following methods can be used to solve the longest common subsequence problem?', 'Recursion', 'Dynamic programming', ' Both recursion and dynamic programming ', 'Greedy algorithm', 'Option 3', 'Active'),
(110, 44, ' Which of the following problems can be solved using the longest subsequence problem?', 'Longest increasing subsequence', 'Longest palindromic subsequence', 'Longest bitonic subsequence', 'Longest decreasing subsequence', 'Option 2', 'Active'),
(111, 44, 'Which of the following is the longest common subsequence between the strings “hbcfgmnapq” and “cbhgrsfnmq” ?', ' hgmq', 'cfnq ', 'bfmq ', 'fgmna', 'Option 4', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `semester` varchar(25) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `user_id`, `course_id`, `semester`, `subject_id`, `title`, `description`) VALUES
(43, 2, 7, '', 97, 'Debugging Techniques', ''),
(44, 2, 7, '', 106, 'Longest Common Subsequence', '');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_result`
--

CREATE TABLE `quiz_result` (
  `quiz_result_id` int(10) NOT NULL,
  `quiz_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `quiz_question_id` int(10) NOT NULL,
  `selected_option` varchar(10) NOT NULL,
  `correct_ans` varchar(10) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_result`
--

INSERT INTO `quiz_result` (`quiz_result_id`, `quiz_id`, `student_id`, `quiz_question_id`, `selected_option`, `correct_ans`, `date_time`) VALUES
(257, 43, 232, 103, 'Option 3', 'Option 1', '2021-05-25 03:36:06'),
(258, 43, 232, 104, 'Option 4', 'Option 4', '2021-05-25 03:36:10'),
(259, 43, 232, 105, 'Option 4', 'Option 4', '2021-05-25 03:36:13'),
(260, 43, 232, 106, 'Option 3', 'Option 3', '2021-05-25 03:36:17'),
(261, 44, 233, 107, 'Option 3', 'Option 3', '2021-05-25 02:40:12'),
(262, 44, 233, 109, 'Option 3', 'Option 3', '2021-05-25 02:40:18'),
(263, 44, 233, 110, 'Option 2', 'Option 2', '2021-05-25 02:40:31'),
(264, 44, 233, 111, 'Option 4', 'Option 4', '2021-05-25 02:40:36'),
(265, 44, 227, 107, 'Option 1', 'Option 3', '2021-05-25 02:46:13'),
(266, 44, 227, 109, 'Option 3', 'Option 3', '2021-05-25 02:46:22'),
(267, 44, 227, 110, 'Option 3', 'Option 2', '2021-05-25 02:46:24'),
(268, 44, 227, 111, 'Option 2', 'Option 4', '2021-05-25 02:46:29');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(10) NOT NULL,
  `student_name` varchar(25) NOT NULL,
  `roll_no` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `student_img` varchar(100) NOT NULL,
  `batch` int(11) NOT NULL,
  `course_id` int(10) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `about_student` text NOT NULL,
  `email_id` varchar(35) NOT NULL,
  `mob_no` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_name`, `roll_no`, `password`, `student_img`, `batch`, `course_id`, `semester`, `about_student`, `email_id`, `mob_no`, `status`) VALUES
(221, 'Suma', '17wh1a0542', '550e1bafe077ff0b0b67f4e32f29d751', '1387855557pp (2).jpg', 2017, 7, '', '', '17wh1a0542@bvrithyderabad.edu.in', '1234567890', 'Active'),
(224, 'Pravallika', '18wh1a0517', '25d55ad283aa400af464c76d713c07ad', '965161548pp (1).jpg', 2017, 7, '', '', 'pravallika@gmail.com', '1234567890', 'Active'),
(225, 'Rahela M', '17wh1a0595', '25d55ad283aa400af464c76d713c07ad', '1017484285WhatsApp Image 2021-05-07 at 12.39.38.jpeg', 2017, 7, '', '', '17wh1a0595@bvrithyderabad.edu.in', '1234567890', 'Active'),
(226, 'Sri Vidya Ghanta', '17wh1a0534', '25d55ad283aa400af464c76d713c07ad', '1112485976pp.jpg', 2017, 7, '', '', '17wh1a0534@bvrithyderabad.edu.in', '1234567890', 'Active'),
(227, 'Harshini Nandi', '17wh1a05a9', '25d55ad283aa400af464c76d713c07ad', '1962873622pp.jpg', 2017, 7, '', '', '17wh1a05a9@bvrithyderabad.edu.in', '1234567890', 'Active'),
(230, 'Mrudula J', '18wh5a0507', '25d55ad283aa400af464c76d713c07ad', '1315082757dbcb31b2d9e12e9513aa8242f9ee4f9c.jpg', 2018, 7, '', '', '18wh5a0507@bvrithyderabad.edu.in', '1234567890', 'Active'),
(231, 'Saharsha S', '17wh1a0572', '25d55ad283aa400af464c76d713c07ad', '134880953WhatsApp Image 2020-01-27 at 12.49.49 (1).jpeg', 2017, 7, '', 'Hi I am Saharsha', '17wh1a0572@bvrithyderabad.edu.in', '1234567890', 'Active'),
(232, 'Sravya', '17wh1a0590', '25d55ad283aa400af464c76d713c07ad', '1310767000WhatsApp Image 2021-05-19 at 15.58.02.jpeg', 2017, 7, '', '', '17wh1a0590@Bvrithyderabad.edu.in', '1234567890', 'Active'),
(233, 'Raga Rasagna', '17wh1a0599', '25d55ad283aa400af464c76d713c07ad', '2029808466WhatsApp Image 2021-04-30 at 18.20.23.jpeg', 2017, 7, '', '', '17wh1a0599@bvrithyderabad.edu.in', '1234567890', 'Active'),
(234, 'Ashritha', '17wh1a0581', '550e1bafe077ff0b0b67f4e32f29d751', '567414754pp (3).jpg', 2017, 7, '', '', '17wh1a0581@bvrithyderabad.edu.in', '1234567890', 'Active'),
(235, 'Tarani', '17wh1a0576', '25d55ad283aa400af464c76d713c07ad', '401777518WhatsApp Image 2021-05-25 at 18.56.04.jpeg', 2017, 7, '', '', '17wh1a0576@bvrithyderabad.edu.in', '1234567890', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `study_material`
--

CREATE TABLE `study_material` (
  `study_material_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` int(10) NOT NULL,
  `description` text NOT NULL,
  `uploads` text NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `study_material`
--

INSERT INTO `study_material` (`study_material_id`, `course_id`, `semester`, `subject_id`, `title`, `user_id`, `description`, `uploads`, `date_time`) VALUES
(22, 7, '', 96, 'Perspection', 2, '', '1755534686OB- Unit- 1 Introduction.doc', '2021-05-09 09:10:12'),
(23, 7, '', 97, 'Agile', 2, '<p>Unit 1</p>', '1347807677UNIT-I.pdf', '2021-05-09 09:23:22'),
(24, 7, '', 96, 'Unit 2 - Part 2', 2, '', '798582219OB - Unit- 2 (Part-2).doc', '2021-05-10 07:31:05'),
(25, 7, '', 98, 'Stacks Overview', 2, '', '1189955386Screenshot 2021-05-10 080306.png', '2021-05-10 08:03:37'),
(26, 8, '', 99, 'Unit 1 ', 2, '', '229633506OB- Unit- 1 Introduction.doc', '2021-05-13 09:22:13'),
(27, 7, '', 102, 'Java Interview Qs', 2, '', '899532724Java-Interview-Questions.pdf', '2021-05-21 09:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(10) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `course_id` int(10) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject`, `course_id`, `semester`, `note`, `status`) VALUES
(95, 'DBMS', 7, '', 'Database management system', 'Active'),
(96, 'OB', 7, '', 'Organizational Behavior', 'Active'),
(97, 'MSE', 7, '', 'Modern Software Engineering', 'Active'),
(98, 'Data Structures', 7, '', '', 'Active'),
(99, 'OB', 8, '', 'Organizational Behavior', 'Active'),
(100, 'Java', 7, '', '', 'Active'),
(102, 'Placements', 7, '', '', 'Active'),
(103, 'Placements', 8, '', '', 'Active'),
(104, 'Placements', 9, '', '', 'Active'),
(105, 'Placements', 10, '', '', 'Active'),
(106, 'Advanced Algorithms', 7, '', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `timeline_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  `post_type` varchar(20) NOT NULL,
  `text_message` text NOT NULL,
  `image_path` text NOT NULL,
  `video_path` text NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`timeline_id`, `student_id`, `post_type`, `text_message`, `image_path`, `video_path`, `date_time`) VALUES
(13, 232, 'Image', 'Happy Sunday!', '497481923main-qimg-97e92c96e3301bb65838d2872b1be603.jfif', '', '2021-05-23 04:18:59'),
(14, 234, 'Text', 'Hi all', '', '', '2021-05-23 04:33:57'),
(16, 233, 'Image', 'Happy Sunday!', '17386538681620393551050.jfif', '', '2021-05-23 04:38:21'),
(17, 231, 'Image', 'I made these cupcakes last week!!! How are they?', '850194222WhatsApp Image 2021-01-02 at 21.08.58.jpeg', '', '2021-05-24 02:52:19'),
(19, 225, 'Image', 'Exams from June 14th???', '305882648WhatsApp Image 2021-05-24 at 16.16.02.jpeg', '', '2021-05-25 07:18:03');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_comments`
--

CREATE TABLE `timeline_comments` (
  `timeline_comment_id` int(10) NOT NULL,
  `comment_type` varchar(15) NOT NULL,
  `student_id` int(10) NOT NULL,
  `timeline_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeline_comments`
--

INSERT INTO `timeline_comments` (`timeline_comment_id`, `comment_type`, `student_id`, `timeline_id`, `message`, `date_time`) VALUES
(97, 'Comment', 233, 14, 'Hi ashritha\n', '2021-05-24 11:14:55'),
(98, 'Comment', 226, 17, 'Nice Saharsha\n', '2021-05-25 03:40:51'),
(99, 'Comment', 226, 13, 'True Sravya\n', '2021-05-25 03:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_type` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `user_img` text NOT NULL,
  `login_id` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_type`, `name`, `user_img`, `login_id`, `password`, `status`) VALUES
(2, 'Admin', 'bvrith', '127930858question.jpg', 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', 'Active'),
(8, 'Staff', 'Srinivas Reddy', '192088785Dr-SrinivasReddy-HoD-CSE.jpg', 'srinivasreddy', '25d55ad283aa400af464c76d713c07ad', 'Active'),
(9, 'Staff', 'Aruna Rao S L', '', 'arunarao', '25d55ad283aa400af464c76d713c07ad', 'Active'),
(10, 'Staff', 'Anwar Bhasha Pattan', '', 'anwarbhasha', '25d55ad283aa400af464c76d713c07ad', 'Active'),
(11, 'Staff', 'Sunil Kumar C', '', 'sunilkumar', '25d55ad283aa400af464c76d713c07ad', 'Active'),
(12, 'Staff', ' Jagapathi Reddy S', '', 'jpreddy', '25d55ad283aa400af464c76d713c07ad', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`certificate_id`);

--
-- Indexes for table `certificate_type`
--
ALTER TABLE `certificate_type`
  ADD PRIMARY KEY (`certificate_type_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `discussion`
--
ALTER TABLE `discussion`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Indexes for table `discussion_reply`
--
ALTER TABLE `discussion_reply`
  ADD PRIMARY KEY (`discussion_reply_id`);

--
-- Indexes for table `group_chat`
--
ALTER TABLE `group_chat`
  ADD PRIMARY KEY (`group_chat_id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`quiz_question_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `quiz_result`
--
ALTER TABLE `quiz_result`
  ADD PRIMARY KEY (`quiz_result_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `study_material`
--
ALTER TABLE `study_material`
  ADD PRIMARY KEY (`study_material_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`timeline_id`);

--
-- Indexes for table `timeline_comments`
--
ALTER TABLE `timeline_comments`
  ADD PRIMARY KEY (`timeline_comment_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `certificate_type`
--
ALTER TABLE `certificate_type`
  MODIFY `certificate_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `discussion`
--
ALTER TABLE `discussion`
  MODIFY `discussion_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `discussion_reply`
--
ALTER TABLE `discussion_reply`
  MODIFY `discussion_reply_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `group_chat`
--
ALTER TABLE `group_chat`
  MODIFY `group_chat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `quiz_question_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `quiz_result`
--
ALTER TABLE `quiz_result`
  MODIFY `quiz_result_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `study_material`
--
ALTER TABLE `study_material`
  MODIFY `study_material_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `timeline_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `timeline_comments`
--
ALTER TABLE `timeline_comments`
  MODIFY `timeline_comment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
