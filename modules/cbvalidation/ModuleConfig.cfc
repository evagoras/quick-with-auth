/**
 * Copyright since 2020 by Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Module Properties
	this.title       = "validation";
	this.author      = "Luis Majano";
	this.webURL      = "https://www.ortussolutions.com";
	this.description = "This module provides server-side validation to ColdBox applications";
	this.version     = "3.4.0+14";

	// Model Namespace
	this.modelNamespace    = "cbvalidation";
	// CF Mapping
	this.cfmapping         = "cbvalidation";
	// Helpers
	this.applicationHelper = [ "helpers/Mixins.cfm" ];

	// Module Dependencies That Must Be Loaded First, use internal names or aliases
	this.dependencies               = [ "cbi18n" ];
	// ColdBox Static path to validation manager
	this.COLDBOX_VALIDATION_MANAGER = "cbvalidation.models.ValidationManager";

	/**
	 * Configure module
	 */
	function configure(){
		// Mixin our own methods on handlers, interceptors and views via the ColdBox UDF Library File setting
		settings = {
			manager           : this.COLDBOX_VALIDATION_MANAGER,
			// i18nResource = "",
			sharedConstraints : {}
		};
	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
		// Did you change the validation manager?
		if ( variables.settings.manager != this.COLDBOX_VALIDATION_MANAGER ) {
			binder
				.map( alias = "validationManager@cbvalidation", force = true )
				.to( variables.settings.manager )
				.asSingleton();
		}
		// setup shared constraints
		wirebox
			.getInstance( "validationManager@cbvalidation" )
			.setSharedConstraints( variables.settings.sharedConstraints );
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}
