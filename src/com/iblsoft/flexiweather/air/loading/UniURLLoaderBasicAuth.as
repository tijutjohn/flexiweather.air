package com.iblsoft.flexiweather.air.loading
{
	import com.iblsoft.flexiweather.net.interfaces.IURLLoaderBasicAuth;
	import com.iblsoft.flexiweather.net.interfaces.IURLLoaderBasicAuthListener;
	import com.iblsoft.flexiweather.utils.UniURLLoader;
	
	import flash.events.HTTPStatusEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;

	public class UniURLLoaderBasicAuth implements IURLLoaderBasicAuthListener
	{
		private var _basicAuthLoader: IURLLoaderBasicAuth;
		private var _loader: URLLoader;
		public function UniURLLoaderBasicAuth()
		{
		}
		
		public function addBasicAuthListeners(basicAuthLoader: IURLLoaderBasicAuth, urlLoader: URLLoader):void
		{
			_basicAuthLoader = basicAuthLoader;
			_loader = urlLoader;
			_loader.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, onHttpResponseStatus);
			
		}
		
		public function removeBasicAuthListeners():void
		{
			_loader.removeEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, onHttpResponseStatus);
			
		}
		
		private function onHttpResponseStatus(event: HTTPStatusEvent): void
		{
			/*
			trace("onHttpResponseStatus: " + event.responseURL);
			for each( var header: URLRequestHeader in event.responseHeaders )  {
				trace( "name: " + header.name + "\nvalue: " + header.value + "\n" ); 
			}
			*/
			_basicAuthLoader.setResponseHeaders(event.responseHeaders, event.responseURL, event.status, event.currentTarget);
		}
		
	}
}