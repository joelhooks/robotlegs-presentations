package org.robotlegs.demos.imagegallery.view.mediators
{
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.model.vo.GalleryImage;
	import org.robotlegs.demos.imagegallery.view.components.GalleryView;
	import org.robotlegs.mvcs.Mediator;
	
	public class GalleryViewMediator extends Mediator
	{
		[Inject]
		public var galleryView:GalleryView;
		
		public function GalleryViewMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener( galleryView, GalleryImageEvent.SELECT_GALLERY_IMAGE, onImageSelected )
			eventMap.mapListener( eventDispatcher, GalleryEvent.GALLERY_LOADED, onGalleryLoaded )
			
			eventDispatcher.dispatchEvent( new GalleryEvent( GalleryEvent.LOAD_GALLERY ) );
		}
		
		protected function selectImage(image:GalleryImage):void
		{
			galleryView.imageSource = image.URL;
			dispatch(new GalleryImageEvent(GalleryImageEvent.SELECT_GALLERY_IMAGE, image));
		}
		
		protected function onGalleryLoaded(event:GalleryEvent):void
		{
			galleryView.dataProvider = event.gallery.photos;
			selectImage( event.gallery.photos[0] as GalleryImage );
		}
		
		protected function onImageSelected(event:GalleryImageEvent):void
		{
			this.selectImage(event.image);
		}
	}
}