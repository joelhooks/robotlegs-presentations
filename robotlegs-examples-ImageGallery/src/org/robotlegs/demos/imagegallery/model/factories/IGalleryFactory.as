package org.robotlegs.demos.imagegallery.model.factories
{
	import org.robotlegs.demos.imagegallery.model.vo.Gallery;

	public interface IGalleryFactory
	{
		function createGallery(input:Object, baseURL:String=""):Gallery;
	}
}