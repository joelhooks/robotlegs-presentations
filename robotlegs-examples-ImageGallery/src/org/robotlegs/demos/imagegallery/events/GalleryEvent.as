package org.robotlegs.demos.imagegallery.events
{
	import flash.events.Event;
	
	import org.robotlegs.demos.imagegallery.model.vo.Gallery;

	public class GalleryEvent extends Event
	{
		public static const LOAD_GALLERY:String = "loadGallery";
		public static const GALLERY_LOADED:String = "galleryLoaded";
		
		public var gallery:Gallery;
		
		public function GalleryEvent(type:String, gallery:Gallery = null)
		{
			this.gallery = gallery;
			super(type, true, true);
		}
		
		override public function clone() : Event
		{
			return new GalleryEvent(this.type, this.gallery);
		}
	}
}