component accessors="true"{

	public ReseedService function init(){
		return this;
	}

	public void function seed(){
		transaction{
			//how to delete users and all dependent tables
			queryExecute("
				DROP TABLE IF EXISTS Users
				",
				{},
				{ datasource = "petfellow" }
			);

			queryExecute("
				CREATE TABLE Users (
					id INTEGER PRIMARY KEY, -- AUTOINCREMENT
				  username varchar(32) NOT NULL,
				  email varchar(32) NOT NULL,
				  hashed_password varchar(128) NOT NULL,
				  admin boolean DEFAULT false,
				  avatar varchar(256),
				  bio varchar(512),
				  created_at datetime DEFAULT (datetime(current_timestamp)),
				  updated_at datetime DEFAULT (datetime(current_timestamp))
				)
			",
			{},
			{ datasource = "petfellow" }
			);

			queryExecute("
			INSERT INTO Users (username,email,hashed_password,admin,avatar,bio,created_at,updated_at)
			VALUES ('bob','bob@mail.com','qwertyuiop','true','https://api.adorable.io/avatars/1000','hello',datetime('now'),datetime('now')),
						 ('bob','bob@mail.com','qwertyuiop','true','https://api.adorable.io/avatars/1000','hello',datetime('now'),datetime('now'))
			",
			{},
			{ datasource = "petfellow" }
			);
		}

	}
}

//
// CREATE TABLE favorite_posts (
//   id int AUTO_INCREMENT,
//   post_id int,
//   user_id int,
//   created_at datetime(),
//   updated_at datetime()
// );
//
// CREATE TABLE posts (
//   id int AUTO_INCREMENT,
//   description varchar(512),
//   pic_link varchar(256),
//   author_id int,
//   created_at datetime(),
//   updated_at datetime()
// );
//
// CREATE TABLE comments (
//   id int AUTO_INCREMENT,
//   content varchar(512);
//   post_id int,
//   author_id int,
//   created_at datetime(),
//   updated_at datetime()
// );
//
// CREATE TABLE likes (
//   id int AUTO_INCREMENT,
//   count int,
//   likable_type varchar(16);
//   likable_id int,
//   author_id,
//   created_at datetime(),
//   updated_at datetime()
// );
//
// CREATE TABLE messages (
//   id int AUTO_INCREMENT,
//   content varchar(256),
//   message_seen boolean,
//   author_id int,
//   receiver_id int,
//   created_at datetime(),
//   updated_at datetime()
// );
//
// CREATE TABLE follows (
//   follower_id int,
//   following_id int,
//   created_at datetime(),
//   updated_at datetime()
// );
