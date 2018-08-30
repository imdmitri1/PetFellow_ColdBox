/**
 * Manage Comments
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
	 * Display a list of Comments
	 */
	function index( event, rc, prc ){
		// Get resources here

		event.setView( "Comments/index" );
	}

	/**
	 * Return an HTML form for creating one Comments
	 */
	function new( event, rc, prc ){
		event.setView( "Comments/new" );
	}

	/**
	 * Create a Comments
	 */
	function create( event, rc, prc ){
		
	}

	/**
	 * Show a Comments
	 */
	function show( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "Comments/show" );
	}

	/**
	 * Edit a Comments
	 */
	function edit( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "Comments/edit" );
	}

	/**
	 * Update a Comments
	 */
	function update( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}

	/**
	 * Delete a Comments
	 */
	function delete( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}
	
}
