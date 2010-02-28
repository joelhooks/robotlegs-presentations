package  org.robotlegs.demos.imagegallery.events
{
	
	import org.robotlegs.demos.imagegallery.model.vo.GalleryImage;
	
	import flash.events.Event;

	public class GalleryImageEvent extends Event
	{
		public static const SELECT_GALLERY_IMAGE:String = "selectGalleryImage";
		
		public var image:GalleryImage;
		
		public function GalleryImageEvent(type:String, image:GalleryImage)
		{
			this.image = image;
			super(type, true, true);
		}
		
		override public function clone() : Event
		{
			return new GalleryImageEvent(this.type, this.image);
		}
	}
}