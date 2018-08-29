component accessors="true"{

	CommentService function init(){

		return this;
	}

	function show(required post_id){
		var comments = queryExecute("
			SELECT c.*, cl.totalLikes, cl2.liked, u.username
			FROM comments c
			INNER JOIN Users u ON c.author_id = u.id
			LEFT OUTER JOIN (
					SELECT SUM(cl.value) as totalLikes, cl.comment_id FROM CommentLikes cl GROUP BY cl.comment_id
			) cl ON cl.comment_id = c.id
			LEFT OUTER JOIN (
					SELECT cl2.value as liked, cl2.comment_id FROM CommentLikes cl2 WHERE cl2.author_id = :currentUserID GROUP BY cl2.comment_id
			) cl2 ON cl2.comment_id = c.id
			WHERE c.post_id = :post_id
			ORDER BY 'created_at'
		",
		{currentUserID = {value=1, cfsqltype='cf_sql_integer'},
		 post_id = {value=1, cfsqltype='cf_sql_integer'}},
		{})
		return queryToArray(comments);
	}

	// *******************************************************

	private array function queryToArray(required queryResult) {
		queryArray = [];
		for ( row in queryResult ){
			queryArray.append( row );
		}
		return queryArray;
	}


}
