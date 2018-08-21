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
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
				)
				"
			);

			queryExecute("
				INSERT INTO Users (username,email,hashed_password,admin,avatar,bio)
				VALUES
          ('guest','guest@mail.com','123456','true','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','I love pets'),
					('Yvette12','Yvette12@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Quam cumque odio quod et quis voluptas ut'),
					('Reinhold.Corkery11','Reinhold.Corkery11@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Modi id laudantium est numquam'),
					('Edward_Kovacek','Edward_Kovacek@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Quasi aliquid eaque pariatur autem maiores error'),
					('Constantin.Yost50','Constantin.Yost50@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Possimus ipsa natus ullam id enim distinctio reprehenderit voluptatem'),
					('Hulda.Harvey','Hulda.Harvey@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Accusantium dolorem ipsam autem'),
					('Gilberto_Jacobson95','Gilberto_Jacobson95@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Eum alias eos.'),
					('Norbert_Spinka23','Norbert_Spinka23@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Provident temporibus nesciunt excepturi reprehenderit doloribus'),
					('Yadira.McGlynn','Yadira.McGlynn@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Dicta corrupti dolore in et'),
					('Brisa42','Brisa42@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Eveniet praesentium inventore cupiditate magnam quidem ipsa dolor'),
					('Jeffery_Baumbach96','Jeffery_Baumbach96@mail.com','password','false','api.adorable.io/avatars/#randRange( 1, 1000, "SHA1PRNG" )#','Nostrum maxime voluptas laudantium temporibus ipsa enim sint')
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
					pic_link VARCHAR(256) NOT NULL,
					author_id INT NOT NULL,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO Posts (description, pic_link, author_id)
				VALUES
					('Use the digital THX port, then you can quantify the virtual system!' ,'images.unsplash.com/photo-1456081445129-830eb8d4bfc6?auto=format&fit=crop&w=1358&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('bypassing the array won''t do anything, we need to calculate the primary AI feed!','images.unsplash.com/photo-1467184576221-d5d206ab2707?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Try to transmit the FTP transmitter, maybe it will quantify the 1080p pixel!','images.unsplash.com/photo-1458046913496-b049204810ac?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Use the digital JBOD system, then you can synthesize the neural capacitor!','images.unsplash.com/photo-1508948956644-0017e845d797?auto=format&fit=crop&w=1132&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Use the redundant ADP bus, then you can copy the open-source firewall!','images.unsplash.com/photo-1511717004695-7862a87f4b3d?auto=format&fit=crop&w=928&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('You can''t navigate the alarm without backing up the back-end ADP transmitter!','images.unsplash.com/photo-1507568237455-03228e5ddb7e?auto=format&fit=crop&w=1546&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('transmitting the pixel won''t do anything, we need to quantify the online HDD matrix!','images.unsplash.com/photo-1470617522248-ace6e93315a5?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we bypass the circuit, we can get to the COM system through the open-source FTP system!','images.unsplash.com/photo-1504016652888-14988390a8fa?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('The SMS program is down, program the redundant program so we can calculate the GB pixel!','images.unsplash.com/photo-1511876849877-f8d0d953d2e0?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we reboot the panel, we can get to the RAM alarm through the haptic CSS transmitter!','images.unsplash.com/photo-1482066490729-6f26115b60dc?auto=format&fit=crop&w=1404&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('I''ll parse the online SSL application, that should system the SMTP hard drive!','images.unsplash.com/photo-1446730853965-62433e868929?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('generating the firewall won''t do anything, we need to connect the bluetooth CSS monitor!','images.unsplash.com/photo-1494256997604-768d1f608cac?auto=format&fit=crop&w=1401&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Try to reboot the RAM driver, maybe it will bypass the digital interface!','images.unsplash.com/photo-1417028441456-f283323fe2d6?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we calculate the monitor, we can get to the SMS driver through the haptic IB port!','images.unsplash.com/photo-1512027792141-80e5842b87c8?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('overriding the capacitor won''t do anything, we need to index the haptic PCI interface!','images.unsplash.com/photo-1516399779-1480b4f76df6?auto=format&fit=crop&w=975&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Try to reboot the SSL circuit, maybe it will generate the haptic microchip!','images.unsplash.com/photo-1514917073844-2f691ae526c0?auto=format&fit=crop&w=1352&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we generate the sensor, we can get to the RAM bus through the online SAS pixel!','images.unsplash.com/photo-1484244233201-29892afe6a2c?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('calculating the alarm won''t do anything, we need to override the redundant RAM application!','images.unsplash.com/photo-1436902799100-7eb776a61f79?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('We need to quantify the bluetooth SCSI program!','images.unsplash.com/photo-1483470668053-3d97462011ec?auto=format&fit=crop&w=1351&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('hacking the firewall won''t do anything, we need to compress the auxiliary SQL hard drive!','images.unsplash.com/photo-1490636964683-08937fc7f402?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we connect the array, we can get to the COM circuit through the mobile SAS microchip!','images.unsplash.com/photo-1514866955434-f091a9c8716f?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('I''ll navigate the auxiliary FTP program, that should pixel the SCSI interface!','images.unsplash.com/photo-1508077520137-4c18ff1adb68?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('I''ll calculate the wireless USB system, that should capacitor the TCP array!','images.unsplash.com/photo-1446231855385-1d4b0f025248?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('We need to navigate the cross-platform JSON program!','images.unsplash.com/photo-1424709746721-b8fd0ff52499?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Use the primary COM bus, then you can transmit the digital port!','images.unsplash.com/photo-1505628346881-b72b27e84530?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('You can''t quantify the array without synthesizing the wireless AGP bandwidth!','images.unsplash.com/photo-1506499377715-687ed75d24cd?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('I''ll calculate the 1080p EXE application, that should firewall the AGP driver!','images.unsplash.com/photo-1505044024939-c154d39ca595?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('bypassing the pixel won''t do anything, we need to navigate the digital THX driver!','images.unsplash.com/photo-1452441271666-5d998aa2f6cc?auto=format&fit=crop&w=1351&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('The SDD feed is down, hack the digital panel so we can transmit the PCI array!','images.unsplash.com/photo-1471086615137-166d50188228?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('You can''t quantify the bandwidth without synthesizing the 1080p JSON matrix!','images.unsplash.com/photo-1472157592780-9e5265f17f8f?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Use the haptic RAM application, then you can back up the cross-platform hard drive!','images.unsplash.com/photo-1445066183574-725e943e6282?auto=format&fit=crop&w=958&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('I''ll input the 1080p USB array, that should array the CSS bus!','images.unsplash.com/photo-1507146426996-ef05306b995a?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('The XML driver is down, reboot the primary array so we can input the SSL circuit!','images.unsplash.com/photo-1503514662580-2388029e9434?auto=format&fit=crop&w=1349&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('The SCSI array is down, reboot the open-source monitor so we can calculate the FTP protocol!','images.unsplash.com/photo-1457473075527-b0db85c08e66?auto=format&fit=crop&w=1355&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('You can''t synthesize the bus without copying the multi-byte TCP array!','images.unsplash.com/photo-1470081766425-a75c92adff0b?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('The PNG port is down, parse the wireless system so we can copy the JSON pixel!','images.unsplash.com/photo-1504595403659-9088ce801e29?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we compress the microchip, we can get to the COM matrix through the online SAS system!','images.unsplash.com/photo-1503756506745-833f21a1d537?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Use the primary SCSI application, then you can calculate the bluetooth hard drive!','images.unsplash.com/photo-1502673530728-f79b4cab31b1?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we transmit the protocol, we can get to the XSS driver through the bluetooth AI feed!','images.unsplash.com/photo-1494913148647-353ae514b35e?auto=format&fit=crop&w=1352&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('backing up the driver won''t do anything, we need to input the auxiliary USB program!','images.unsplash.com/photo-1442291928580-fb5d0856a8f1?auto=format&fit=crop&w=1489&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('We need to override the open-source USB capacitor!','images.unsplash.com/photo-1482066490729-6f26115b60dc?auto=format&fit=crop&w=1404&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Try to connect the EXE protocol, maybe it will program the neural sensor!','images.unsplash.com/photo-1503256207526-0d5d80fa2f47?auto=format&fit=crop&w=933&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('If we program the capacitor, we can get to the RAM bus through the mobile THX feed!','images.unsplash.com/photo-1505015390928-f9e55218544f?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('I''ll parse the redundant USB firewall, that should pixel the XML panel!','images.unsplash.com/photo-1498892156743-6d5da30bab8b?auto=format&fit=crop&w=1001&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('I''ll program the primary FTP capacitor, that should pixel the FTP sensor!','images.unsplash.com/photo-1452857297128-d9c29adba80b?auto=format&fit=crop&w=1334&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('parsing the capacitor won''t do anything, we need to synthesize the wireless SMS card!','images.unsplash.com/photo-1458410489211-ba19aa2f2902?auto=format&fit=crop&w=1369&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Try to compress the USB transmitter, maybe it will copy the solid state protocol!','images.unsplash.com/photo-1458530970867-aaa3700e966d?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('We need to reboot the primary FTP bandwidth!','images.unsplash.com/photo-1475518112798-86ae358241eb?auto=format&fit=crop&w=1350&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('We need to calculate the bluetooth SDD array!','images.unsplash.com/photo-1479623186097-2bb07e242ae0?auto=format&fit=crop&w=1352&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Use the auxiliary FTP card, then you can reboot the multi-byte capacitor!','images.unsplash.com/photo-1507320901381-ffe8b30f8e8a?auto=format&fit=crop&w=1352&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('You can''t transmit the microchip without indexing the digital XSS system!','images.unsplash.com/photo-1452563788656-37c252ce6850?auto=format&fit=crop&w=934&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('Use the mobile RSS interface, then you can index the 1080p microchip!','images.unsplash.com/photo-1452721226468-f95fb66ebf83?auto=format&fit=crop&w=1100&q=80',#randRange( 1, 10, "SHA1PRNG" )#),
					('calculating the transmitter won''t do anything, we need to index the mobile IB system!','images.unsplash.com/photo-1447768005573-3b54cdf058a2?auto=format&fit=crop&w=582&q=80',#randRange( 1, 10, "SHA1PRNG" )#)
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS FavoritePosts
				"
			);

			queryExecute("
				CREATE TABLE FavoritePosts (
					id INTEGER PRIMARY KEY,
					post_id INT NOT NULL,
					user_id INT NOT NULL,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					FOREIGN KEY (post_id) REFERENCES Posts(id),
					FOREIGN KEY (user_id) REFERENCES Users(id)
				)
				"
			);

			for (var i = 1; i <= 400; i++){
				queryExecute("
					INSERT INTO FavoritePosts (post_id, user_id)
					VALUES
						(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#)
					"
				);
			}

			queryExecute("
				DROP TABLE IF EXISTS Comments
				"
			);

			queryExecute("
				CREATE TABLE Comments (
					id INTEGER PRIMARY KEY,
					content VARCHAR(512) NOT NULL,
					post_id INT NOT NULL,
					author_id INT NOT NULL,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					FOREIGN KEY (post_id) REFERENCES Posts(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO Comments (post_id, author_id, content)
				VALUES
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'We need to generate the bluetooth ADP feed!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to calculate the SSL hard drive, maybe it will calculate the primary transmitter!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'We need to override the cross-platform RSS array!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'parsing the port won''t do anything, we need to back up the wireless RAM pixel!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'I''ll synthesize the auxiliary SDD firewall, that should interface the SDD panel!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'You can''t connect the application without indexing the auxiliary GB circuit!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'generating the matrix won''t do anything, we need to parse the open-source IB interface!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'You can''t connect the program without synthesizing the virtual CSS capacitor!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Use the haptic SDD bandwidth, then you can synthesize the bluetooth sensor!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Use the redundant HDD monitor, then you can calculate the auxiliary interface!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Use the haptic THX card, then you can generate the wireless feed!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'I''ll quantify the online PNG program, that should feed the FTP hard drive!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to program the SSL microchip, maybe it will hack the bluetooth interface!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we connect the alarm, we can get to the COM firewall through the online PCI interface!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Use the primary SQL bandwidth, then you can copy the virtual feed!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'The RAM interface is down, copy the digital bandwidth so we can connect the USB driver!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we back up the protocol, we can get to the USB port through the auxiliary SAS sensor!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we program the matrix, we can get to the PCI capacitor through the mobile JBOD interface!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to connect the CSS firewall, maybe it will transmit the neural program!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Use the auxiliary XSS alarm, then you can synthesize the virtual circuit!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'You can''t copy the system without connecting the primary RAM protocol!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to transmit the XML hard drive, maybe it will navigate the 1080p panel!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'compressing the program won''t do anything, we need to override the neural PNG capacitor!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we parse the microchip, we can get to the CSS bandwidth through the multi-byte CSS matrix!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'We need to synthesize the multi-byte ADP feed!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to hack the THX alarm, maybe it will connect the redundant hard drive!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we compress the capacitor, we can get to the SQL sensor through the mobile GB monitor!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'We need to copy the haptic JBOD capacitor!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to parse the JSON panel, maybe it will bypass the optical pixel!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to transmit the COM bus, maybe it will parse the open-source protocol!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'copying the circuit won''t do anything, we need to quantify the bluetooth SCSI panel!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to parse the SQL pixel, maybe it will copy the neural bus!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'compressing the firewall won''t do anything, we need to hack the neural SMS bandwidth!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to hack the EXE array, maybe it will program the haptic circuit!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'The ADP capacitor is down, generate the solid state pixel so we can override the FTP bandwidth!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'The USB array is down, connect the redundant microchip so we can navigate the SMTP feed!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'We need to parse the digital SMS pixel!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Use the haptic EXE bandwidth, then you can input the multi-byte transmitter!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'compressing the program won''t do anything, we need to quantify the mobile SMS capacitor!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'I''ll synthesize the back-end RSS firewall, that should system the GB port!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'generating the hard drive won''t do anything, we need to parse the mobile HTTP microchip!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we connect the port, we can get to the THX system through the back-end XML array!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'The CSS sensor is down, quantify the wireless bus so we can navigate the SCSI hard drive!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we parse the matrix, we can get to the PCI transmitter through the bluetooth RSS port!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'Try to synthesize the RAM interface, maybe it will calculate the haptic driver!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'I''ll calculate the redundant SSL firewall, that should card the PNG firewall!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'If we program the panel, we can get to the COM pixel through the wireless HDD application!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'We need to reboot the cross-platform SQL hard drive!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'programming the driver won''t do anything, we need to connect the bluetooth AI array!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'The ADP system is down, hack the back-end bus so we can navigate the SMS panel!'),
					(#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'You can''t copy the hard drive without calculating the primary SMTP panel!')
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS PostLikes
				"
			);

			queryExecute("
				CREATE TABLE PostLikes (
					id INTEGER PRIMARY KEY,
					value INT NOT NULL,
					post_id INT NOT NULL,
					author_id INT NOT NULL,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					FOREIGN KEY (post_id) REFERENCES Posts(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			for (var i = 1; i <= 400; i++){
				queryExecute("
					INSERT INTO PostLikes (post_id, author_id, value)
					VALUES (#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,1)
					"
				);
			}

			queryExecute("
				DROP TABLE IF EXISTS CommentLikes
				"
			);

			queryExecute("
				CREATE TABLE CommentLikes (
					id INTEGER PRIMARY KEY,
					value INT NOT NULL,
					comment_id INT NOT NULL,
					author_id INT NOT NULL,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					FOREIGN KEY (comment_id) REFERENCES Comments(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			for (var i = 1; i <= 150; i++){
				queryExecute("
					INSERT INTO CommentLikes (comment_id, author_id, value)
					VALUES (#randRange( 1, 50, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,1)
					"
				);
			}

			queryExecute("
				DROP TABLE IF EXISTS Messages
				"
			);

			queryExecute("
				CREATE TABLE Messages (
					id INTEGER PRIMARY KEY,
					content VARCHAR(256) NOT NULL,
					message_seen BOOLEAN DEFAULT false,
					author_id INT NOT NULL,
					receiver_id INT NOT NULL,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					FOREIGN KEY (receiver_id) REFERENCES Users(id),
					FOREIGN KEY (author_id) REFERENCES Users(id)
				)
				"
			);

			queryExecute("
				INSERT INTO Messages (author_id, receiver_id, message_seen, content)
				VALUES
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Facere odio et optio.'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Ipsum in eius itaque placeat'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','At quidem dolor quaerat veritatis consequuntur consequatur ea'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Beatae unde aliquid.'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Fugiat explicabo est distinctio rerum'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Voluptatem id porro ut perspiciatis enim earum aspernatur'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Ut est provident et ut qui est'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Impedit consequatur aut qui facere'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Voluptatem et alias sunt architecto quasi nesciunt tenetur'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Optio optio commodi tenetur esse quae nostrum vel soluta ab'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Est quisquam saepe velit enim quas voluptatibus'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Voluptate dolores officiis sint veniam voluptatem dicta voluptas tenetur harum'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Quisquam et qui beatae accusamus omnis'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Tempora ea animi maiores vero vel repellat minus magni'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Incidunt necessitatibus et nemo delectus ex ut'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Voluptatem ut maxime sint sed id consequatur et sit omnis'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Ipsam autem provident et'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Necessitatibus fugiat eum pariatur dolores sequi doloribus eos neque'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Nam dolores eum sit voluptatem ab repellendus similique amet expedita'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Sapiente et labore mollitia minima eum tenetur magnam enim et'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Sit molestiae incidunt magnam velit neque sit'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Blanditiis enim tempora omnis dicta minima'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Nemo in officiis ducimus cumque ratione provident id et'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Adipisci quo inventore aut repellendus dolores'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Iure id vel error.'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Quis qui porro aut enim voluptatem omnis'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Esse fugiat qui ut et rerum quod voluptas'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Et aspernatur distinctio dolorem sequi maxime autem accusamus'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Ut aut neque adipisci.'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Non rerum et amet velit'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Est at rerum quia aliquid quis'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Alias doloremque reiciendis hic maiores quam ex non asperiores'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Rem assumenda sed ipsam'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Rerum ad nostrum aliquid consectetur enim sed'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Aperiam illo adipisci molestiae cumque'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Itaque ducimus odio ut quis perferendis enim voluptas'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Repellat repellendus nisi ducimus impedit perspiciatis aut qui'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Nihil sit eaque distinctio laboriosam'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Vel illum dolorum.'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Quaerat id eligendi et commodi ut recusandae accusamus itaque est'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Et unde doloribus corporis aliquid quisquam est dolorem magni'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Tenetur numquam rerum minima at itaque numquam nam'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Necessitatibus iusto quae voluptatem provident'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Iure consequuntur explicabo omnis voluptatem'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Illum quo et esse molestiae'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Reiciendis itaque molestiae iure et officia iste debitis officiis'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Beatae fuga id placeat corrupti iure ex optio'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Velit qui iusto.'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','In officiis beatae quasi eum sequi et commodi saepe'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Atque eum fugit consequuntur cum architecto velit est odio'),
					(#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#,'true','Nulla officiis animi qui')
				"
			);

			queryExecute("
				DROP TABLE IF EXISTS Follows
				"
			);

			queryExecute("
				CREATE TABLE Follows (
					id INTEGER PRIMARY KEY,
					follower_id INT NOT NULL,
					following_id INT NOT NULL,
					created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
					FOREIGN KEY (follower_id) REFERENCES Users(id),
					FOREIGN KEY (following_id) REFERENCES Users(id)
				)
				"
			);

			for (var i = 1; i <= 150; i++){
				queryExecute("
					INSERT INTO Follows (follower_id,following_id)
					VALUES (#randRange( 1, 10, "SHA1PRNG" )#,#randRange( 1, 10, "SHA1PRNG" )#)
					"
				);
			}

		}
	}
}
