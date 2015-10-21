package roost.loaders {
    import feathers.core.IFeathersEventDispatcher;

    [Event(name="complete", type="starling.events.Event")]
    [Event(name="ioError", type="starling.events.Event")]
    [Event(name="parseError", type="starling.events.Event")]
    public interface IBundleLoader extends IFeathersEventDispatcher {

        /**
         * Add bundle to load list.
         * @param path
         * @return
         */
        function addTemplatesBundle(path:String):IBundleLoader;

        /**
         * Starts to load add bundles.
         */
        function load():void;
    }
}
