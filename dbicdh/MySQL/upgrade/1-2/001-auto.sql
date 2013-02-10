-- Convert schema '/data/TryIt/dbicdh/_source/deploy/1/001-auto.yml' to '/data/TryIt/dbicdh/_source/deploy/2/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `pages` (
  `id` char(36) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `content` text NOT NULL,
  `name` varchar(60) NOT NULL,
  INDEX `idx_date_created` (`date_created`),
  INDEX `idx_date_updated` (`date_updated`),
  PRIMARY KEY (`id`)
);

;
SET foreign_key_checks=1;

;

COMMIT;

