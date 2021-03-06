/**
* I am a new handler
*/
component{

	property name="postService" inject="PostService";
	property name="commentService" inject="CommentService";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {
		"show" : "GET"
	};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	/**
	* show
	*/
	function show( event, rc, prc ){
		// prc.post = postService(rc.post_id);
		// prc.comment = commentService.show(rc.post_id);
		prc.comments = commentService.show(1);
		prc.post = postService.show(1);
		event.setView( "posts/show" );
	}

	/**
	* new
	*/
	function new( event, rc, prc ){
		event.setView( "posts/new" );
	}

	/**
	* create
	*/
	function create( event, rc, prc ){
		event.setView( "posts/create" );
	}

	/**
	* edit
	*/
	function edit( event, rc, prc ){
		event.setView( "posts/edit" );
	}

	/**
	* update
	*/
	function update( event, rc, prc ){
		event.setView( "posts/update" );
	}

	/**
	* delete
	*/
	function delete( event, rc, prc ){
		event.setView( "posts/delete" );
	}



}
