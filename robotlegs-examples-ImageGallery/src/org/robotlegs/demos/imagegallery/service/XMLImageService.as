package org.robotlegs.demos.imagegallery.service
{
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.http.HTTPService;
	
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.model.factories.IGalleryFactory;
	import org.robotlegs.demos.imagegallery.model.vo.Gallery;
	import org.robotlegs.mvcs.Actor;
	
	public class XMLImageService extends Actor implements IGalleryImageService
	{
		protected static const BASE_URL:String = "assets/gallery/";
		
		[Inject]
		public var galleryFactory:IGalleryFactory;
		
		public function XMLImageService()
		{
			super();
		}
		
		public function loadGallery():void
		{
			var service:HTTPService = new HTTPService();
			var responder:Responder = new Responder(handleServiceResult, handleServiceFault);
			var token:AsyncToken;
			service.resultFormat = "e4x";
			service.url = BASE_URL+"gallery.xml";
			token = service.send();
			token.addResponder(responder);
		}
		
		protected function handleServiceResult(event:Object):void
		{
			var gallery:Gallery = galleryFactory.createGallery(event.result.image, BASE_URL);
			dispatch(new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery));
		}
		
		protected function handleServiceFault(event:Object):void
		{
			trace(event);
			
		}
	}
}