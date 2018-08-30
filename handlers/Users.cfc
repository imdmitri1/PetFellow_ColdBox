/**
 * Manage Users
 * It will be your responsibility to fine tune this template, add validations, try/catch blocks, logging, etc.
 */
component extends="coldbox.system.EventHandler"{
	
	// DI 
	
	// HTTP Method Security
	this.allowedMethods = {
		index  		= "GET", 
		new    		= "GET", 
		create   	= "POST,PUT", 
		show 		= "GET", 
		edit		= "GET",
		update 		= "POST,PUT,PATCH",
		delete 		= "DELETE"
	};
	
	/**
	 * Param incoming format, defaults to `html`
	 */
	function preHandler( event, rc, prc ){
		event.paramValue( "format", "html" );
	}
		
	/**
	 * Display a list of Users
	 */
	function index( event, rc, prc ){
		// Get resources here

		event.setView( "Users/index" );
	}

	/**
	 * Return an HTML form for creating one Users
	 */
	function new( event, rc, prc ){
		event.setView( "Users/new" );
	}

	/**
	 * Create a Users
	 */
	function create( event, rc, prc ){
		
	}

	/**
	 * Show a Users
	 */
	function show( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "Users/show" );
	}

	/**
	 * Edit a Users
	 */
	function edit( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "Users/edit" );
	}

	/**
	 * Update a Users
	 */
	function update( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}

	/**
	 * Delete a Users
	 */
	function delete( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}
	
}
