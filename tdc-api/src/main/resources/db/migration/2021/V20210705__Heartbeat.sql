CREATE TABLE `Heartbeat` (
   `uuid` char(36) NOT NULL,
   `acceptTime` datetime(6) DEFAULT NULL,
   `payload` varchar(255) DEFAULT NULL,
   `sourceIP` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`uuid`)
) ;