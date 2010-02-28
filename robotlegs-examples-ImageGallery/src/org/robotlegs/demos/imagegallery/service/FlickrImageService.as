package org.robotlegs.demos.imagegallery.service
{
	import com.adobe.webapis.flickr.FlickrService;
	import com.adobe.webapis.flickr.events.FlickrResultEvent;
	import com.adobe.webapis.flickr.methodgroups.Photos;
	import com.adobe.webapis.flickr.methodgroups.helpers.PhotoSearchParams;
	
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.model.factories.IGalleryFactory;
	import org.robotlegs.demos.imagegallery.model.vo.Gallery;
	import org.robotlegs.mvcs.Actor;
	
	public class FlickrImageService extends Actor implements IGalleryImageService
	{
		private var service:FlickrService;
		
		[Inject]
		public var galleryFactory:IGalleryFactory;
		
		protected static const FLICKR_API_KEY:String = "516ab798392cb79523691e6dd79005c2";
		
		public function FlickrImageService()
		{
			this.service = new FlickrService(FLICKR_API_KEY);
		}
		
		public function loadGallery():void
		{
			service.addEventListener(FlickrResultEvent.INTERESTINGNESS_GET_LIST, handleImageLoadResult);
			service.interestingness.getList(null,"",20)
		}
		
		protected function handleImageLoadResult(event:FlickrResultEvent):void
		{
			this.processFlickrPhotoResults(event.data.photos.photos);
		}
		
		protected function processFlickrPhotoResults(results:Array):void
		{
			var gallery:Gallery = galleryFactory.createGallery(results);
			dispatch(new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery));
		}
		
	}
}