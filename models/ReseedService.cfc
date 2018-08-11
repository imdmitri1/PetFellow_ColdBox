component accessors="true"{

	public ReseedService function init(){
		return this;
	}

	public void function seed(){
		transaction{
			// how to delete users and all dependent tables
			// default time isn't local ?????
			queryExecute("
				DROP TABLE IF EXISTS Users
				"
			);

			queryExecute("
				CREATE TABLE Users (
					id INTEGER PRIMARY KEY,
				  username VARCHAR(32) NOT NULL,
				  email VARCHAR(32) NOT NULL,
				  hashed_password VARCHAR(128) NOT NULL,
				  admin BOOLEAN DEFAULT false,
				  avatar VARCHAR(256),
				  bio VARCHAR(512),
				  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP
				)
				"
			);

			queryExecute("
				INSERT INTO Users (username,email,hashed_password,admin,avatar,bio)
				VALUES ('bob','bob@mail.com','qwertyuiop','true','https://api.adorable.io/avatars/1000','hello'),
							 ('qqq','bob@mail.com','qwertyuiop','true','https://api.adorable.io/avatars/1000','hello'),
							 ('asdf','bob@mail.com','qwertyuiop','true','https://api.adorable.io/avatars/1000','hello')
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS Posts
				"
			);

			queryExecute("
				CREATE TABLE Posts (
				  id INTEGER PRIMARY KEY,
				  description VARCHAR(512),
				  pic_link VARCHAR(256),
				  author_id INT,
				  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP,
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO Posts (description, pic_link, author_id)
				VALUES ('asdfkljasdlkfj','https://api.adorable.io/avatars/1000',1),
							 ('asdfkljasdlkfjasdfasfwqf', 'https://api.adorable.io/avatars/1000',1),
							 ('asdfkljasdlkfjasdfasfwqf', 'https://api.adorable.io/avatars/1000',2)
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS FavoritePosts
				"
			);

			queryExecute("
				CREATE TABLE FavoritePosts (
				  id INTEGER PRIMARY KEY,
				  post_id INT,
				  user_id INT,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP,
					FOREIGN KEY (post_id) REFERENCES Posts(id),
					FOREIGN KEY (user_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO FavoritePosts (post_id, user_id)
				VALUES (1,2),
							 (1,1),
							 (1,3)
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS Comments
				"
			);

			queryExecute("
				CREATE TABLE Comments (
				  id INTEGER PRIMARY KEY,
				  content VARCHAR(512),
				  post_id INT,
				  author_id INT,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP,
					FOREIGN KEY (post_id) REFERENCES Posts(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO Comments (post_id, author_id, content)
				VALUES (1,2,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis vita fuga, eos qui provident? Ratione, architecto.'),
							 (1,1,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates  sunt nulla hic eum enim quam, dolor delectus quos beatae magni!'),
							 (1,3,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa soluta expedita, dolor aspernatur alias et perspiciatis error corrupti!')
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS PostLikes
				"
			);

			queryExecute("
				CREATE TABLE PostLikes (
				  id INTEGER PRIMARY KEY,
				  value INT,
					post_id INT,
				  author_id INT,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP,
					FOREIGN KEY (post_id) REFERENCES Posts(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO PostLikes (post_id, author_id, value)
				VALUES (1,2,1),
							 (1,1,1),
							 (1,3,1)
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS CommentLikes
				"
			);

			queryExecute("
				CREATE TABLE CommentLikes (
				  id INTEGER PRIMARY KEY,
				  value INT,
					comment_id INT,
				  author_id INT,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP,
					FOREIGN KEY (comment_id) REFERENCES Comments(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO CommentLikes (comment_id, author_id, value)
				VALUES (1,2,1),
							 (1,1,1),
							 (1,3,1)
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS Messages
				"
			);

			queryExecute("
				CREATE TABLE Messages (
				  id INTEGER PRIMARY KEY,
				  content VARCHAR(256),
				  message_seen BOOLEAN,
				  author_id INT,
				  receiver_id INT,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP,
					FOREIGN KEY (receiver_id) REFERENCES Users(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO Messages (author_id, receiver_id, message_seen, content)
				VALUES (1,2,'false','Lorem ipsum dolor sit amet, consectetur .'),
							 (2,1,'false','L dolor sit amet, consectetur adipisicing eli!'),
							 (1,3,'false','Lorem ipsum dolor sit amet, consectetur adipisicing eliti!')
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS Follows
				"
			);

			queryExecute("
				CREATE TABLE Follows (
				  id INTEGER PRIMARY KEY,
				  follower_id INT,
				  following_id INT,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
				  updated_at TIMESTAMP,
					FOREIGN KEY (follower_id) REFERENCES Users(id),
					FOREIGN KEY (following_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO Follows (follower_id,following_id)
				VALUES (1,2),
							 (2,1),
							 (1,3)
				"
			);

		}
	}
}
