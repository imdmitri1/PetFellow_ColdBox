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
