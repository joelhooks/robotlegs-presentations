package org.robotlegs.demos.imagegallery.model
{
	import org.robotlegs.demos.imagegallery.model.vo.Gallery;
	import org.robotlegs.demos.imagegallery.model.vo.GalleryImage;
	import org.robotlegs.mvcs.*;
	
	public class GalleryModel extends Actor
	{
		private var _gallery:Gallery;
		
		public function GalleryModel()
		{
		}
		
		public function get gallery():Gallery
		{
			return this._gallery;
		}
		
		public function set gallery(v:Gallery):void
		{
			this._gallery = v;
			
		}
		
		public function setSelectedImage(selectedImage:GalleryImage):void
		{
			selectedImage.selected = true;
			for each(var image:GalleryImage in this._gallery.photos)
			{
				if(image != selectedImage)
					image.selected = false;
			}
		}
	}
}