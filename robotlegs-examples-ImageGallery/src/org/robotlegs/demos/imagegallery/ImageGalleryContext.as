package org.robotlegs.demos.imagegallery
{
	import org.robotlegs.demos.imagegallery.controller.LoadGalleryCommand;
	import org.robotlegs.demos.imagegallery.controller.SetSelectedImageCommand;
	import org.robotlegs.demos.imagegallery.controller.UpdateGalleryCommand;
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.model.GalleryModel;
	import org.robotlegs.demos.imagegallery.model.factories.FlickrGalleryFactory;
	import org.robotlegs.demos.imagegallery.model.factories.IGalleryFactory;
	import org.robotlegs.demos.imagegallery.model.factories.XMLGalleryFactory;
	import org.robotlegs.demos.imagegallery.service.FlickrImageService;
	import org.robotlegs.demos.imagegallery.service.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.service.XMLImageService;
	import org.robotlegs.demos.imagegallery.view.components.GalleryView;
	import org.robotlegs.demos.imagegallery.view.mediators.GalleryViewMediator;
	import org.robotlegs.mvcs.Context;
	
	public class ImageGalleryContext extends Context
	{
		override public function startup() : void
		{
			mediatorMap.mapView( GalleryView, GalleryViewMediator)
				
			commandMap.mapEvent( GalleryEvent.LOAD_GALLERY, LoadGalleryCommand);
			commandMap.mapEvent( GalleryEvent.GALLERY_LOADED, UpdateGalleryCommand);
			commandMap.mapEvent( GalleryImageEvent.SELECT_GALLERY_IMAGE, SetSelectedImageCommand );

			injector.mapSingletonOf( IGalleryImageService, XMLImageService );
			injector.mapSingletonOf( IGalleryFactory, XMLGalleryFactory )
				
			//injector.mapSingletonOf( IGalleryImageService, FlickrImageService );
			//injector.mapSingletonOf( IGalleryFactory, FlickrGalleryFactory )
			injector.mapSingleton( GalleryModel );
			
			
		}
	}
}