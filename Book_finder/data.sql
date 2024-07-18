DELIMITER $$

DROP VIEW IF EXISTS `book_finder`.`mycart`$$

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mycart` AS (select `books`.`bookid` AS `bookid`,`books`.`book_name` AS `book_name`,`books`.`author` AS `author`,`books`.`book_subject` AS `book_subject`,`books`.`publisher` AS `publisher`,`books`.`isbn` AS `isbn`,`books`.`price` AS `price`,`cart`.`cartid` AS `cartid`,`cart`.`email` AS `email`,`cart`.`booking_date` AS `booking_date`,`cart`.`order_status` AS `order_status` from (`books` join `cart` on(`books`.`bookid` = `cart`.`bookid`)))$$

DELIMITER ;