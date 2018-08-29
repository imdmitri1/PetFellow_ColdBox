component accessors="true"{

	PostService function init(){

		return this;
	}

	function show(required post_id){
		// -- add currentUserID and post_id
		var post = queryExecute("
			SELECT p.*, u.username, pl.totalLikes, pl2.liked, fl.favorited
			FROM Posts p
			INNER JOIN Users u ON p.author_id = u.id
			LEFT OUTER JOIN (
					SELECT SUM(pl.value) as totalLikes, pl.post_id FROM PostLikes pl GROUP BY pl.post_id
			) pl ON pl.post_id = p.id
			LEFT OUTER JOIN (
					SELECT pl2.value as liked, pl2.post_id FROM PostLikes pl2 WHERE pl2.author_id = :currentUserID GROUP BY pl2.post_id
			) pl2 ON pl2.post_id = p.id
			LEFT OUTER JOIN (
					SELECT fl.id as favorited, fl.post_id FROM FavoritePosts fl WHERE fl.user_id = :currentUserID GROUP BY fl.post_id
			) fl ON fl.post_id = p.id
			WHERE p.id = :post_id
		",
		{currentUserID = {value=1, cfsqltype='cf_sql_integer'},
		 post_id = {value=1, cfsqltype='cf_sql_integer'}},
		{})
		return post;
	}

}
