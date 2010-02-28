package org.robotlegs.demos.imagegallery.model.factories
{
	import com.adobe.webapis.flickr.Photo;
	
	import flash.errors.IOError;
	
	import org.robotlegs.demos.imagegallery.model.vo.Gallery;
	import org.robotlegs.demos.imagegallery.model.vo.GalleryImage;
	
	public class FlickrGalleryFactory implements IGalleryFactory
	{
		public function createGallery(input:Object, baseURL:String=""):Gallery
		{
			var gallery:Gallery = new Gallery();
			var photoArray:Array = input as Array;
			
			if(!photoArray)
				throw new IOError("Flickr Results must be an array of Photo objects")
			
			for each(var flickrPhoto:Photo in photoArray)
			{
				var photo:GalleryImage = new GalleryImage()
				var baseURL:String = 'http://farm' + flickrPhoto.farmId + 
										'.static.flickr.com/' + flickrPhoto.server + '/' + 
										flickrPhoto.id + '_' + flickrPhoto.secret;
				photo.thumbURL = baseURL + '_s.jpg';
				photo.URL = baseURL + '.jpg';
				gallery.photos.addItem( photo );
			}
			
			return gallery;
		}
	}
}