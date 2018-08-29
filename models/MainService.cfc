/**
* I am a new Model Object
*/
component accessors="true"{

	// Properties


	/**
	 * Constructor
	 */
	MainService function init(){

		return this;
	}

	/**
	* index
	*/
	function index(){
		allPosts = queryExecute("
		    SELECT p.id, p.pictureLink, p.description, p.author_id, u.username, c.content as comment, pl.totalLikes, pl2.liked, fl.favorited
		    FROM Posts p
		    INNER JOIN Users u ON p.author_id = u.id
		    LEFT OUTER JOIN (
		      SELECT c.post_id, c.content FROM Comments c GROUP BY c.post_id
		    ) c ON c.post_id = p.id
		    LEFT OUTER JOIN (
		        SELECT SUM(pl.value) as totalLikes, pl.post_id FROM PostLikes pl GROUP BY pl.post_id
		    ) pl ON pl.post_id = p.id
		    LEFT OUTER JOIN (
		        SELECT pl2.value as liked, pl2.post_id FROM PostLikes pl2 WHERE pl2.author_id = 1 GROUP BY pl2.post_id --current_user_id
		    ) pl2 ON pl2.post_id = p.id
		    LEFT OUTER JOIN (
		        SELECT fl.id as favorited, fl.post_id FROM FavoritePosts fl WHERE fl.user_id = 1 GROUP BY fl.post_id --current_user_id
		    ) fl ON fl.post_id = p.id
		    ORDER BY p.id
				")
		return queryToArray(allPosts);
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
