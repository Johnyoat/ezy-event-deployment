/*
 Navicat Premium Data Transfer

 Source Server         : aws-cloud
 Source Server Type    : PostgreSQL
 Source Server Version : 150005 (150005)
 Source Host           : ezy-db.ciyrfaxxwizn.us-east-2.rds.amazonaws.com:5432
 Source Catalog        : ezyevents
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150005 (150005)
 File Encoding         : 65001

 Date: 26/03/2024 11:58:16
*/


-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS "bookings";
CREATE TABLE "bookings" (
  "id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "schedule_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "user_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of bookings
-- ----------------------------
BEGIN;
INSERT INTO "bookings" ("id", "schedule_id", "created_at", "updated_at", "user_id") VALUES ('7c9ee344-a176-11ee-879e-367dda299f46', '23329824-8da7-11ee-8672-acde48001122', '2023-12-23 03:34:36.406482', '2023-12-23 03:34:36.406482', '3');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS "categories";
CREATE TABLE "categories" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "icon_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('2', 'Graduation', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/graduation_vxl600.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('3', 'Birthday', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/birthday_lvouod.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('1', 'Awards', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/awards_duum0c.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('4', 'Meeting', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/meeting_w4zciu.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('5', 'Reunion', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/reunion_kacohy.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('6', 'Party', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/reunion_kacohy.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('7', 'Gallery', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/reunion_kacohy.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('9', 'Science Fair', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/reunion_kacohy.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('10', 'Out door', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/reunion_kacohy.svg');
INSERT INTO "categories" ("id", "name", "icon_url") VALUES ('11', 'Hackathon', 'https://res.cloudinary.com/plartfomx/image/upload/v1665643685/icons/reunion_kacohy.svg');
COMMIT;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS "comments";
CREATE TABLE "comments" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "message" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "event_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS "events";
CREATE TABLE "events" (
  "id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar COLLATE "pg_catalog"."default",
  "summary" varchar COLLATE "pg_catalog"."default",
  "details" varchar COLLATE "pg_catalog"."default",
  "images" varchar[][] COLLATE "pg_catalog"."default",
  "banner" varchar COLLATE "pg_catalog"."default",
  "lat" float4,
  "lng" float4,
  "location_name" varchar(255) COLLATE "pg_catalog"."default",
  "category_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "date" int8,
  "price" float4,
  "org_id" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of events
-- ----------------------------
BEGIN;
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('ab54a04e-fd38-11ed-ac8f-acde48001122', 'Engineering Hackathon: Grad School Edition', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/x-kwzWjTnDPLk-unsplash.jpg?alt=media&token=27ea935f-04e6-455e-a115-155a9cccc091', -93.99782, 44.14841, 'Wissink Hall, Wiecking Center', '11', 1725044400000, 0, NULL);
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('bc083e5a-fd38-11ed-ac8f-acde48001122', 'Building a Chatbot with Tensorflow', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/ai.png?alt=media&token=4e224720-77ec-44de-ad22-eba080a1e740', -93.99853, 44.148052, 'Morisson Hall', '9', 1727186400000, 0, NULL);
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('d0b866b8-fd38-11ed-ac8f-acde48001122', 'Enterprenuership in the 21st Century', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/meeting2.jpg?alt=media&token=30b7db8e-3d4d-44fd-8902-6df3881b7177', -93.99843, 44.14546, 'Otto Recreation Center', '4', 1722524400000, 0, NULL);
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('c928b2c2-fd38-11ed-ac8f-acde48001122', 'Wine & Dine party for First years', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/reunion2.jpg?alt=media&token=53af37cd-2acc-4239-bb97-252275e8bbb4', -93.999916, 44.14669, 'Centennial Student Union', '5', 1723752000000, 0, NULL);
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('d8a9c0ec-fd38-11ed-ac8f-acde48001122', 'Spring Graduation 24/25', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/grad2.jpg?alt=media&token=5225d4f7-9ea6-4a9a-b6e4-882eacbc6c27', -93.99559, 44.145573, 'EMMALINE POLSON', '2', 1728745200000, 0, NULL);
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('693fde40-7ba9-11ee-9917-acde48001122', 'Abstract Art Show', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/art-show.jpg?alt=media&token=cd459a3e-8083-4aee-8309-3c59e8d83a76', -93.999916, 44.14669, 'Centennial Student Union', '7', 1731607200000, 0, '84ed78a4-8dbb-11ee-8267-acde48001122');
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('7c45df12-7ba9-11ee-9dc0-acde48001122', 'African Student Cookout', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/bbe.jpg?alt=media&token=4e0c7db9-fefb-4168-b585-9de812f6a4a8', -93.999916, 44.14669, 'Centennial Student Union', '10', 1734213600000, 0, NULL);
INSERT INTO "events" ("id", "name", "summary", "details", "images", "banner", "lat", "lng", "location_name", "category_id", "date", "price", "org_id") VALUES ('bbd93062-7ba8-11ee-9f4d-acde48001122', 'EDM Concert', 'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in ', '{"",""}', 'https://firebasestorage.googleapis.com/v0/b/ezyevents.appspot.com/o/edm.jpg?alt=media&token=dc358da2-753f-422a-bb72-9e7da8f322c9', -93.999916, 44.14669, 'Centennial Student Union', '6', 1735430400000, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for organizations
-- ----------------------------
DROP TABLE IF EXISTS "organizations";
CREATE TABLE "organizations" (
  "id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(225) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "banner_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "org_image_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of organizations
-- ----------------------------
BEGIN;
INSERT INTO "organizations" ("id", "name", "user_id", "created_at", "updated_at", "banner_url", "org_image_url") VALUES ('84ed78a4-8dbb-11ee-8267-acde48001122', 'Great Gatzby Show blizz', '6', '2023-11-28 06:58:22.362203+00', '2023-11-28 06:58:22.362203+00', '', '');
COMMIT;

-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS "schedules";
CREATE TABLE "schedules" (
  "id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "event_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "org_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "date" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6) NOT NULL,
  "created_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Records of schedules
-- ----------------------------
BEGIN;
INSERT INTO "schedules" ("id", "event_id", "org_id", "date", "updated_at", "created_at") VALUES ('23329824-8da7-11ee-8672-acde48001122', '693fde40-7ba9-11ee-9917-acde48001122', '84ed78a4-8dbb-11ee-8267-acde48001122', '2023-11-22 06:00:00+00', '2023-11-28 04:32:28.463732+00', '2023-11-28 04:32:28.463732+00');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "first_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "profile_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "dob" int8 NOT NULL
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('3', 'Yang Yuning', 'Yang Yuning', 'yyang8@mail.com', '212-275-0461', 'https://video.daizita89.xyz/CDsVinyl', 438);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('4', 'Wada Ryota', 'Wada Ryota', 'ryota7@outlook.com', '28-3606-3358', 'https://www.sohuimei.org/HouseholdKitchenAppliances', 815);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('5', 'Arai Ryota', 'Arai Ryota', 'ryotaarai@mail.com', '11-149-2477', 'https://image.yuning92.co.jp/AppsGames', 310);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('6', 'Marcus Hunter', 'Marcus Hunter', 'marcus99@gmail.com', '28-0006-6923', 'https://drive.ayato706.xyz/Books', 805);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('7', 'Tsui Ching Wan', 'Tsui Ching Wan', 'cwtsui@icloud.com', '212-584-0888', 'http://drive.lanl2.org/Beauty', 320);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('8', 'Hu Shihan', 'Hu Shihan', 'shihanhu@mail.com', '(20) 0695 8196', 'https://auth.yunxichan2013.biz/CellPhonesAccessories', 898);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('9', 'Jia Rui', 'Jia Rui', 'jiaru1994@hotmail.com', '(151) 059 7273', 'https://www.zhenp.com/AppsGames', 75);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('10', 'Joyce Ellis', 'Joyce Ellis', 'ellisjoyc522@icloud.com', '11-685-7556', 'http://www.aoo.us/Baby', 537);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('11', 'Lu Rui', 'Lu Rui', 'lurui5@icloud.com', '90-3870-2671', 'https://image.hushihan.info/Food', 132);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('12', 'Zheng Yunxi', 'Zheng Yunxi', 'yunxi8@yahoo.com', '838-411-6631', 'http://image.chenz2.net/Beauty', 48);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('13', 'Ono Sakura', 'Ono Sakura', 'sakuraono@hotmail.com', '66-695-1717', 'https://video.ruwu1968.net/CDsVinyl', 577);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('14', 'Guo Jialun', 'Guo Jialun', 'jiaguo53@icloud.com', '7324 952375', 'http://video.aosasa.net/ToolsHomeDecoration', 673);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('15', 'Nakano Seiko', 'Nakano Seiko', 'seiko89@yahoo.com', '7319 979843', 'http://www.soluis.co.jp/Baby', 937);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('16', 'Sasaki Airi', 'Sasaki Airi', 'airi00@mail.com', '11-778-5082', 'https://auth.dingzhiyuan6.xyz/Appliances', 45);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('17', 'Qin Xiaoming', 'Qin Xiaoming', 'qxiao@icloud.com', '769-179-3627', 'https://video.wuhy2.co.jp/AppsGames', 599);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('18', 'Tam Yun Fat', 'Tam Yun Fat', 'yunfattam@gmail.com', '70-9639-8684', 'https://www.fob210.com/Others', 105);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('19', 'Randy Gibson', 'Randy Gibson', 'rangibson@icloud.com', '330-838-0161', 'https://drive.wfl.com/AutomotivePartsAccessories', 166);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('20', 'Lam Tak Wah', 'Lam Tak Wah', 'twla@outlook.com', '(161) 980 2646', 'http://drive.kmtse.info/VideoGames', 858);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('21', 'Dai Lu', 'Dai Lu', 'dai1@gmail.com', '755-692-1006', 'http://auth.anqi74.net/Appliances', 711);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('22', 'Uchida Yuito', 'Uchida Yuito', 'yuito6@hotmail.com', '769-854-3737', 'http://auth.gol.org/BaggageTravelEquipment', 618);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('23', 'Loui Hok Yau', 'Loui Hok Yau', 'hokyaul@icloud.com', '7322 613139', 'http://image.atakuy8.cn/SportsOutdoor', 990);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('24', 'Chung Kwok Ming', 'Chung Kwok Ming', 'chungkm@outlook.com', '182-4144-7435', 'https://drive.xiuyx.jp/CollectiblesFineArt', 856);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('25', 'Chiang Fu Shing', 'Chiang Fu Shing', 'chiangfushing@icloud.com', '74-992-3108', 'http://video.jzhan.us/PetSupplies', 396);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('26', 'Raymond Collins', 'Raymond Collins', 'craymond@yahoo.com', '194-1250-8390', 'http://www.yilu.com/AutomotivePartsAccessories', 672);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('27', 'Ye Jiehong', 'Ye Jiehong', 'yejiehong@gmail.com', '74-612-5805', 'http://www.ryam96.co.jp/IndustrialScientificSupplies', 803);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('28', 'Otsuka Airi', 'Otsuka Airi', 'airiotsuk8@gmail.com', '(1223) 83 7236', 'https://video.wingsze9.net/HealthBabyCare', 395);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('29', 'Pang Lai Yan', 'Pang Lai Yan', 'laiyan1121@gmail.com', '312-715-1721', 'https://video.ruitang.org/SportsOutdoor', 315);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('30', 'Helen Garza', 'Helen Garza', 'helen122@gmail.com', '21-2763-1608', 'https://auth.ishitsu1218.biz/CellPhonesAccessories', 856);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('31', 'Kong On Kay', 'Kong On Kay', 'onkay44@gmail.com', '90-2867-2137', 'http://www.xiong126.xyz/ClothingShoesandJewelry', 790);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('32', 'Marjorie Rogers', 'Marjorie Rogers', 'rogersmar8@gmail.com', '(1865) 07 3950', 'http://image.kudmai.com/Food', 648);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('33', 'Lu Anqi', 'Lu Anqi', 'luanqi@icloud.com', '3-8440-5536', 'https://image.matsumotohik.net/AppsGames', 701);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('34', 'Arimura Hina', 'Arimura Hina', 'arimhi@outlook.com', '755-708-4047', 'http://auth.danrussell.net/Books', 551);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('35', 'Nomura Hikari', 'Nomura Hikari', 'hikarin@gmail.com', '146-5274-8753', 'http://drive.juditmor20.co.jp/MusicalInstrument', 130);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('36', 'Sarah Sanders', 'Sarah Sanders', 'sanders7@icloud.com', '90-3372-0304', 'http://auth.kwokwingko.xyz/MusicalInstrument', 487);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('37', 'Ando Ayano', 'Ando Ayano', 'ayando7@outlook.com', '(151) 689 7730', 'https://image.akinakikuchi.com/CollectiblesFineArt', 47);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('38', 'Yamaguchi Rin', 'Yamaguchi Rin', 'riny@hotmail.com', '5074 297778', 'https://video.smurata1113.org/Food', 993);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('39', 'Joyce Martin', 'Joyce Martin', 'martin7@outlook.com', '70-6333-6703', 'http://www.hoyinchic.us/ClothingShoesandJewelry', 115);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('40', 'Kathy Young', 'Kathy Young', 'yokathy905@yahoo.com', '52-839-6270', 'http://auth.luyu.net/Beauty', 776);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('41', 'Kaneko Hana', 'Kaneko Hana', 'hanakaneko@icloud.com', '10-7731-2197', 'https://video.dorishill4.info/SportsOutdoor', 9);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('42', 'Julia Guzman', 'Julia Guzman', 'gj819@mail.com', '21-519-5030', 'https://video.tanakam50.biz/Handcrafts', 400);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('43', 'Wu Sai Wing', 'Wu Sai Wing', 'saiwingwu4@icloud.com', '7241 531966', 'http://www.hat52.info/AutomotivePartsAccessories', 57);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('44', 'Wan Tak Wah', 'Wan Tak Wah', 'takwahwan1225@gmail.com', '132-9548-4991', 'http://drive.zitaz1120.cn/IndustrialScientificSupplies', 710);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('45', 'Keith Simpson', 'Keith Simpson', 'keis10@hotmail.com', '312-938-5678', 'http://www.fuxiu.jp/CellPhonesAccessories', 631);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('46', 'Takada Nanami', 'Takada Nanami', 'ntakada@gmail.com', '183-3773-5862', 'https://video.tjanet.jp/AutomotivePartsAccessories', 372);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('47', 'Koo Sze Yu', 'Koo Sze Yu', 'sykoo806@outlook.com', '21-953-0652', 'https://video.lzhennan.com/SportsOutdoor', 505);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('48', 'Kimura Sara', 'Kimura Sara', 'kimsar@outlook.com', '70-7390-5104', 'https://drive.ssato325.net/Books', 750);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('49', 'Luo Lan', 'Luo Lan', 'lanl7@outlook.com', '769-207-4536', 'http://image.cujia.org/Food', 528);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('50', 'Maeda Aoi', 'Maeda Aoi', 'aoim@gmail.com', '5748 773814', 'http://auth.kmf03.jp/ArtsHandicraftsSewing', 278);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('51', 'Arimura Minato', 'Arimura Minato', 'arimura7@icloud.com', '(161) 117 8772', 'https://drive.ishnanami.biz/HouseholdKitchenAppliances', 43);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('52', 'Kwong On Kay', 'Kwong On Kay', 'onkw@icloud.com', '80-8096-7001', 'http://drive.nancy6.com/CenturionGardenOutdoor', 199);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('53', 'Yamazaki Ren', 'Yamazaki Ren', 'renyama8@gmail.com', '769-099-3032', 'https://www.herrwe.org/Handcrafts', 971);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('54', 'Sasaki Hikaru', 'Sasaki Hikaru', 'hikarusasaki@icloud.com', '7783 489594', 'http://video.yaaoi.cn/HealthBabyCare', 219);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('55', 'Sheila Ross', 'Sheila Ross', 'sheilaro43@outlook.com', '755-634-2012', 'http://video.kasumk.cn/FilmSupplies', 580);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('56', 'Wang Xiaoming', 'Wang Xiaoming', 'wang7@gmail.com', '330-415-5681', 'http://video.clarencehughes.info/PetSupplies', 726);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('57', 'Kwok Wing Fat', 'Kwok Wing Fat', 'wingkwok@gmail.com', '70-4599-8978', 'https://video.mingli.org/VideoGames', 970);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('58', 'Wendy Cooper', 'Wendy Cooper', 'cooper6@outlook.com', '838-790-4708', 'http://auth.olsoneric.org/BaggageTravelEquipment', 981);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('59', 'Tang Sum Wing', 'Tang Sum Wing', 'sumwing10@icloud.com', '21-942-1307', 'https://auth.nmiu1128.xyz/Others', 162);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('60', 'Takeda Mai', 'Takeda Mai', 'mtakeda@hotmail.com', '(20) 0321 1173', 'http://video.bphil.us/ComputersElectronics', 759);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('61', 'Matsumoto Ren', 'Matsumoto Ren', 'renmatsumoto@outlook.com', '11-528-1873', 'https://auth.yuisato7.jp/CollectiblesFineArt', 276);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('62', 'Heather Brooks', 'Heather Brooks', 'brheather@mail.com', '20-3196-4317', 'https://www.jianglan10.biz/ClothingShoesandJewelry', 458);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('63', 'Nishimura Mio', 'Nishimura Mio', 'mionishi59@yahoo.com', '(151) 377 4870', 'http://video.takwahl70.biz/Books', 702);
INSERT INTO "users" ("id", "first_name", "last_name", "email", "phone", "profile_url", "dob") VALUES ('64', 'Sakurai Airi', 'Sakurai Airi', 'aisaku5@yahoo.com', '614-418-3460', 'http://video.wingszeha.com/ComputersElectronics', 621);
COMMIT;

-- ----------------------------
-- Primary Key structure for table bookings
-- ----------------------------
ALTER TABLE "bookings" ADD CONSTRAINT "booking_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table categories
-- ----------------------------
ALTER TABLE "categories" ADD CONSTRAINT "event_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table comments
-- ----------------------------
ALTER TABLE "comments" ADD CONSTRAINT "comment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table events
-- ----------------------------
CREATE INDEX "evenet id" ON "events" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table events
-- ----------------------------
ALTER TABLE "events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table organizations
-- ----------------------------
ALTER TABLE "organizations" ADD CONSTRAINT "organization_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table schedules
-- ----------------------------
ALTER TABLE "schedules" ADD CONSTRAINT "event_schedule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
