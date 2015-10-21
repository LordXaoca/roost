package roost.templates {
    public interface ITemplatesLoader {
        function addBundle(pathToBundle:String):ITemplatesLoader;

        /**
         * Starts to load add bundles.
         */
        function load():void;
    }
}
